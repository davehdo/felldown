# Getting Started
## Set environmental variables in config/application.yml
```
TWILIO_SID: "***"
TWILIO_TOKEN: "***"
DOMAIN: "ifelldownhelp.me"
SENDGRID_USERNAME: "***"
SENDGRID_PASSWORD: "***"
```

## Creating events
Have your Smart Watch make a GET request to one of the following
```
/events/minorfall?lat=12.23335&lng=-23.56456
/events/majorfall?lat=12.23335&lng=-23.56456
/events/panic?lat=12.23335&lng=-23.56456
/events/medications?lat=12.23335&lng=-23.56456
```
