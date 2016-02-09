#!/bin/bash

# CHECK WHICH WAY ROUND THE ELEMENTS ARE (WE ASSUME THERE ARE ONLY TWO ELEMENTS, ONE ON EACH PROCESSOR)
rm utmp1 utmp2 ubench 2>/dev/null
awk 'NR>1' ./serial/dat/*node1.u.0 > ubench

# try one way round
file1=node2
file2=node1
echo parallel/dat/*{${file1},${file2}}.u.0 | xargs -n 1 awk 'NR>1' > utmp1

if cmp utmp1 ubench >/dev/null
then
    rev=2
else
    file1=node1
    file2=node2
    echo parallel/dat/*{${file1},${file2}}.u.0 | xargs -n 1 awk 'NR>1' > utmp2
    if cmp utmp2 ubench >/dev/null
    then
       rev=1
    else
       echo 'DIFFERENT ALSO BROKEN'
       exit 1
    fi
fi

# CHECK FINAL U
uFrame=10
rm utmp1 utmp2 ubench 2>/dev/null
awk 'NR>1' ./serial/dat/*node1.u.10 > ubench
echo parallel/dat/*{${file1},${file2}}.u.10 | xargs -n 1 awk 'NR>1' > utmp1

if cmp utmp1 ubench >/dev/null
then
    echo 'FINE'
    exitWith=0
else
    echo 'NOT FINE'
    exitWith=1
fi

#rm utmp1 utmp2 ubench 2>/dev/null
