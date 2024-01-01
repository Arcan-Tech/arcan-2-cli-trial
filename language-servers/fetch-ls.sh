#!/bin/bash
set -e

echo "Fetching language servers binaries."

# C#
mkdir -p csharp
if [[ ! (-d csharp/omnisharp) ]]; then
  echo "Downloading OmniSharp for Linux..."
#  wget -qO omnisharp.zip https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.39.2/omnisharp-linux-x64-net6.0.zip
  wget -qO omnisharp.zip https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.39.2/omnisharp-linux-x86.zip
  mkdir -p csharp/omnisharp
  unzip -d csharp/omnisharp omnisharp.zip
  rm omnisharp.zip
#  chmod +x "$(pwd)"/csharp/omnisharp/OmniSharp
  chmod +x "$(pwd)"/csharp/omnisharp/run
else
  echo "OmniSharp is already downloaded."
fi

# Java
#mkdir -p java
#if [[ ! (-d java/jdtls) ]]; then
#  echo "Downloading Eclipse JDTLS..."
#  wget -qO jdtls.tar.gz https://download.eclipse.org/jdtls/milestones/1.6.0/jdt-language-server-1.6.0-202111261512.tar.gz
#  mkdir -p java/jdtls
#  tar -C java/jdtls -xzvf jdtls.tar.gz
#  rm jdtls.tar.gz
#else
#  echo "Eclipse JDTLS is already downloaded."
#fi

# Python
if [[ ! (-d python/pyright/node_modules/pyright) ]]; then
  echo "Installing Pyright..."
  mkdir -p python/pyright
  npm install --prefix python/pyright -g pyright@1.1.298
else
  echo "Pyright is already installed."
fi

