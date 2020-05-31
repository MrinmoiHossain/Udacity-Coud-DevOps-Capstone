# Deploy a Flask Web App - Udacity Cloud DevOps Capstone Project

## Project Overview
As per capstone project requirement the directions are rather more open-ended than they were in the previous projects in the program. In this project, need to make some of our own choices in this capstone, as deployment implement, services, and the nature of the application development.

So that, develop a CI/CD pipeline for micro services applications with either blue/green deployment or rolling deployment. And, also develop our Continuous Integration steps as our project, but must at least include typographical checking (aka “linting”). 

## Installation Dependencies

### Install Java
```
$ sudo apt-get install default-jdk -y
```

### Install Jenkins
```
sudo apt-get update
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo echo "deb https://pkg.jenkins.io/debian-stable binary/" >> /etc/apt/sources.list
sudo apt-get install jenkins -y
sudo systemctl status jenkins
```

### Install Jenkins Plugin
* Blue Ocean
* CloudBees Docker Build and Publish
* pipeline-aws

### Install Python Package Management System (pip)
```
sudo apt-get install python3-pip -y
```

### Install Docker
```
sudo apt-get install docker.io -y
sudo chmod 666 /var/run/docker.sock
```

### Install Hadolint
```
sudo wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64
sudo chmod +x /bin/hadolint
```

### Install AWS CLI
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt-get install unzip
unzip awscliv2.zip
sudo ./aws/install
aws --version
aws configure
rm awscliv2.zip
```

### Install kubectl
```
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.16.8/2020-04-16/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv kubectl /bin/
kubectl version --short --client
```

### Install eksctl
```
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
```

## Deployment

### Create Cluster
```
eksctl create cluster -f cluster.yaml
```

### Verify kubectl Configuration
```
kubectl get svc
aws eks --region us-west-2 update-kubeconfig --name clustercapstone
```

### Cluster Service Check
```
kubectl get services
kubectl describe services bluegreenlb
```

### Remove Cluster
```
eksctl delete cluster -f cluster.yaml
```

## Resources
* [Docker: permission denied issue](https://stackoverflow.com/questions/48957195/how-to-fix-docker-got-permission-denied-issue)
* [Getting started with eksctl](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html)
* [eksctl: Creating and managing clusters](https://eksctl.io/usage/creating-and-managing-clusters/)