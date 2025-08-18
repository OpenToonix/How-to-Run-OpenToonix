# Makefile for installing Amazon Corretto 17 (OpenJDK), latest version of Node.js 22 (via NVM), and Red5 Server 1.2.29
# Supports both Linux and Windows (with Git Bash, Cygwin, or WSL)

# Default to Linux or Windows based on the environment
UNAME_S := $(shell uname -s)
CORRETTO_VERSION := 17
RED5_VERSION := 1.2.29
RED5_FILENAME := red5-server-${RED5_VERSION}.zip

.PHONY: help all install install-jdk install-node install-red5

# Help target to display usage instructions
help:
	@echo "Usage:"
	@echo "  make all          - Install Amazon Corretto 17, latest Node.js 22, and Red5 Server 1.2.29 and run OpenToonix"
	@echo "  make install-jdk  - Install Amazon Corretto 17 (OpenJDK)"
	@echo "  make install-node - Install latest Node.js 22 using NVM"
	@echo "  make install-red5 - Download Red5 Server 1.2.29"
	@echo "  make help         - Show this help message"

# Install necessary components for both Linux and Windows and run a OpenToonix instance
all: install

# Install Amazon Corretto 17 (OpenJDK), latest Node.js 22, and Red5 Server 1.2.29
install: install-jdk install-node install-red5

# Install Amazon Corretto 17 (OpenJDK)
install-jdk:
ifeq ($(OS),Windows_NT)
	@echo "Installing Amazon Corretto 17 (Windows)..."
	curl -LO "https://corretto.aws/downloads/latest/amazon-corretto-${CORRETTO_VERSION}-x64-windows-jdk.msi"
	msiexec.exe /i amazon-corretto-$(CORRETTO_VERSION)-x64-windows-jdk.msi /qn
	@echo "Amazon Corretto 17 installed (Windows)."
else
	@if [ "$(UNAME_S)" = "Linux" ]; then \
		echo "Installing Amazon Corretto 17 (Linux)..."; \
		sudo apt-get update && sudo apt-get install -y wget apt-transport-https; \
		wget -O- https://apt.corretto.aws/corretto.key | sudo gpg --dearmor -o /usr/share/keyrings/corretto-keyring.gpg; \
		echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" | sudo tee /etc/apt/sources.list.d/corretto.list; \
		sudo apt-get update && sudo apt-get install -y java-17-amazon-corretto-jdk; \
		echo "Amazon Corretto 17 installed (Linux)."; \
	fi
endif

# Install latest Node.js 22 using NVM
install-node:
ifeq ($(OS),Windows_NT)
	@echo "Installing NVM for Windows..."
	curl -LO "https://github.com/coreybutler/nvm-windows/releases/latest/download/nvm-setup.exe"
	./nvm-setup.exe /SILENT
	@echo "NVM for Windows installed."
	@echo "Installing latest Node.js 22.x using NVM (Windows)..."
	@echo "Please open a new terminal and run the following to install the latest Node.js 22.x:"
	@echo "    nvm install 22"
	@echo "    nvm use 22"
else
	@if [ "$(UNAME_S)" = "Linux" ]; then \
		echo "Installing NVM (Linux)..."; \
		curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash; \
		export NVM_DIR="$$HOME/.nvm"; \
		[ -s "$$NVM_DIR/nvm.sh" ] && . "$$NVM_DIR/nvm.sh"; \
		echo "Installing latest Node.js 22.x using NVM..."; \
		nvm install 22; \
		nvm alias default 22; \
		nvm use default; \
		echo "Latest Node.js 22.x installed (Linux)."; \
	fi
endif

# Download Red5 Server 1.2.29
install-red5:
ifeq ($(OS),Windows_NT)
	@echo "Downloading Red5 Server $(RED5_VERSION) (Windows)..."
	curl -LO "https://github.com/Red5/red5-server/releases/download/v$(RED5_VERSION)/$(RED5_FILENAME)"
	@echo "Red5 Server $(RED5_VERSION) downloaded (Windows)."
else
	@if [ "$(UNAME_S)" = "Linux" ]; then \
		echo "Downloading Red5 Server $(RED5_VERSION) (Linux)..."; \
		wget "https://github.com/Red5/red5-server/releases/download/v$(RED5_VERSION)/$(RED5_FILENAME)"; \
		echo "Red5 Server $(RED5_VERSION) downloaded (Linux)."; \
	fi
endif
