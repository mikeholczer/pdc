#
# Python Dockerfile
#
# based on https://github.com/dockerfile/python
#

# Pull base image.
FROM pdcbase

# Install Python.
RUN apt-get update
RUN apt-get install -y python
RUN rm -rf /var/lib/apt/lists/*

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
