#!
clear
echo "set arch"
read arch
echo "set distro"
read distro

echo "checking distro and release number, as well as bit number" 
uname -m && cat /etc/redhat-release
echo
echo
echo "installing gcc"
dnf install gcc -y
echo
echo
echo "please ensure gcc is installed"
gcc --version
echo
echo
echo "manually ensure the correct version of the kernel headers and development packages are installed prior to installing the NVIDIA Drivers, as well as whenever you change the kernel version"
echo 
uname -r
echo 
echo
echo "delete outdate rpm signing key and install new one"
rpm --erase gpg-pubkey-7fa2af80*
dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch/cuda-$distro.repo
echo
echo
echo "Installing the kernel headers and development packages for the currently running kernel"
dnf install kernel-devel-$(uname -r) kernel-headers-$(uname -r) -y
echo
echo
echo "Satisfy third-party package dependency"
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm -y
subscription-manager repos --enable=rhel-9-for-x86_64-appstream-rpms
subscription-manager repos --enable=rhel-9-for-x86_64-baseos-rpms
subscription-manager repos --enable=codeready-builder-for-rhel-9-x86_64-rpms
echo "Network Repo Installation for RHEL"
dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch/cuda-$distro.repo
dnf clean expire-cache
echo 
echo
echo "nvidia driver installation"
dnf module install nvidia-driver:open-dkms -y
echo
echo
echo "compute only system"
dnf install nvidia-driver-cuda kmod-nvidia-open-dkms
echo
echo
reboot
~                                    
