TARGETS = hostname.sh mountkernfs.sh mountnfs.sh mountdevsubfs.sh procps mountnfs-bootclean.sh hwclock.sh checkroot.sh urandom mountall-bootclean.sh mountall.sh bootmisc.sh checkroot-bootclean.sh checkfs.sh
INTERACTIVE = checkroot.sh checkfs.sh
mountdevsubfs.sh: mountkernfs.sh
procps: mountkernfs.sh
mountnfs-bootclean.sh: mountnfs.sh
hwclock.sh: mountdevsubfs.sh
checkroot.sh: hwclock.sh mountdevsubfs.sh hostname.sh
urandom: hwclock.sh
mountall-bootclean.sh: mountall.sh
mountall.sh: checkfs.sh checkroot-bootclean.sh
bootmisc.sh: mountall-bootclean.sh checkroot-bootclean.sh mountnfs-bootclean.sh
checkroot-bootclean.sh: checkroot.sh
checkfs.sh: checkroot.sh
