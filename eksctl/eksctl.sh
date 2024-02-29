#!/bin/bash
 eksctl create cluster \
	 --region us-east-1 \
	 --name test-cluster \
	 --version 1.27 \
	 --nodegroup-name linux-node \
	 --node-type t2.small \
	 --nodes 3 \
	 --nodes-min 1 \
	 --nodes-max 4 \
	 --managed \
	 --profile eksctl

# eksctl delete cluster \
# 	--name test-cluster \
# 	-p eksctl \
# 	--region us-east-1
