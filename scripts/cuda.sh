#!
echo "please ensure you have a supported version of linux for cuda. i am using RHEL 9.5"
uname -m && cat /etc/*release
echo "please ensure your machine has an nvidia-capable, and a cuda-capable GPU"
echo "installing the nvidia drivers" 
dnf install gcc -y
rpm --import d42d0685



sudo dnf install dpkg -y
sudo dpkg -i cuda_keyring_1.1-1_all.deb



dnf clean all
dnf -y install cuda-toolkit-12-6

echo
echo
dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf config-manager --enable epel
dnf -y module install nvidia-driver:open-dkms
#dnf -y module install nvidia-driver:latest-dkms
echo
echo
echo for RHEL 9 installation
###dnf install nvidia-fs libnvidia_nscq fabricmanager
subscription-manager repos --enable=rhel-9-for-x86_64-appstream-rpms
subscription-manager repos --enable=rhel-9-for-x86_64-baseos-rpms
subscription-manager repos --enable=codeready-builder-for-rhel-9-x86_64-rpms
rpm --erase gpg-pubkey-7fa2af80*
dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/rhel9/x86_64/cuda-rhel9.repo 
dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/rhel9/x86_64/cuda-rhel9.repo 
wget https://developer.download.nvidia.com/compute/cuda/repos/fedora39/x86_64/D42D0685.pub

dnf clean all
dnf install cuda-toolkit 
dnf install nvidia-gds  
reboot
##Post

