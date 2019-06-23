iz_complete () {
  KERNEL=$(uname)
  if [ "$KERNEL" == "Darwin" ]; then
  	say "Cluster setup complete" -v Samantha
  	osascript -e 'display notification "Cluster setup complete"'
  fi

  # watch -n 2 kubectl get pods --all-namespaces -o wide
}
