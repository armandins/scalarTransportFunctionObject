# scalarTransportFunctionObject
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
