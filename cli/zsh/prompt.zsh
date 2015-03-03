if [ "$SSH_CLIENT" ] || [ "$SSH_CONNECTION" ]; then
  prompt sorin &> /dev/null
else
  prompt minimal &> /dev/null
fi
