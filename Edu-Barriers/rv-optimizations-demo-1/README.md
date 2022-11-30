# sir052022
Optimization demo

* An "auto-load safe-path" should be set in ~/.gdbinit, either / of path to this directory:
```
set auto-load safe-path /
```
* Install libraries required for Qemu and Buildroot:
```
# Fedora
sudo dnf install ncurses-devel perl-ExtUtils-MakeMaker ninja-build glib2-devel pixman-devel libslirp-devel
# Ubuntu
sudo apt install libncurses-dev libextutils-makemaker-cpanfile-perl ninja-build libglib2.0-dev libpixman-1-dev libslirp-dev
```
* Build everything:
```
0_prereq.sh
1_qemu.sh
2_toolchain.sh
3_linux_prepare.sh
4_linux.sh
5_opensbi.sh
6_demos.sh
7_rootfs.sh
```
* Start qemu
```
./8_run.sh
```
* Enter login «root» (without password)
* Run the compiler barriers demo
```
/opt/compiler_opts
```
* Run the CPU barriers demo
```
/opt/cpu_opts
```
* Read and edit the code
```
$EDITOR demo_races/compiler_opts.c
$EDITOR demo_races/cpu_opts.c
```
* Rebuild and re-run
```
./rebuild_rerun.sh
```
* Exit qemu
```
ctrl+A, X
```
* Run on a local machine:
```
% ./output/cpu_opts
without barriers: !A!B    942, !AB     24, A!B     33, AB      0
with barriers: !A!B      0, !AB      2, A!B      4, AB    993
%
```
