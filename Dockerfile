# use alpine as base image
FROM alpine:latest

# Update package index and install openssh-client
RUN apk --no-cache add openssh-client

# Create a new user named "runner" with UID 1000
RUN adduser -D -u 1000 runner

# Add option to ignore host verification to ssh_config
RUN echo -e "Host *\n\tStrictHostKeyChecking no\n\n" >> /etc/ssh/ssh_config

# Set the user to "runner"
USER runner

# Set the working directory to the home directory of the "runner" user
WORKDIR /home/runner

# Set the default command to "/bin/sh"
CMD [ "/bin/sh" ]

