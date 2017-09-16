#!/bin/bash -ex

install_apt_packages() {
  sudo apt-get -qq update
  sudo apt-get -y upgrade
  sudo apt-get install -y zip unzip \
      gcc g++ make \
      global tig tree jq dos2unix \
      vim
}

install_bash_profile() {
  mkdir -p ${HOME}/.bash.d
  cp .bash_profile ${HOME}/
}

install_packages() {
  ./install_ruby.sh
  ./install_node.sh
  ./install_golang.sh
  ./install_java.sh
}

install_apt_packages
install_bash_profile
curl -L raw.github.com/koooge/dotfiles/master/install.sh | bash

install_packages
