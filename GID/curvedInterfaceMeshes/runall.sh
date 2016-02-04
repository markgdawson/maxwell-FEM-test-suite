rm -rf serial parallel ruben
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

cp -al tmp ruben
(
cd ruben
echo 'running ruben'
~/Source/rubens-modified-code/maxwell-nefem/bin/maxwell2D > outFileLog.1
)


