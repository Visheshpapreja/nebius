# TASK DETAILS 
 This repo contains two tasks 

## Task1

1. Packer folder contains json and script file which  have detailed of which  AMI use and the userdata script which install the nginx in image 
2. Tf folder contain autoscaling and load balancing terraform files 


To complete this tasks we follows these steps:
- We are using application load balancer in AWS for that task.
- We Use linux VMs as backend for load balance and use nginx for emulating an application. 
- Linux VMs for backend we prepared via packer which in packer folder anf thos image must contain a web service .
- we are using same image for both backends ( page1 and page2) , backends is showing different content
- we Use a autoscaling groups  ( or instance groups - name depends on a cloud) to provision backend VMs. Each backend is attached with to autoscaling group which have 1 instance  for the demo purposes - but configuration should allow to scale application to multiple AZs via 1 change in terraform configuration

To check this tasks URL need to use are as follows:
http://my-alb-1991683548.us-west-1.elb.amazonaws.com/page1/
http://my-alb-1991683548.us-west-1.elb.amazonaws.com/page2/


## Task2

1. nginx folder contains nginx chart 
2. we have created customie configuration in template folder for vault 
3. To manage valut one can set the vaultEnabled values to true in values.yaml file in nginx or also ser this on runtime

helm install nginx nginx/ --set nginx.replicaCount=3,nginx.vaultEnabled=true


To check this tasks URL need to use are as follows:

http://a6bf4bcfab7744bbc9d5c6c92011680d-1634918376.us-west-1.elb.amazonaws.com/
