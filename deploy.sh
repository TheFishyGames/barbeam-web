#!/bin/bash
# Republishes the BarBeam web app + admin page to this repo (GitHub Pages).
# Usage: ./deploy.sh <path-to-fresh-expo-web-export> <path-to-admin.html>
set -euo pipefail
WEBOUT="$1"
ADMIN="$2"
find . -mindepth 1 -maxdepth 1 ! -name .git ! -name CNAME -exec rm -rf {} +
cp -r "$WEBOUT"/. .
cp "$ADMIN" admin.html
cp index.html 404.html
touch .nojekyll   # REQUIRED: without this, GitHub Pages hides the _expo/ folder and the whole app goes blank.
echo "Ready. Review with 'git status', then commit and push."
