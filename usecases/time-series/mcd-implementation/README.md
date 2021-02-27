# Implementation of 'Time-Series' case

# Overview
  Utility to load Time Series data annotated using the IVOA VODML Mapping Syntax
  and perform various operations on it.

  Annotation was produced using the 'Jovial' modeling toolset (Java).  Jovial
  was written by Omar Laurino, and updated by me to the current data model content.
  It provides utilities to help define and create instances of (annotations)
  IVOA VO-DML compliant data models.

  Uses the 'rama' python package to parse annotated data file and instantiate
  instances of VO Data Model Classes.  The package also applies Adapters which
  translate certain VO Data Model Classes to corresponding AstroPY types.
    eg: meas:Point -> astropy:SkyCoord
    eg: meas:Time  -> astropy:Time
  This package was developed by Omar Laurino, and updated by me to the current 
  data model content.

## Resources Used

  Mapping Syntax
    https://volute.g-vo.org/svn/trunk/projects/dm/vo-dml-mapping/doc/VO-DML_mapping_WD.pdf

  Jovial Library
    version used in this project
      https://github.com/mcdittmar/jovial
    master repository
      https://github.com/olaurino/jovial

  Rama module
    version used in this project
      https://github.com/mcdittmar/rama
    master repository
      https://github.com/olaurino/rama

# Details

    * Load file
    ```
    doc = Reader( Votable(infile) )
    ```
    
    * Goal: Identify the whole thing as a time series
    ```
    dataset = doc.find_instances(ObsDataset)[0]
    sys.stdout.write("  o Data Product Type: %s\n"%dataset.data_product_type)
    sys.stdout.write("  o Data Product SubType: %s\n"%dataset.data_product_subtype)
    ```
    o Data Product Type: TIMESERIES
    o Data Product SubType: lightcurve
    

    * Goal: Identify independent/dependent axes
    ```
    ndpoint = doc.find_instances(NDPoint)[0]
    sys.stdout.write("   o Independent Axes: %s\n"%str(ndpoint.independent) )
    sys.stdout.write("   o Dependent Axes: %s\n"%str(ndpoint.dependent) )
    ```
    o Independent Axes: ['time']
    o Dependent Axes: ['phot', 'flux']


    * Goal: Associate values and errors
    ```
    for axis in ( ndpoint.axes ):
        sys.stdout.write("    o Axis '%s' has error? %s\n"%(axis.name,"no" if (axis.stat_error is None) else "yes" ) )
    ```
    o Axis 'time' has error? no
    o Axis 'phot' has error? no
    o Axis 'flux' has error? yes

    * Goal: Find target object and position
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

    * Bonus - Plot the data
      - rama has added plotter decorators to certain classes, like NDPoint
    ```
    ndpoint.plot( 'time', 'flux' )
    ```
    INSERT IMAGE HERE
