# Implementation of 'Column Grouping' case

# Overview
  This case involves Vizier data with a variety of columns, some of which 
  are 'in some way' related to the Radial Velocity column.

  The primary goals of the case appear to be
  * Illustrate that the model is able to associate these columns in a way that is easily resolved by a client.

  The data has been annotated using IVOA VO-DML Mapping syntax
  * Note: The associated properties are basic types, and are (IMO) improperly modeled  
          as extensions of the Measure class.  Since the content of the Parameter is not  
          relevant to the Association, I have not annotated the Associated Parameter content.  

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
* Mapping Syntax
  + Working Draft document:  
    https://volute.g-vo.org/svn/trunk/projects/dm/vo-dml-mapping/doc/VO-DML_mapping_WD.pdf

* Jovial Library
  + version used in this project:  
    https://github.com/mcdittmar/jovial
  + master repository:  
    https://github.com/olaurino/jovial

* Rama module
  + version used in this project:  
    https://github.com/mcdittmar/rama
  + master repository:  
    https://github.com/olaurino/rama

## Details
* Load Annotated VOTable
    ```
    doc = Reader( Votable(infile) )
    ```

* **Goal: Discover associated properties**
    ```
    catalog = doc.find_instances(Source)[0]
    sys.stdout.write("o Source:\n" )
    for param in ( catalog.parameter_dock ):
        sys.stdout.write("  o Parameter: ucd='%s'\n"%(param.ucd) )
        if param.associated_parameters is None:
            sys.stdout.write("    + no Associated Parameters\n" )
        else:
            for item in ( param.associated_parameters ):
                inst = item.referenced_instance
                sys.stdout.write("    + Associated Parameter: ucd='%s'\n"%(inst.ucd) )
    ```
   Source:  
    + Parameter: ucd='pos.eq'  
        + no Associated Parameters  
    + Parameter: ucd='spect.dopplerVeloc'  
        + Associated Parameter: ucd='meta.code.qual'  
        + Associated Parameter: ucd='meta.number'  
        + Associated Parameter: ucd='meta.ref'  
    + Parameter: ucd='meta.code.qual'  
        + no Associated Parameters  
    + Parameter: ucd='meta.number'  
        + no Associated Parameters  
    + Parameter: ucd='meta.ref'  
        + no Associated Parameters  
 
 
