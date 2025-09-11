#!/bin/bash -x
INSTANCEID=$(curl -s -m 60 http://169.254.169.254/latest/meta-data/instance-id)
# shellcheck disable=SC2154
aws --region "${region}" ec2 associate-address --instance-id "${INSTANCEID}" --allocation-id "${eip-allocation-id}"
