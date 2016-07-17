# ROS on Raspberry Pi 3
This repository sets up a process to install ROS on a Raspberry Pi 3.
Raspberry Pi 3 is a very low cost computer with a very large community. It makes it the ideal support to build a low cost robot. But there are lots of hardware issues (wifi drivers, opencv compatibility) which makes the "first robot code line" very late. The purpose of this repository is to get a very stable installation process to get the necessary libraries for ROS.

ROS is a very efficient programming framework but on the other side it can be very complicated leading to have compilation errors for packages you will never use... For instance, RVIZ is a package too much CPU demanding.

For the moment, only Jade distribution is managed. The Kinetic Distribution will be available directly from apt-get in few months.

# First steps
## Hardware
- 1 Raspberry Pi 3 Model B
- 1 Internet connection
- 1 USB smartphone charger (more than 2A)
- 1 MicroSD card with high performances if possible.

## Flash the SDcard (for Windows users)
- Download the [Jessie Image for Raspberry Pi](https://www.raspberrypi.org/downloads/raspbian/) Not the "Lite" one
- Download [7zip software](http://www.7-zip.org/)
- Download [Win32diskImager](https://sourceforge.net/projects/win32diskimager/)
- Unzip the Jessie image
- Format the SD card
- Open win32 disk image and flash the SD card with the Jessie Image
- Once it is flashed (can take some minutes) Insert the SD card in the Raspberry Pi
- Plug the Raspberry Pi 3 (Ethernet cable + power supply)

## First boot
- Connect via SSH on the Raspberry Pi
- login : pi; password : raspberry
- Execute : ``` sudo raspi-config ```
- Expand file system
- autologin after boot in console mode
- wait for connection before login
- enable camera
- exit (and reboot)
- Execute : ``` sudo nano /etc/dphys-swapfile ```
- replace ```CONF_SWAPSIZE=100``` by ```CONF_SWAPSIZE=1024```
- Execute : ``` sudo reboot ```

## Install ROS
- Execute : ``` git clone https://github.com/ThotAlion/InstallROSRPI3.git ```
- Execute : ```cd InstallROSRPI3```
- Execute : ```./install_ROS.sh```
