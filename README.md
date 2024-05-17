# SIT327 Network Forensics Lab Setup

This repository serves to help future students set up their Ubuntu VM's to conduct forensic tasks on provided network packet captures and other resources. This is a small collection of installation scripts to help complete your analysis tasks. 

## Requirements
This setup guide may also work for other Debian versions but no guarantees can be made for its success. This guide has been catered towards the use of an Ubuntu VM. This VM should satisfy the following requirements:

* 64-bit Ubuntu/Debian distribution.
* Disk capacity of at least 20 GB and memory of at least 2 GB.
* Processor with at least 4 cores
* Video memory of at least 64 MB
* Internet connection.

## Installation instructions
This section of the document details the steps to install and set up this network forensics lab.

### Pre-installation
* Prepare a 64 bit Ubuntu VM.
	* install Ubuntu ISO from https://ubuntu.com/download/desktop
	* Ensure the [requirements above](#requirements) are satisfied.
* Task a snapshot of the VM is taken before proceeding with the network forensics lab installation.

### Network Forensics Lab Installation
* Open a new terminal.
* Clone this repository which downloads all task resources.
	* sudo apt-get update
	* sudo apt-get install gh -y
	* gh repo clone https://github.com/B4K35/SIT327-Network-Forensics-Lab.git
 * Alternatively you can download the installation script to your home directory.
	* wget https://github.com/B4K35/SIT327-Network-Forensics-Lab/blob/main/installer.bash -O ~/installer.bash

