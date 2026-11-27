#!/bin/bash
set -euo pipefail
mkdir -p /usr/share/nginx/html
rm -rf /usr/share/nginx/html/*
rm -f /etc/nginx/default.d/spa.conf