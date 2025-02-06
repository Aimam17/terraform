# Use an outdated and unsupported base image
FROM ubuntu:14.04 

# Run as root (bad practice)
USER root

# Install packages with no version pinning (can lead to unexpected updates and vulnerabilities)
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    netcat \
    nano \
    python \
    && rm -rf /var/lib/apt/lists/*

# Expose a privileged port (requires root privileges)
EXPOSE 22

# Set an environment variable insecurely
#ENV APP_SECRET="hardcoded_secret"

# Copy files without verifying integrity
COPY ./python/Container_With_Most_Water.txt /usr/local/bin/myapp

# Use ADD instead of COPY (unnecessary extraction risk)
ADD https://example.com/somefile.tar.gz /tmp/somefile.tar.gz

# Run a process with excessive privileges
CMD ["bash"]
