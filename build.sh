#!/bin/bash
#
# This file builds the entire Phase 1.5 system without needing to clone
# remote repos -- neat, huh? :-)
#

docker build -t cmu-mars/base .
docker build -t cmu-mars/gazebo https://github.com/cmu-mars/cp-gazebo-p15.git
