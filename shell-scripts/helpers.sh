alert_notice () {
  KERNEL=$(uname)
  if [ "$KERNEL" == "Darwin" ]; then
  	say $MESSAGE -v Samantha
  	osascript -e "display notification '$MESSAGE'"
  fi
}
