#! /bin/bash
#  author: James Zhang
#set -e
#set -x

##########################################################################################################################
# X6000 same with X86 
##########################################################################################################################
Arch=`dmidecode -t processor | grep Family: | uniq | awk '{print $2}'`

echo "===========$Arch==============="
#if [ `dmidecode -t processor | grep -o ARM | uniq` ]; then
for pkg in vim automake libstdc++ libgfortran sysstat net-tools git gcc gcc-c++ glibc numactl tree libaio libaio-devel 
do
    yum install $pkg -y
done
# install ansible package
pushd $Arch/ansible 
for pkg in python-jinja2 python-setuptools python-six python-cffi python-idna python-ipaddress python-pyasn1 python-enum34 PyYAML
do
    rpm -Uvh *
done
popd
# install stress-ng package
pushd $Arch/stress-ng          
#    rpm -Uvh *
popd

