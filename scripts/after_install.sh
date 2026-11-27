#!/bin/bash
set -euo pipefail
find /usr/share/nginx/html -type d -exec chmod 755 {} +
find /usr/share/nginx/html -type f -exec chmod 644 {} +
chmod 644 /etc/nginx/default.d/spa.conf
# Fail the deployment now if the config is invalid, rather than taking the site down
nginx -t