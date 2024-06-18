# Base image with Jenkins installed
FROM jenkins/jenkins:lts

USER root

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    firefox \
    xvfb \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Set up display and other environment variables
ENV DISPLAY=:99
RUN Xvfb :99 -ac &

USER jenkins