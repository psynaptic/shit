set -e

if [[ -z $SHIT ]]; then
  export SHIT=~/.shit
fi

if [[ -d $SHIT ]]; then
  echo "\033[0;31mShit is already installed. Please remove $SHIT if you want to re-install.\033[0m"
  exit 1
fi

echo "\033[0;33mInstalling Shit...\033[0m"
hash git &>/dev/null || {
  echo "\033[0;31mgit not installed\033[0m"
}
git clone https://github.com/psynaptic/shit.git $SHIT

# Calculate the bash profile.
if [ -f "$HOME/.profile" ]; then
  bash_profile="$HOME/.profile"
elif [ -f "$HOME/.bash_profile" ]; then
  bash_profile="$HOME/.bash_profile"
elif [ -f "$HOME/.bashrc" ]; then
  bash_profile="$HOME/.bashrc"
fi
if [[ -n $bash_profile ]]; then
  echo "source $SHIT/.shit_profile" >> $bash_profile
fi

zsh_profile="$HOME/.zshrc"
if [[ -n $zsh_profile ]]; then
  echo "source $SHIT/.shit_profile" >> $bash_profile
fi

echo "\033[0;33mSourcing $PROFILE\033[0m"
source $SHIT/.shit_profile

echo "\033[0;32mDone\033[0m"
