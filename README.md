# How to Run OpenToonix

[![Test Makefile](https://github.com/OpenToonix/How-to-Run-OpenToonix/actions/workflows/test-makefile.yml/badge.svg)](https://github.com/OpenToonix/How-to-Run-OpenToonix/actions/workflows/test-makefile.yml)

This is a step-by-step guide on how to run OpenToonix.

<details>
    <summary>
        <strong>Table of contents</strong>
        (click to open)
    </summary>

- [Requirements](#requirements)
- [Running OpenToonix](#running-opentoonix)

    - [Running Using Makefile](#running-using-makefile)
    - [Running Using Only Necessary Software](#running-using-only-necessary-software)
</details>

## Requirements

- **[Java](https://docs.aws.amazon.com/corretto/latest/corretto-17-ug/downloads-list.html) Version 17 (Opyional when using [make](#running-using-makefile))** - For running both HTTP and RTMP servers
- **[Docker](https://www.docker.com/)** - For running OpenToonix in a Docker container
- **[Node.js](https://nodejs.org/) Version 22 (Optional when using [make](#running-using-makefile))** - For running both AMF server and Assets Gateway
- **[Make](https://www.gnu.org/software/make/) (Only for Windows 10/11 and Debian-based Linux distributions) (Optional when using necessary software to run OpenToonix)** - For running OpenToonix using the Makefile
- **[Red5 Server](https://github.com/Red5/red5-server) Version 1.3.25 (Optional when using [make](#running-using-makefile))** - For running RTMP server

## Running OpenToonix

### Running Using Makefile

For running OpenToonix using the Makefile, follow the following steps:

1. Download the `Makefile` from this repository.
2. If you haven't installed any of the necessary software for running OpenToonix,
   run the command `make all` for installing all necessary software
   and running OpenToonix and skip the following steps.
   Otherwise, run any of the following commands
   to install missing software or skip this step:

    ```bash
    # Install Java
    $ make install-jdk

    # Install Node.js
    $ make install-node

    # Install Red5 Server
    $ make install-red5
    ```
3. Run OpenToonix by running the command `make run`.

**Note:** For Debian-based Linux distributions,
you will need to have `wget` installed
by running the command `sudo apt install wget`.

**Note:** For Windows, you will need to use Windows Subsystem for Linux (WSL),
or install `make` using `Chocolatey` by running the command `choco install make`
and then run necessary `make` commands
from [Git Bash](https://git-scm.com/downloads) or [Cygwin](https://www.cygwin.com/install.html).

### Running Using Only Necessary Software

For running OpenToonix using only necessary software,
check out the following links for running each component:

- [HTTP Server](https://github.com/OpenToonix/OpenToonix-HTTP-Server?tab=readme-ov-file#opentoonix-http-server)
- [AMF Server](https://github.com/OpenToonix/OpenToonix-AMF-Server?tab=readme-ov-file#opentoonix-amf-server)
- [RTMP Server](https://github.com/OpenToonix/OpenToonix-RTMP-Server?tab=readme-ov-file#opentoonix-rtmp-server)
- [Assets Gateway](https://github.com/OpenToonix/OpenToonix-Assets-Gateway?tab=readme-ov-file#opentoonix-assets-gateway)
