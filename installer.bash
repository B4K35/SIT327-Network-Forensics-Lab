#!/bin/bash

# Define an array of programs to install
PROGRAMS=(
  "python3"
  "unzip"
  "grep" # Useful for most tasks
  "ngrep" # Useful for most tasks
  "nmap"
  "snort" # May or may not be useful for Task 4P
  "wireshark" # Task 1P, 1C, C1 & D2
  "tshark" # Task 3P & 5.1P
  "tcpdump" # Task C1
  "aircrack-ng" # Task D2
  # The next set of programs are installed with NFdump but will need
  # to be installed by the user if the repository wasn't cloned.
  # "bison" # Task 2.1 & D1
  # "flex" # Task 2.1 & D1
  # "rrdtool" # Task 2.1 & D1
  # "librrd-dev" # Task 2.1 & D1
  # "argus-client" # Task 2.1 & D1
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

# Copy downloaded files (assuming they are in the current directory)
if [ -d "SIT327 Task Resources" ]; then
  echo "Task Resources present preparing for first task"
  echo "Unzipping Task Resources ..."
  cd "SIT327 Task Resources/"
  for file in *.zip; do
    filename="${file%.*}"
    makdir -p "$filename"
    echo y | unzip -q "$file" -d "$filename"
  done
  cd ..
  cp -f "SIT327 Task Resources/2.1P-resources/nf_common.c" "nfdump-1.5.8-NSEL/"
  cp -f "SIT327 Task Resources/2.1P-resources/nf_common.h" "nfdump-1.5.8-NSEL/"
  cp "SIT327 Task Resources/2.1P-resources/argus-collector.ra" "nfdump-1.5.8-NSEL/"
  echo "\nReady to complete task 2.1P"
  sudo apt-get install bison flex rrdtool librrd-dev argus-client
  cd nfdump-1.5.8-NSEL/
  ./configure --enable-nfprofile
  make
  make install
  cd ..
  echo "\n Great success!"
else 
  echo "Task Resources not present you will need to configure NFdump!"
fi

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
echo "Good luck this Trimester!"
echo "Script execution completed."
