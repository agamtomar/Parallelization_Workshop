#!/bin/bash

wget https://cran.r-project.org/src/contrib/pbdMPI_0.3-2.tar.gz

export OPENMPI_ROOT=/cxfs/projects/spack/opt/spack/linux-x86_64/gcc-4.4.7/openmpi-1.8.8-72q36csmgq7qgf6nuhqnthbxdghzjpfz

R CMD INSTALL pbdMPI_0.3-2.tar.gz --configure-args="--with-mpi-type=OPENMPI \
--with-mpi-include=$OPENMPI_ROOT/include --with-mpi-libpath=$OPENMPI_ROOT/lib" --no-test-load
