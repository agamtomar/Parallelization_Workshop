#!/bin/bash
module load openmpi/1.8.8-gcc

wget https://cran.r-project.org/src/contrib/Rmpi_0.6-6.tar.gz

R CMD INSTALL Rmpi_0.6-6.tar.gz --configure-args=" \
--with-Rmpi-include=/cxfs/projects/spack/opt/spack/linux-x86_64/gcc-4.4.7/openmpi-1.8.8-72q36csmgq7qgf6nuhqnthbxdghzjpfz/include \
--with-Rmpi-libpath=/cxfs/projects/spack/opt/spack/linux-x86_64/gcc-4.4.7/openmpi-1.8.8-72q36csmgq7qgf6nuhqnthbxdghzjpfz/lib \
--with-Rmpi-type=OPENMPI" --no-test-load
