#!/usr/bin/env bash

fancy_echo() {
  printf "\n%b\n" "$1"
}

trap 'ret=$?; test $ret -ne 0 && printf "failed\n\n" >&2; exit $ret' EXIT

set -e

fancy_echo "Installing base ruby build dependencies ..."
  sudo aptitude build-dep -y ruby1.9.3

fancy_echo "Installing libraries for common gem dependencies ..."
  sudo aptitude install -y libxslt1-dev libcurl4-openssl-dev libksba8 libksba-dev libqtwebkit-dev libreadline-dev

if [[ ! -d "$HOME/.rbenv" ]]; then
  fancy_echo "Installing rbenv, to change Ruby versions ..."
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv

    if ! grep -qs "rbenv init" ~/.bashrc; then
      printf 'export PATH="$HOME/.rbenv/bin:$PATH"\n' >> ~/.bashrc
      printf 'eval "$(rbenv init - --no-rehash)"\n' >> ~/.bashrc
    fi
fi

if [[ ! -d "$HOME/.rbenv/plugins/rbenv-gem-rehash" ]]; then
  fancy_echo "Installing rbenv-gem-rehash so the shell automatically picks up binaries after installing gems with binaries..."
    git clone https://github.com/sstephenson/rbenv-gem-rehash.git \
      ~/.rbenv/plugins/rbenv-gem-rehash
fi

if [[ ! -d "$HOME/.rbenv/plugins/ruby-build" ]]; then
  fancy_echo "Installing ruby-build, to install Rubies ..."
    git clone https://github.com/sstephenson/ruby-build.git \
      ~/.rbenv/plugins/ruby-build
fi

ruby_version="2.1.5"

if [[ ! $(echo $PATH | grep "$HOME/.rbenv/bin") ]]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

fancy_echo "Installing Ruby $ruby_version ..."
  rbenv install -s "$ruby_version"

fancy_echo "Setting $ruby_version as global default Ruby ..."
  rbenv global "$ruby_version"
  rbenv rehash

fancy_echo "Creating gemrc file ..."
  cat <<GEMRC > $HOME/.gemrc
:verbose: true
:update_sources: true
:backtrace: false
:bulk_threshold: 1000
:benchmark: false
gem: --no-ri --no-rdoc
GEMRC

fancy_echo "Updating to latest Rubygems version ..."
  gem update --system

fancy_echo "Installing Bundler to install project-specific Ruby gems ..."
  gem install bundler


# rails new . -T --database=postgresql --skip-bundle




