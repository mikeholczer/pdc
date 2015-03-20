#
# NatMan Dockerfile
#

# Pull base image.
FROM pdcnode

# Install NatMan
# Fork of NatMan with support for unmapping and exiting on SIGTERM (rather than just SIGINT)
# Once/if PR https://github.com/Marak/natman/pull/5 is merged, then the forked version will not be needed
RUN apt-get update && apt-get install git
RUN git clone https://github.com/mikeholczer/natman.git
WORKDIR /data/natman
RUN npm install -g
# Define default command.
CMD ["natman", "open", "22", "12345", "-g", "192.168.0.1"]
