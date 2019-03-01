FROM ubuntu:latest

MAINTAINER Me

# Update package cache
RUN apt-get update -y

# Install required packages
RUN apt-get install \
        apt-utils \
        net-tools \
        bash \
        inotify-tools \
        mosquitto-clients \
        -y

# Get script and move to the right place
COPY ./unifi-video-mqtt.sh /usr/local/bin

# Make script executable
RUN chmod a+x /usr/local/bin/unifi-video-mqtt.sh

# Make unifi log directory
RUN mkdir -p /var/log/unifi-video

# Start log monitoring
ENTRYPOINT ["/usr/local/bin/unifi-video-mqtt.sh"]

