# unifi-video-mqtt

Modified from the great work of mzac/unifi-video-mqtt


# Introduction
 script can run on your Unifi Video server and push MQTT messages to a broker when motion is detected.

This can be useful for systems like Homeassistant that are lacking motion detection integration with Unifi Video.



Build the Docker Image

```
docker build . -t unifi-video-mqtt
```

run

```
docker run -d --net=host --name unifi-video-mqtt --restart always -v /pathtounifi-video/logs:/var/log/unifi-video unifi-video-mqtt:latest
```

# IMPORTANT!!!
Before starting the service, make sure to edit */usr/local/bin/unifi-video-mqtt.sh* with your specific
settings:

```
# MQTT Vars
MQTT_SERVER="192.168.x.x"
MQTT_PORT="1883"
MQTT_TOPIC_BASE="camera/motion"

# MQTT User/Pass Vars, only use if needed
#MQTT_USER="username"
#MQTT_PASS="password"
#MQTT_ID="yourid"  ## To make it work with hassio

# Camera Defs
CAM1_NAME="camera_name"
CAM1_ID="F0xxxxxxxxxx"
```



Add to configuration.yaml 
```
  - platform: mqtt
    state_topic: "camera/motion/camera_name"
    name: "camera_name"
```
