#!/bin/bash
#
# This file builds the entire Phase 1.5 system without needing to clone
# remote repos -- neat, huh? :-)
#

docker build -t cmu-mars/base       .
docker build -t cmu-mars/gazebo     https://github.com/ChrisTimperley/cp-gazebo-p15.git
docker build -t cmu-mars/ig-server  https://github.com/ChrisTimperley/ig-action-server-p15.git
