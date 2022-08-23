# GitPod Base Workspace
FROM gitpod/workspace-full

# Set Working Directory
WORKDIR /usr/src/app

# Install localstack
RUN pip install localstack awscli awscli-local

# Pass start.sh to working directory
COPY start.sh /usr/local/bin/start-localstack
