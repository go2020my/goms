#!/bin/bash
set -xe

# 版本信息
K8S_VERSION=v1.15.1
PAUSE_VERSION=3.1
COREDNS_VERSION=1.3.1

# pull
## 基本组件
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/kube-proxy-amd64:$K8S_VERSION
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/pause-amd64:$PAUSE_VERSION
docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/coredns:$COREDNS_VERSION

# tag, 带 amd
# docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/kube-proxy-amd64:$K8S_VERSION k8s.gcr.io/kube-proxy-amd64:$K8S_VERSION
# docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/pause-amd64:$PAUSE_VERSION k8s.gcr.io/pause-amd64:$PAUSE_VERSION

# tag, 不带 amd
docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/kube-proxy-amd64:$K8S_VERSION k8s.gcr.io/kube-proxy:$K8S_VERSION
docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/pause-amd64:$PAUSE_VERSION k8s.gcr.io/pause:$PAUSE_VERSION
docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/coredns:$COREDNS_VERSION k8s.gcr.io/coredns:$COREDNS_VERSION

## rmi
docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/kube-proxy-amd64:$K8S_VERSION
docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/pause-amd64:$PAUSE_VERSION
docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/coredns:$COREDNS_VERSION
