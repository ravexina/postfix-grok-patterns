#!/bin/sh

#
# This script is used to test the config syntax of the 50-filter-postfix.conf file.
#
# The configuration file is validated using the logstash --config.test_and_exit command in a docker container.
#

set -eux

docker run --rm -it \
  --volume "$(pwd)"/postfix.grok:/etc/logstash/patterns.d/postfix.grok \
  --volume "$(pwd)"/50-filter-postfix.conf:/usr/share/logstash/pipeline/50-filter-postfix.conf \
  logstash:8.14.1 \
  logstash --config.test_and_exit -f /usr/share/logstash/pipeline/50-filter-postfix.conf
