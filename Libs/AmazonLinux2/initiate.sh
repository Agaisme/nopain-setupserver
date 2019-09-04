#!/bin/bash
#######################################################
# NoPain Setup Server V0.1
#######################################################

function initiate_system(){
	# Amazon Linux 2 Support of CentOS/RHEL7
	sudo yum -y install --skip-broken https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
	sudo yum -y install --skip-broken https://rpms.remirepo.net/enterprise/remi-release-7.rpm
	sudo yum -y install --skip-broken yum-utils
	
	# Centos minimal Support Tools
	# yum -y install wget net-tools vim deltarpm rsync unzip
}

function update_system() {
		sudo yum -y update --skip-broken
}