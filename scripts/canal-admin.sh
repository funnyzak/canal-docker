#!/bin/bash
bash /opt/canal/canal-admin/bin/startup.sh

sleep 3

tail -f logs/admin.log