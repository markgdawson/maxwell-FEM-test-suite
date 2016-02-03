rm -rf serial parallel
cp -al tmp serial
(
cd serial
echo 'running serial'
~/Source/maxwell-nefem/bin/debug/maxwell2D-parallel
)

cp -al tmp parallel
(
cd parallel
echo 'running parallel'
mpiexec -n 2 ~/Source/maxwell-nefem/bin/debug/maxwell2D-parallel
)

