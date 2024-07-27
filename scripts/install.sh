#!/bin/bash

# Function to install a program if it is not already installed
install_if_not_present() {
    if ! command -v $1 &> /dev/null; then
        echo "$1 is not installed. Installing..."
        sudo dnf install -y $1
    else
        echo "$1 is already installed."
    fi
}

# Check if the user is using zsh
if [[ $SHELL != *"zsh"* ]]; then
    echo "zsh is not the current shell. Installing zsh..."
    sudo dnf install -y zsh

    echo "Changing the shell to zsh..."
    chsh -s $(which zsh)

    echo "Switching to zsh..."
    exec zsh

    echo "Shell changed to zsh."
else
    echo "zsh is already the current shell."
fi

# Install oh-my-zsh if not present
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "oh-my-zsh is not installed. Installing..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh is already installed."
fi

# Install alacritty if not present
install_if_not_present alacritty

# Install stow if not present
install_if_not_present stow

# Install zsh-autosuggestions if not present
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ] || [ -z "$(ls -A ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions)" ]; then
    echo "zsh-autosuggestions is not installed. Installing..."
    rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
else
    echo "zsh-autosuggestions is already installed."
fi

# Install zsh-syntax-highlighting if not present
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ] || [ -z "$(ls -A ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting)" ]; then
    echo "zsh-syntax-highlighting is not installed. Installing..."
    rm -rf ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
else
    echo "zsh-syntax-highlighting is already installed."
fi

echo "All installations and checks are complete."
