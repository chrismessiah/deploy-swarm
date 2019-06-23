iz_complete () {
  KERNEL=$(uname)
  if [ "$KERNEL" == "Darwin" ]; then
  	say "Swarm setup complete" -v Samantha
  	osascript -e 'display notification "Swarm setup complete"'
  fi

  # watch -n 2 kubectl get pods --all-namespaces -o wide
}
