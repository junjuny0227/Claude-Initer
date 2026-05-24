#!/bin/bash
set -e

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

cd "$(dirname "$0")/.."

docker build -t claude-trigger .

docker run -d \
  --name claude-trigger \
  --restart unless-stopped \
  --env-file "$(dirname "$0")/../trigger.env" \
  claude-trigger