#!/bin/bash
####################################
#
# Backup to vm shared directory script.
#
####################################

# What to backup. 
backup_files="/home/phiggs/student"

# Where to backup to.
dest="/media/sf_vmshared"

# Create archive filename.
day=$(date +%Y-%b-%d-%H%M)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"

# Print start status message.
echo "Backing up $backup_files to $dest/$archive_file"
date
echo

# Backup the files using tar.
sudo tar czf $dest/$archive_file $backup_files

# Print end status message.
echo
echo "Backup finished"
date

# Long listing of files in $dest to check file sizes.
ls -lh $dest
ls -l $dest | xcowsay

