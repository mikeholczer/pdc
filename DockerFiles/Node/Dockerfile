#
# Node.js Dockerfile
#
# based on https://github.com/dockerfile/nodejs
#

# Pull base image.
FROM pdcpython

# Install Node.js
WORKDIR /tmp
RUN wget http://nodejs.org/dist/v0.12.0/node-v0.12.0.tar.gz
RUN tar xvzf node-v0.12.0.tar.gz
RUN rm -f node-v0.12.0.tar.gz
WORKDIR /tmp/node-v0.12.0
RUN ./configure
RUN CXX="g++ -Wno-unused-local-typedefs" make
RUN CXX="g++ -Wno-unused-local-typedefs" make install
WORKDIR /tmp
RUN rm -rf /tmp/node-v*
RUN npm install -g npm
RUN echo '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
