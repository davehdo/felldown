# Introduction
This is a web application that acts as a real time dashboard to track an elderly family member. The family member wears a smartwatch to detect falls or acknowledge medication reminders, and the wifi enabled watch sends messages to this app. This was built in Ruby on Rails for PennApps Fall 2014.

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
