# TASK DETAILS 
 This repo contains two tasks 

## Task1

1. Packer folder contains JSON and script file which  have details of which  AMI use and the userdata script which install the nginx in the image 
2. Tf folder contain autoscaling and load balancing terraform files 


To complete this task we follow these steps:
- We are using an application load balancer in AWS for that task.
- We Use Linux VMs as the backend for load balance and use nginx for emulating an application. 
- Linux VMs for the backend we prepared via packer which are in the packer folder and those image must contain a web service.
- we are using the same image for both backends ( page1 and page2), backends are showing different content
- we use autoscaling groups  ( or instance groups - the name depends on the cloud) to provision backend VMs. Each backend is attached with to the autoscaling group which has 1 instance  for demo purposes - but the configuration should allow to scale application to multiple AZs via 1 change in terraform configuration

To check this tasks URL need to use are as follows:


http://my-alb-1991683548.us-west-1.elb.amazonaws.com/page1/


http://my-alb-1991683548.us-west-1.elb.amazonaws.com/page2/


## Task2

1. nginx folder contains nginx chart 
2. we have created customise configuration in the template folder for the vault 
3. To manage the vault one can set the vaultEnabled values to true in values.yaml file in nginx or also ser this on runtime

helm install nginx nginx/ --set nginx.replicaCount=3,nginx.vaultEnabled=true


To check this tasks URL need to use are as follows:

http://a6bf4bcfab7744bbc9d5c6c92011680d-1634918376.us-west-1.elb.amazonaws.com/
