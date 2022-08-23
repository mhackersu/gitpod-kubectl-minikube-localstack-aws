# GitPod Base Workspace
FROM gitpod/workspace-full

# Set Working Directory
WORKDIR /usr/src/app

# Install localstack
RUN pip install localstack awscli awscli-local

# Get kubectl binary

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Get kubectl checksum

RUN curl -LO "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"

# Validate kubectl checksum

RUN echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check

# Install kubectl

RUN sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Output kubectl version

RUN kubectl version --client

# Install Minikube via Brew

RUN brew install minikube

# Pass start.sh to working directory
COPY --chown=gitpod start.sh /usr/local/bin/start-localstack
