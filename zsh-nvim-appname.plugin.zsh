help_text="Usage: nvapp [-h|--help] [-c|--clean] [-d|--delete] [<nvapp_name>]...

    -h|--help     Display this help text and exit
    -c|--clean    Clean the installation files
    -d|--delete   Delete the configuration directory
"

nvapp() {
  zparseopts -D -E -F - h=help -help=help c=clean -clean=clean d=delete -delete=delete || return 1
  if [ ! -z "${help}" ]; then
    echo "${help_text}"
    return 0
  fi
  if [ $# -eq 0 ]; then; echo "Must pass neovim appname" && return 1; fi
  nvapp_name="nvim_${1}"
  shift
  config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/${nvapp_name}"
  if [ ! -z "${clean}" ]; then
    rm -rf "${XDG_DATA_HOME:-$HOME/.local/share}/${nvapp_name}" \
           "${XDG_STATE_HOME:-$HOME/.local/state}/${nvapp_name}" \
           "${XDG_CACHE_HOME:-$HOME/.cache}/${nvapp_name}"
  fi
  if [ ! -z "${delete}" ]; then
    rm -rf "${config_dir}"
  else
    if [ -d "${config_dir}" ]; then
      NVIM_APPNAME="$(basename ${config_dir})" nvim ${@}
    else
      echo "${config_dir} doesn't exist..." && return 1
    fi
  fi
}
