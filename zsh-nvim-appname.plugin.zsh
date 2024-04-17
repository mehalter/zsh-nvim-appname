nvapp() {
  zparseopts -D -F - h=help -help=help c=clean -clean=clean d=delete -delete=delete || return 1
  if [ -n "${help}" ]; then
    echo "Usage:
  nvapp [-h|--help] [-c|--clean] [-d|--delete] <nvapp_name> ...

Options:
  -h|--help     Display this help text and exit
  -c|--clean    Clean the installation files
  -d|--delete   Fully delete the neovim app
  <appname>     The name of the neovim app in \$XDG_CONFIG_HOME
                (Example. ~/.config/nvim_<appname>)
  ...           any arguments passed to neovim"
    return 0
  fi
  if [ $# -eq 0 ]; then; echo "Must pass neovim appname" && return 1; fi
  local nvapp_name="nvim_${1}"
  shift
  local config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/${nvapp_name}"
  if [ -n "${clean}" ] || [ -n "${delete}" ]; then
    rm -rf "${XDG_DATA_HOME:-$HOME/.local/share}/${nvapp_name}" \
           "${XDG_STATE_HOME:-$HOME/.local/state}/${nvapp_name}" \
           "${XDG_CACHE_HOME:-$HOME/.cache}/${nvapp_name}"
  fi
  if [ -n "${delete}" ]; then
    rm -rf "${config_dir}"
  else
    if [ -d "${config_dir}" ]; then
      NVIM_APPNAME="$(basename ${config_dir})" nvim ${@}
    else
      echo "${config_dir} doesn't exist..." && return 1
    fi
  fi
}
