#!/bin/bash


apt-get install -y --no-install-recommends snapd

snap install amazon-ssm-agent --classic

snap list amazon-ssm-agent

snap start amazon-ssm-agent

snap services amazon-ssm-agent