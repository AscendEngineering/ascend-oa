# ascend-oa
Repository to host the Obstacle Avoidance Service

## Updating the Package
The `publish_deb.sh` script automates publishing the Debian package to a Git-hosted APT repository:
- Copies the latest `ascend-oa.deb` file into the current repository folder.
- Generates Packages and Packages.gz metadata for the APT repository.
- Creates Release, Release.gpg, and InRelease files signed with your GPG key.
- Commits and pushes all changes to the Git repository.

## Installation
To install the service:
```bash
# Import the GPG key
curl -s --compressed "https://AscendEngineering.github.io/ascend-oa/KEY.gpg" | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/ascend-oa.gpg >/dev/null

# Add the APT source list
sudo curl -s --compressed -o /etc/apt/sources.list.d/ascend-oa.list "https://AscendEngineering.github.io/ascend-oa/ascend-oa.list"

# Update
sudo apt update

# Install 
sudo apt install ascned-oa
```

## Update
To update the service to the latest version:
```bash
# Uninstall
sudo apt remove ascend-oa

# Update
sudo apt update

# Install 
sudo apt install ascned-oa
```

## Uninstall
To uninstall the service completely:
```bash
sudo rm /etc/apt/sources.list.d/ascend-oa.list

sudo rm /etc/apt/trusted.gpg.d/ascend-oa.gpg

sudo apt remove ascend-oa
```


