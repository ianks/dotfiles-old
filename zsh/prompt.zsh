if [ "$SSH_CLIENT" ] || [ "$SSH_CONNECTION" ]; then
  prompt minimal &> /dev/null

else
  prompt sorin &> /dev/null
fi
