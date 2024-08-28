#/bin/bash

direnv allow
sed -i '/plugins=(git)/c\plugins=(git direnv)' ~/.zshrc