#!/usr/bin/env bash

set -e

#### Add epel
sudo yum install -y epel-release

#### Install pip3
sudo yum install -y python34
sudo yum install -y python34-setuptools

##create venv for aws cli
mkdir -p ~/.virtualenvs/awscli
python3.4 -m venv ~/.virtualenvs/awscli

##save the env in user home
echo "export PATH=$PATH:~/.virtualenvs/awscli/bin/" >> $HOME/setenv_awscli.sh
echo ". ~/.virtualenvs/awscli/bin/activate" >> $HOME/setenv_awscli.sh

if [ -f $HOME/setenv_awscli.sh ]; then
    . $HOME/setenv_awscli.sh
fi

#### AWS CLI
pip3 install awscli --force-reinstall --upgrade