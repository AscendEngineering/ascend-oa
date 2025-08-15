#!/bin/bash
set -e

# Set email for GPG signing
EMAIL="apoorv@ascendengineer.com"

# Copy the .deb file into the current folder
cp /home/apoorv/sf45_oa/ascend-oa.deb .

# Generate Packages and Packages.gz
dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages

# Generate Release, Release.gpg, and InRelease
apt-ftparchive release . > Release
gpg --yes --default-key "${EMAIL}" -abs -o Release.gpg Release
gpg --yes --default-key "${EMAIL}" --clearsign -o InRelease Release

# Git operations
git add .
git commit -m "add fixes"
git push -u origin main
