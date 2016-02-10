args=""
isFollow=""
function parseArgs() {
  while getopts fh OPT ; do
    case $OPT in
       f) isFollow="-f"   ;;
       h) return 2 ;;
      \?) return 1 ;;
    esac
  done
  shift $(expr ${OPTIND} - 1)
  if [ ${#} -ge 2 ] ; then
    return 1 ;
  fi
  args=${@}
}
