#!/bin/bash -ue

# Setup
ARGS="${*}"

# Short optioin only
args=""
is_follow=""
g_value=""
parse_short_option() {
  while getopts fgh OPT ; do
    case $OPT in
       f) is_follow="-f"   ;;
       g) g_value=${OPTARG} ;;
       h) return 2 ;;
      \?) return 1 ;;
    esac
  done
  shift "$((OPTIND - 1))"
  if [ ${#} -ge 2 ] ; then
    return 1 ;
  fi
  args="${*}"
}

parse_short_option "${ARGS}"
echo "${args}"
echo "${is_follow}"
echo "${g_value}"

# long option 1 - getoptsとwhileの複合 FIXME: 値付きのがだめかも(-c hoge)
# http://keens.github.io/blog/2014/02/19/option-parse-for-shell/
OPTS_RSYNC_OPTS="-aI"
parse_long_options() {
  while [ "$#" -gt 0 ] ; do
    arg="${1}" ; shift
    case "${arg}" in
      --delete) OPTS_RSYNC_OPTS="${OPTS_RSYNC_OPTS} --delete";;
      --) break;;
      --*) ;;
      -*)
      OPTIND=1
      while getopts "c:nv" OPT "${arg}"; do
        case $OPT in
          c) echo "${OPTARG}" ;;
          n) OPTS_RSYNC_OPTS="${OPTS_RSYNC_OPTS} -n" ;;
          v) OPTS_RSYNC_OPTS="${OPTS_RSYNC_OPTS} -v" ;;
          \?) return 1 ;;
        esac
      done
    esac
  done
}
parse_long_options "${ARGS}"

# long option 2 - 独自実装
# Refs: http://qiita.com/b4b4r07/items/dcd6be0bb9c9185475bb
OPTS_RSYNC_OPTS="-aI"
OPTS_IS_QUIET=""
OPTS_CONF_FILE=""
parse_long_options_for() {
  for OPT in "${@}" ; do
    case $OPT in
      '--delete') OPTS_RSYNC_OPTS="${OPTS_RSYNC_OPTS} --delete" ; shift ;;
      '--debug') trap 'read -p "${LINENO}: $BASH_COMMAND"' DEBUG; shift ;;
      '-c')
        if [[ -z "${2}" ]] || [[ "${2}" =~ ^-+ ]] ; then
          echo "distribution.sh: option requires an argument -- ${1}" 1>&2
        fi
        OPTS_CONF_FILE="${2}"; shift 2 ;;
      '-h') echo "${USAGE}" 1>&2; return 1 ;;
      '-n') OPTS_RSYNC_OPTS="${OPTS_RSYNC_OPTS} -n"; shift ;;
      '-q') OPTS_IS_QUIET="-q"; shift ;;
      '-v') OPTS_RSYNC_OPTS="${OPTS_RSYNC_OPTS} -v"; shift ;;
      '--') shift; break ;;
      -*) (echo "distribution.sh: illegal option -- ${1}"; echo "${USAGE}") 1>&2; return 1;;
    esac
  done
}
parse_long_options_for "${ARGS}"
echo "${OPTS_CONF_FILE}"
echo "${OPTS_IS_QUIET}"

