#!/bin/bash
set -euo pipefail
if systemctl is-active --quiet nginx; then
  systemctl reload nginx
else
  systemctl start nginx
fi