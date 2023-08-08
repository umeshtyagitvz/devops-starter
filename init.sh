#!/bin/sh
# Install tools
if [ ! -d "$HOME/.asdf" ]
then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
    echo ". $HOME/.asdf/asdf.sh" >> ~/.shellrc
fi

# AWSUME setup
echo 'alias awsume=". awsume"' >> ~/.shellrc

cat ~/.shellrc >> ~/.bashrc
cat ~/.shellrc >> ~/.zshrc

cp .default-python-packages $HOME/.default-python-packages

asdf plugin-add python
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git
asdf plugin add awscli
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin-add kubectl https://github.com/asdf-community/asdf-kubectl.git
asdf plugin-add kubectx https://github.com/virtualstaticvoid/asdf-kubectx.git
asdf plugin-add kubetail https://github.com/janpieper/asdf-kubetail.git
asdf plugin-add kind https://github.com/reegnz/asdf-kind.git
asdf plugin-add terraform https://github.com/asdf-community/asdf-hashicorp.git
asdf plugin-add terraform-ls https://github.com/asdf-community/asdf-hashicorp.git
asdf plugin-add helm https://github.com/Antiarchitect/asdf-helm.git
asdf plugin-add rust https://github.com/code-lever/asdf-rust.git

cp .tool-versions $HOME/.tool-versions

# Pre-install python in order to install other plugins,
# which need python installed before hand: [poetry]
asdf install python
asdf install poetry
# https://stackoverflow.com/a/64434542
# To support poetry venvs in project folders for easy vscode access
poetry config virtualenvs.in-project true


cd $HOME && asdf install

