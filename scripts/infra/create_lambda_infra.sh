#!/bin/bash

# install local dependencies 
pip install python-otcclient

#create clusters 

# for data analyzation
otc mrs create-cluster \
	--key-name hadoop \
	--subnet-name subnet-automation \
	--vpc-name vpc-automation \
	--cluster-name mrstestcluster \
	--debug

# for data streaming 
otc mrs create-cluster \
	--key-name hadoop \
	--subnet-name subnet-automation \
	--vpc-name vpc-automation \
	--cluster-name mrstestcluster \
	--debug
