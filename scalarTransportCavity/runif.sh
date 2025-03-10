#!/bin/bash
cd "${0%/*}" || exit                                # Run from this directory
. ${WM_PROJECT_DIR:?}/bin/tools/RunFunctions        # Tutorial run functions
#------------------------------------------------------------------------------


# Change to the case directory
cd "${0%/*}" || exit 1

# Run blockMesh
echo "Running blockMesh..."
blockMesh > log.blockMesh 2>&1

# Check if blockMesh ran successfully
if [ $? -ne 0 ]; then
    echo "blockMesh failed. Check log.blockMesh for details."
    exit 1
fi

# Run icoFoam solver
echo "Running IcoFoam..."
icoFoam > log.icoFoam 2>&1

# Check if energyIcoFoam ran successfully
if [ $? -ne 0 ]; then
    echo "icoFoam failed. Check log.energyIcoFoam for details."
    exit 1
fi

# Create Paraview executable
echo "Creating Paraview executable..."
touch results.foam