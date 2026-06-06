#!/bin/bash
set -euo pipefail

echo "Deploying groceries"

# frontend

cd /home/brig/dev/groceries/
npm run build

# nginx

sudo cp /home/brig/dev/groceries/deploy/nginx.conf /etc/nginx/conf.d/groceries.conf

sudo nginx -t
sudo systemctl reload nginx

echo "Deployment complete for groceries"
