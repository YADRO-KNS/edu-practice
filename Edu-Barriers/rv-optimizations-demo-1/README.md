# sir052022
Optimization demo

* An "auto-load safe-path" should be set in ~/.gdbinit, either / of path to this directory:
```
set auto-load safe-path /
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
gcc demo_races/cpu_opts.c -O2 && ./a.out
```
