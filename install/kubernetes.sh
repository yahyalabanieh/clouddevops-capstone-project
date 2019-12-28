#!/usr/bin/env bash

#download kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

#add execution permission to the downloaded file
chmod +x ./kubectl

#move downloaded file to usr bin location to be used in terminal
sudo mv ./kubectl /usr/local/bin/kubectl

#install aws iAM authenticator

#Download the Amazon EKS-vended aws-iam-authenticator binary from Amazon S3
curl -o aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.14.6/2019-08-22/bin/linux/amd64/aws-iam-authenticator

#Apply execute permissions to the binary
chmod +x ./aws-iam-authenticator

#Copy the binary to a folder in your $PATH.
# We recommend creating a $HOME/bin/aws-iam-authenticator and ensuring that $HOME/bin comes first in your $PATH.
mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$HOME/bin:$PATH

#Add $HOME/bin to your PATH environment variable.
echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
