#!/bin/bash
bash /opt/canal/canal-server/bin/startup.sh

sleep 3

tail -f logs/canal/canal.log