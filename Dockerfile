# Create docker file from alpine base image, install ssh client

FROM alpine:latest

RUN apk update && apk add openssh-client


# add option to ignore host verification
RUN echo "Host *\n\tStrictHostKeyChecking no\n\n" >> /etc/ssh/ssh_config

CMD [ "/bin/sh" ]

