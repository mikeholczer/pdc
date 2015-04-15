#
# Node.js Dockerfile
#
# based on https://github.com/dockerfile/nodejs
#

# Pull base image.
FROM pdcbase

# Install Node.js
WORKDIR /tmp
RUN apt-get update && apt-get install nodejs npm -y

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
