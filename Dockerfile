# use alpine as base image
FROM alpine:3.20.1

# Update package index and install openssh-client
# hadolint ignore=DL3018
RUN apk --no-cache add openssh-client

# Create a new user named "runner" with UID 1000
# hadolint ignore=DL3059
RUN adduser -D -u 1000 runner

# Add option to ignore host verification to ssh_config
# hadolint ignore=DL3059
RUN printf "Host *\n\tStrictHostKeyChecking no\n\n" >> /etc/ssh/ssh_config

# Set the user to "runner"
USER runner

# Set the working directory to the home directory of the "runner" user
WORKDIR /home/runner

# Set the default command to "/bin/sh"
CMD [ "/bin/sh" ]