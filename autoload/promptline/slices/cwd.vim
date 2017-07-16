fun! promptline#slices#cwd#function_body( options )
  let dir_sep = promptline#symbols#get().dir_sep
  let truncation = promptline#symbols#get().truncation
  let lines = [
    \'function __promptline_cwd {',
    \'  local truncation="' . truncation . '"',
    \'  local first_char',
    \'  local part_count=0',
    \'  local formatted_cwd=""',
    \'  local dir_sep="' . dir_sep . '"',
    \'  local tilde="~"',
    \'',
    \'  local cwd="${PWD/#$HOME/$tilde}"',
    \'',
    \'  # get first char of the path, i.e. tilde or slash',
    \'  [[ -n ${ZSH_VERSION-} ]] && first_char=$cwd[1,1] || first_char=${cwd::1}',
    \'',
    \'  # remove leading tilde',
    \'  cwd="${cwd#\~}"',
    \'',
    \'  if [[ "$cwd" == */* && "$cwd" != "/" ]]; then',
    \'    path="${cwd%/*}"',
    \'    local cwd="${cwd##*/}"',
    \'    path=`echo $path | sed -r ''s|/(.)[^/]*|/\1|g''`',
    \'    cwd="$path$dir_sep$cwd"',
    \'  fi',
    \'',
    \'  if [[ $cwd == /* && $first_char == "/" ]]; then',
    \'    printf "$cwd"',
    \'  else',
    \'    printf "$first_char$cwd"',
    \'  fi',
    \'}',
    \]
  return lines
endfun
