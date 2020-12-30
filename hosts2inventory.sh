#!/bin/bash -
# hosts2inventory.sh--Trivial wrapper for hosts2inventory.pl
# JP, 2020-04-11

# Ansible executable inventory scripts needs to output JSON, not INI!  :-(
# And they need to handle "--list"...

# Make the Inventory file
./hosts2inventory.pl -o hosts hosts2.txt

# If called as an "executable" inventory (because "--list") do this:
# It's really stupid, since its would be easier and faster to just use the
# `hosts` file itself.  But...it works...  (Did NOT work using --yaml!)
[ "$1" == '--list' ] && {
    ansible-inventory -i hosts --list --export
}
