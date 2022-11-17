# EKS Getting Started Guide Configuration

This is the full configuration from https://www.terraform.io/docs/providers/aws/guides/eks-getting-started.html

See that guide for additional information.

**NOTE**: This is a one node cluster which may only be good for dev workload.

**NOTE**: This full configuration utilizes the [Terraform http provider](https://www.terraform.io/docs/providers/http/index.html) to call out to icanhazip.com to determine your local workstation external IP for easily configuring EC2 Security Group access to the Kubernetes servers. Feel free to replace this as necessary.



## terraform-eks-resource
terraform aws_eks_cluster and aws_eks_node_group resources from terraform-provider-aws: https://github.com/onyeka-hub/terraform-provider-aws.git

Note that the s3 bucket for the backend must be  created before running the terraform code

Enable kubectl to communicate with your cluster by adding a new context to the kubectl config file.
```
aws eks update-kubeconfig --region us-east-2 --name onyeka-terraform-eks
```

The example output is as follows.
```
Added new context arn:aws:eks:us-east-2:958217526797:cluster/onyeka-terraform-eks to C:\Users\ONYEKA\.kube\config
```

Confirm communication with your cluster by running the following command.
```
kubectl get svc
```
```
kubectl get ns
```

The example output is as follows.
```
NAME              STATUS   AGE
default           Active   18m
kube-node-lease   Active   18m
kube-public       Active   18m
kube-system       Active   18m
```

```
kubectl get pods -n kubectl-system
```

```
NAME                       READY   STATUS    RESTARTS   AGE
aws-node-zfk56             1/1     Running   0          14m
coredns-5948f55769-f2j9z   1/1     Running   0          18m
coredns-5948f55769-m66nj   1/1     Running   0          18m
kube-proxy-9wxfw           1/1     Running   0          14m
```

For more verbose do
```
kubectl get pods -n kubectl-system -o wide
```

To get the configmap

```
kubectl get configmap -n kube-system
```

```
NAME                                 DATA   AGE
aws-auth                             1      30m
coredns                              1      33m
cp-vpc-resource-controller           0      33m
eks-certificates-controller          0      33m
extension-apiserver-authentication   6      33m
kube-proxy                           1      33m
kube-proxy-config                    1      33m
kube-root-ca.crt                     1      33m
```

To edit the configmap
```
kubectl edit configmap aws-auth -n kube-system
```
