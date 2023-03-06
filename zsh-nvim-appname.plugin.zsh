nvapp() {
  if [ $# -eq 0 ]; then; echo "Must pass neovim appname" && return 1; fi
  dir="${XDG_CONFIG_HOME:-$HOME/.config}/nvim_${1}"
  if [ -d "${dir}" ]; then
    shift
    NVIM_APPNAME="$(basename ${dir})" nvim ${@}
  else
    echo "${dir} doesn't exist..." && return 1
  fi
}
