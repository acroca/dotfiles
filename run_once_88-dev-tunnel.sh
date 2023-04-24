#!/bin/sh

launchctl load ~/Library/LaunchAgents/dev-tunnel.plist
launchctl start com.domain.dev-tunnel
