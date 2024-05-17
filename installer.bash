#!/bin/bash

# Define an array of programs to install
PROGRAMS=(
  "python3"
  "grep" # Useful for most tasks
  "ngrep" # Useful for most tasks
  "nmap"
  "snort" # May or may not be useful for Task 4P
  "wireshark" # Task 1P, 1C, C1 & D2
  "tshark" # Task 3P & 5.1P
  "tcpdump" # Task C1
  "aircrack-ng" # Task D2
  "bison" # Task 2.1 & D1
  "flex" # Task 2.1 & D1
  "rrdtool" # Task 2.1 & D1
  "librrd-dev argus-client" # Task 2.1 & D1
  "./imhex-*.deb" # Task 1C
)

# Update the package list
echo "Updating package list..."
sudo apt-get update

# Upgrade installed packages to their latest versions
echo "Upgrading installed packages..."
sudo apt-get upgrade -y

# Install each program listed in the PROGRAMS array
echo "Installing programs..."
for PROGRAM in "${PROGRAMS[@]}"; do
  if ! dpkg -s $PROGRAM >/dev/null 2>&1; then
    echo "Installing $PROGRAM..."
    sudo apt-get install -y $PROGRAM
  else
    echo "$PROGRAM is already installed."
  fi
done

# Install older nfdump version (Using clang-10 in our array would work if we wanted up to date)
wget http://sourceforge.net/projects/nfdump/files/nsel/nfdump-1.5.8-NSEL/nfdump-1.5.8-NSEL.tar.gz/download
tar xzf download
cd nfdump-1.5.8-NSEL/

# Copy downloaded files (assuming they are in the current directory)
rm nf_common.c
rm nf_common.h .

./configure --enable-nfprofile
make
make install
echo "Nfdump successfully installed and is ready for .c & .h files to be added."
cd ..


# Clean up unnecessary packages and files
echo "Cleaning up..."
sudo apt-get autoremove -y
sudo apt-get clean

echo "All programs installed successfully!"

# Optional: Verification of installations
echo "Verifying installations..."
for PROGRAM in "${PROGRAMS[@]}"; do
  if which $PROGRAM >/dev/null 2>&1; then
    echo "$PROGRAM is installed and working."
  else
    echo "Error: $PROGRAM is not installed correctly."
  fi
done

echo "Script execution completed."
