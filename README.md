# Arcan 2 CLI Trial
This repository contains the trial version of Arcan 2 CLI.
Arcan is an automatic tool for software quality analysis and (Architectural) Technical Debt detection, evaluation and visualisation. 
The analysis is available for the following programming languages: Java, C, C++, C#*, Python*.

(Note: * these languages require configuring a language server, or using the dockerized version).

# Usage
## Linux and Windows
Clone the repository, unzip the zipfile in the `bin` directory and then read the [manual](MANUAL.pdf).

Requires Java 17 or later.

## Docker
To build your Docker image, run the following commands after cloning the repository on your machine:
```bash
docker build --target cli --tag ghcr.io/arcan-tech/arcan-2-cli-trial:latest .
alias alias arcan-docker='docker run -it --name arcan-cli --rm -v $(pwd):/data ghcr.io/arcan-tech/arcan-2-cli-trial:latest'
```
Then run it with:
```bash
arcan-docker --help
arcan-docker analyze -i /data/antlr4/ -o /data -l JAVA --all --remote https://github.com/antlr/antlr4
ls arcanOutput
```
**NOTE** your current working directory is mapped to `/data` inside the container, therfore all your input and output paths that you provide to Arcan (i.e. the `-i` and `-o` arguments) must be prefixed with `/data` and your input data must be in your current working directory.

Requires Docker Engine 20.10 or later.

# Documentation
A simple [manual](MANUAL.pdf) is available for download within the repository. It is highly recommended that you read it as it is also contain a step-by-step guide to run Arcan.
Moreover, documentation is available on the official docs [website](https://docs.arcan.tech/2.9.0/). Note that the documentation is focused on the dashboard mainly, therfore, you may find the manual more useful.

# Troubleshooting and Contacts
Feel free to open an issue either here or on the public issues [GitHub repo](https://github.com/Arcan-Tech/arcan-issues-public/issues). For any other inquiry, please contact [Darius Sas](https://github.com/darius-sas).

# Licence
All the contents of this repository are provided under the GNU LESSER GENERAL PUBLIC LICENSE Version 3 (LGPLv3).
