#!/bin/bash

# Variables
SONARQUBE_VERSION="8.6.1.40680"
SONARQUBE_HOME="/opt/sonarqube"
SONARQUBE_PORT="9000"
SONARQUBE_SYSTEMD_SERVICE="sonarqube"

# Update package list and install prerequisites
sudo apt update
sudo apt install -y openjdk-11-jdk unzip

# Download and extract SonarQube
sudo mkdir -p $SONARQUBE_HOME
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-$SONARQUBE_VERSION.zip -P /tmp
sudo unzip /tmp/sonarqube-$SONARQUBE_VERSION.zip -d $SONARQUBE_HOME
sudo ln -s $SONARQUBE_HOME/sonarqube-$SONARQUBE_VERSION $SONARQUBE_HOME/current

# Create a dedicated user for SonarQube
sudo useradd -r -M -s /bin/false sonarqube

# Set proper permissions
# sudo chown -R sonarqube:sonarqube $SONARQUBE_HOME/current
sudo chown -R sonarqube:sonarqube /opt/sonarqube

# Configure SonarQube as a systemd service
sudo tee /etc/systemd/system/$SONARQUBE_SYSTEMD_SERVICE.service <<EOF
[Unit]
Description=SonarQube service
After=syslog.target network.target

[Service]
Type=forking

ExecStart=$SONARQUBE_HOME/current/bin/linux-x86-64/sonar.sh start
ExecStop=$SONARQUBE_HOME/current/bin/linux-x86-64/sonar.sh stop

User=sonarqube
Group=sonarqube
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd and start SonarQube
sudo systemctl daemon-reload
sudo systemctl enable $SONARQUBE_SYSTEMD_SERVICE
sudo systemctl start $SONARQUBE_SYSTEMD_SERVICE

# Print status
sudo systemctl status $SONARQUBE_SYSTEMD_SERVICE
