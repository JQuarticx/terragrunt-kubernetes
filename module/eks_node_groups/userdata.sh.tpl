#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --kubelet-extra-args "--node-labels node.kubernetes.io/worker-${worker_node_name}=" ${cluster_name}
/opt/aws/bin/cfn-signal --exit-code $? --stack "worker-${worker_node_name}" --resource NodeGroup --region ap-southeast-1