#!/bin/bash

# Run test
name="cmpne"
$M2C --cl2llvm -O0 $name.cl
echo $?
llvm-dis-3.1 $name.llvm -o -
rm -f $name.clp $name.llvm

