# scalarTransport FunctionObject
Showcases the use of scalarTransport function object in order to add a scalar to the solver without modification of it directly.
Read the description inside 
```
system/controlDict
```
to get the hang of it.  
## Note
This case solves energy equation using both solver modification method and functionObject addition to controlDict. 
For comparison purposes, temperature is denoted with T when solved via modified icoFoam and denoted with Theta when solved using functionObject. 
Details on how to add energy equation to icoFoam is explained in the link below. 

https://openfoamwiki.net/index.php/How_to_add_temperature_to_icoFoam 

The snippet below is copied from scalarTransport.C file inside $FOAM_SRC directory to further clarify the equation that is solved.

```C++
// $FOAM_SRC/functionObjects/solvers/scalarTransport/
// from scalarTransport.C
     for (label i = 0; i <= nCorr_; i++)
        {
            fvScalarMatrix sEqn
            (
                fvm::ddt(s)
              + fvm::div(limitedPhiAlpha, s, divScheme)
              - fvm::laplacian(D, s, laplacianScheme)
              ==
                alpha*fvOptions_(s)
            );
 
            sEqn.relax(relaxCoeff);
            fvOptions_.constrain(sEqn);
            sEqn.solve(mesh_.solverDict(schemesField_));
 
            tTPhiUD = sEqn.flux();
        }
```

The solver energyIcoFoam which can be found inside solver directory is compiled using wmake command. It's an updated and slightly modified version of the solver provided with the link. The results can also be verified. 
