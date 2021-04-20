## Model Instance Summary:
Input file: ts_annotated.vot

### Goal: Load TimeSeries instances
    doc = Reader( Votable(infile) )
    ts  = doc.find_instances(SparseCube)

### Goal: Identify the whole thing as a time series
```
for instance in ts:
    instance.dataset.data_product_type 
    instance.dataset.data_product_subtype 
    instance.dataset.target.name
```
Instance:  
  o Data Product Type: TIMESERIES  
  o Data Product SubType: lightcurve  
  o Target Name: 1866721434011386240  

### Goal: High Level content summary
```
for instance in ts:
    fh.write( cube_toString( instance, data=False ) )
```
rama.models.cube.SparseCube:  
  o Independent Axis: ['time']  
  o Dependent Axis: ['magnitude', 'generic']  
  o Length: 38  

### Goal: Plot the data
```
    fig = plt.figure(figsize=[8.0,4.8])
    ax = fig.add_subplot(111)
    ax.grid(True)
    ax.set_title("Cube Data Points")

    first = True
    for cube in cubes:
        # Setup plot from first cube
        if first:
            label = xaxis
            if hasattr( cube.data[0][xaxis].measure, 'unit'):
                label += " ({})".format(cube.data[0][xaxis].measure.unit)
            ax.set_xlabel(label)
                
            label = yaxis
            if hasattr( cube.data[0][yaxis].measure, 'unit'):
                label += " ({})".format(cube.data[0][yaxis].measure.unit)
            ax.set_ylabel(label)
    
        first = False

        tag = "source: "+cube.dataset.target.name+", band: "+cube.data[0][yaxis]._axis.measure.coord.coord_sys.frame.name
        
        # Gather data and add to plot
        points = [ instance for instance in cube.data if instance is not None ]
        xvals = [ point[xaxis].measure.value for point in points ]
        yvals = [ point[yaxis].measure.value for point in points ]
        if isinstance( points[0][yaxis].stat_error, Symmetrical ):
            yerr = [ point[yaxis].stat_error.radius.value for point in points ]
        else:
            yerr = None

        ax.errorbar( xvals, yvals, yerr=yerr, fmt=".-", ecolor='#000000', label=tag )

    plt.legend()
    plt.show()

```  
![gavo_timeseries](https://user-images.githubusercontent.com/14201994/115455695-45c9ad00-a1f0-11eb-9c58-813ed9310c16.png)
