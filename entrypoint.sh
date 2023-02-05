#!/bin/bash
bash /opt/canal/canal-adapter/bin/startup.sh

sleep 3

tail -f logs/adapter/adapter.log