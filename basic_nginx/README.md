This is a tutorial to create a Puppet module and change NGINX behaviour from puppet-nginx module with all the steps of the process to make it available in Ubuntu 18.04
For this process, there will be followed these steps:

1-Install Ubuntu 18.04 desktop as a VM with VMware Workstation 14 player

2-Installing Puppet and nginx-puppet

3-Modify and compile the following functions for the puppet:

-A proxy to redirect requests for https://domain.com to 10.10.10.10 and another one to redirect requests for https://domain.com/resoure2 to 20.20.20.20.

-A forward proxy to log HTTP requests going from the internal network to the Internet including: request protocol, remote IP and time take to serve the request.

4-Test and verification of results

#########################################################
########################Procedure########################
#########################################################

First of all, we have to have available a Linux machine, preferably Ubuntu to develope this procedure.

-We can do it using VMware Workstation 14 Player and installing a VM from the ISO image found in the official Ubuntu webpage

-Once we have Ubuntu VM up and running, we can get the following packages before start:

->Let's get the last updates from Ubuntu repository

$sudo apt-get upgrade

-> Install puppet server from official web

$curl -O https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
$sudo dpkg -i puppetlabs-release-pc1-xenial.deb
$sudo apt-get update
$sudo apt-get install puppet

-> We install puppet-nginx

$sudo puppet module install puppet-nginx

-> Check module was installed

$sudo puppet module list

-> We can now execute the puppet to check if NGINX was correctly installed. Normally installed in the below path

$sudo puppet apply /etc/puppet/code/modules/nginx/examples/init.pp

-> and then we can see that the puppet will try to write in NGINX files (they must exist to be able to write)








