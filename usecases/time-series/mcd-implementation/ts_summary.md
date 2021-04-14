## Model Instance Summary:
Input file: ts_annotated.vot

### Goal: Load TimeSeries instances
    doc = Reader( Votable(infile) )

### Goal: Identify the whole thing as a time series
```
dataset = doc.find_instances(ObsDataset)[0]
sys.stdout.write("  o Data Product Type: %s\n"%dataset.data_product_type)
sys.stdout.write("  o Data Product SubType: %s\n"%dataset.data_product_subtype)
```  
  o Data Product Type: TIMESERIES  
  o Data Product SubType: lightcurve  

### Goal: Identify independent/dependent axes
```
ndpoint = doc.find_instances(NDPoint)[0]
sys.stdout.write("   o Independent Axes: %s\n"%str(ndpoint.independent) )
sys.stdout.write("   o Dependent Axes: %s\n"%str(ndpoint.dependent) )
```  
  o Independent Axes: ['time']  
  o Dependent Axes: ['phot', 'flux']  

### Goal: Associate values and errors
```
for axis in ( ndpoint.axes ):
    sys.stdout.write("    o Axis '%s' has error? %s\n"%(axis.name,"no" if (axis.stat_error is None) else "yes" ) )
```  
  o Axis 'time' has error? no  
  o Axis 'phot' has error? no  
  o Axis 'flux' has error? yes  

### Goal: Find target object and position
  NOTE - rama's attempt to auto-convert Position to AstroPy SkyCoord fails due to missing units in serialization.. so the meas:Position instance is returned.
```
target = doc.find_instances(Target)[0]
sys.stdout.write("  o Target name/id: %s\n"%(target.name) )
sys.stdout.write("  o Target position: (%7.4lf [%s], %7.4lf [%s]) frame=%s epoch=%s\n"%(target.position.coord.axis1.value,
                                                                                        target.position.coord.axis1.unit,
                                                                                        target.position.coord.axis2.value,
                                                                                        target.position.coord.axis2.unit,
                                                                                        target.position.coord.coord_sys.frame.space_ref_frame,
                                                                                        target.position.coord.coord_sys.frame.equinox
                                                                                        ) )
```  
  o Target name/id: 1866721434011386240  
  o Target position: (315.0185 [], 35.3014 []) frame=ICRS epoch=J2015.5  

### Bonus - Plot the data
      - rama has added plotter decorators to certain classes, like NDPoint  
```
ndpoint.plot( 'time', 'flux' )
```  
![Figure_1](https://user-images.githubusercontent.com/14201994/109398334-505f7880-790a-11eb-93f1-2cef1a1a6eca.png)
