#!/bin/bash

# FOUNDATIONAL TOOLS
# Homebrew
install_homebrew() {
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/ryanjohnson/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
}

# Function to verify Homebrew installation
verify_homebrew_installation() {
    echo "Verifying Homebrew installation..."
    if brew --version &>/dev/null; then
        echo "Success: Homebrew is installed correctly and added to PATH."
    else
        echo "Warning: Homebrew installation was not detected. Please ensure it is installed and added to your PATH."
    fi
}

# Oh My Zsh
install_ohmyzsh() {
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

# Git
install_git() {
    echo "Installing Git..."
    brew install git
}

verify_git_installation() {
    echo "Verifying Git installation..."
    if git --version &>/dev/null; then
        echo "Success: Git is installed correctly."
    else
        echo "Warning: Git installation was not detected. Please ensure it is installed and added to your PATH."
    fi
}

# Docker
install_docker() {
    echo "Installing Docker..."
    brew install --cask docker
}

# COMMAND LINE TOOLS
# GitHub CLI
install_ghcli() {
    echo "Installing GitHub CLI..."
    brew install gh
}

# AWS CLI
install_awscli() {
    echo "Installing AWS CLI..."
    brew install awscli
}

# AWS CLI credentials
check_aws_credentials() {
    if [ ! -f ~/.aws/credentials ]; then
        echo "AWS CLI is installed, but credentials are not set up."
        echo "Please run 'aws configure' to set up your AWS credentials."
    else
        echo "AWS CLI credentials are set up."
    fi
}

# Google Cloud SDK
install_gcloud() {
    echo "Installing Google Cloud SDK..."
    brew install --cask google-cloud-sdk
    echo 'source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"' >> ~/.zshrc
    echo 'source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"' >> ~/.zshrc
    source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
    source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
}

# PYTHON DEVELOPMENT TOOLS
# Python3 and pip3
install_python3() {
    echo "Installing Python3..."
    brew install python
    echo "Upgrading pip..."
    pip3 install --upgrade pip
}

# Function to verify Python installation
verify_python3_installation() {
    echo "Verifying Python installation..."
    if python3 --version &>/dev/null; then
        echo "Success: Python3 is installed correctly and added to PATH."
    else
        echo "Warning: Python3 installation was not detected. Please ensure it is installed and added to your PATH."
    fi
}

# Function to install Visual Studio Code
install_vscode() {
    echo "Installing Visual Studio Code..."
    brew install --cask visual-studio-code
}

# Anaconda
install_anaconda() {
    echo "Installing Anaconda..."
    brew install --cask anaconda
    echo 'export PATH="/usr/local/anaconda3/bin:$PATH"' >> ~/.zshrc
    source ~/.zshrc
}

# INFRASTRUCTURE TOOLS
# PostgreSQL
install_postgresql() {
    echo "Installing PostgreSQL..."
    brew install postgresql
    #brew services start postgresql
}

# Terraform
install_terraform() {
    echo "Installing Terraform..."
    brew tap hashicorp/tap
    brew install hashicorp/tap/terraform
}

# Function to verify installations
verify_installations() {
    echo "*** Python3 install being used..."
    which python3
    echo "*** AWS CLI install being used..."
    which aws
    echo "*** Git install being used..."
    which git
    echo "*** Terraform install being used..."
    which terraform
    echo "*** Docker install being used..."
    which Docker
}

# Function to test installations
test_installations() {
    echo "*** Testing AWS CLI installation..."
    aws --version && check_aws_credentials || echo "AWS CLI installation issue."
    
    echo "*** Testing Google Cloud SDK installation..."
    gcloud --version && echo "Google Cloud SDK is installed correctly." || echo "Google Cloud SDK installation issue."
    
}


# Main function to manage installations
main() {
    install_homebrew
    verify_homebrew_installation
    install_ohmyzsh
    install_git
    verify_git_installation
    install_ghcli
    install_docker
    install_awscli
    install_gcloud
    install_python3
    verify_python3_installation
    install_vscode	
    #install_anaconda
    install_postgresql
    install_terraform
    verify_installations
    test_installations
}

# Invoke main function
main
