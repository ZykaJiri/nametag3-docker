# Use Python base image
FROM python:3.9-slim

# Install git, wget, unzip and required system dependencies
RUN apt-get update && apt-get install -y \
    git \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Clone the repository
RUN git clone https://github.com/ufal/nametag3.git .

# Create virtual environment and install requirements
RUN python3 -m venv venv && \
    ./venv/bin/pip3 install -r requirements.txt

# Make a directory for models and download/extract the Czech model
RUN mkdir -p models && \
    wget "https://lindat.mff.cuni.cz/repository/xmlui/bitstream/handle/11234/1-5677/nametag3-czech-cnec2.0-240830.zip?sequence=1&isAllowed=y" -O czech-model.zip && \
    unzip czech-model.zip -d models/ && \
    rm czech-model.zip

# Expose port for server (default is 8001)
EXPOSE 8001

# Set the entrypoint to the server script
ENTRYPOINT ["./venv/bin/python3", "./nametag3_server.py"]

# Default command matching the exact server parameters
CMD ["8001", "cs", "czech-cnec2.0-240830:cs:ces", "./models/nametag3-czech-cnec2.0-240830/", "czech-cnec2_acknowledgements"]