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
### Using the registry
You can pull the latest docker image using:
```bash
docker pull ghcr.io/arcan-tech/arcan-2-cli-trial:latest
```

### Build your image locally
To build your Docker image, run the following commands after cloning the repository on your machine:
```bash
docker build --target cli --tag ghcr.io/arcan-tech/arcan-2-cli-trial:latest .
```

### Using the docker image
First, create an alias to make it easy for you to run the image.
```bash
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

# Academic citations
If you are using Arcan 2 for academic research, you can cite us as follows:

```bibtex
@ARTICLE{Sas2023tse,
  author={Sas, Darius and Avgeriou, Paris},
  journal={IEEE Transactions on Software Engineering}, 
  title={An Architectural Technical Debt Index Based on Machine Learning and Architectural Smells}, 
  year={2023},
  volume={49},
  number={8},
  pages={4169-4195},
  doi={10.1109/TSE.2023.3286179}
}

@INPROCEEDINGS{Arcelli2017,
  author={Arcelli Fontana, Francesca and Pigazzini, Ilaria and Roveda, Riccardo and Tamburri, Damian and Zanoni, Marco and Di Nitto, Elisabetta},
  booktitle={2017 IEEE International Conference on Software Architecture Workshops (ICSAW)}, 
  title={Arcan: A Tool for Architectural Smells Detection}, 
  year={2017},
  volume={},
  number={},
  pages={282-285},
  doi={10.1109/ICSAW.2017.16}
}
@INPROCEEDINGS{Arcelli2016,
  author={Arcelli Fontana, Francesca and Pigazzini, Ilaria and Roveda, Riccardo and Zanoni, Marco},
  booktitle={2016 IEEE International Conference on Software Maintenance and Evolution (ICSME)}, 
  title={Automatic Detection of Instability Architectural Smells}, 
  year={2016},
  volume={},
  number={},
  pages={433-437},
  doi={10.1109/ICSME.2016.33}
}

```
