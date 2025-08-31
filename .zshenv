#Check if Fx is Not Installed
not_installed() {
  if [ -f $(where $1 | head -n 1 | sed -e 's/\s.*$//') ]
  then 
    return 1
  else 
    return 0
  fi
}
