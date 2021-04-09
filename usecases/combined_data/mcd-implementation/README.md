# Implementation of 'Combined Data' case

# Overview
This case exercises the PRIMARYKEY|FOREIGNKEY feature of the Mapping syntax to assocate data from
the Detection table to the corresponding Master table record.

The primary goals:
* Exercise the assocated data feature of the MANGO model.

The data has been annotated using IVOA VO-DML Mapping syntax.
The annotation was produced using the 'Jovial' modeling toolset (Java).  Jovial
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

# Details
## Example 1:
* Annotation: 4xmm_lite_annotated.vot
    * mango:Source instance to _results table
    * mango:Source.parameterDock contains 1 Parameter for Position + error
        * mango:Source.associatedDataDock contains n WebEndpoint instances from _spectra table
            * FOREIGNKEY|PRIMARYKEY on identifier columns associate WebEndpoints with appropriate Source record.
* Consumption
    * see [4xmm_summary.md](4xmm_summary.md) for a summary of the model instances generated from this annotated file.

## Example 2:
* Annotation: csc2_example_annotated.vot
    * mango:Source instance to _results table
    * mango:Source.parameterDock contains 1 Parameter for Position + error
        * mango:Source.associatedDataDock contains n WebEndpoint instances from _spectra table
            * FOREIGNKEY|PRIMARYKEY on identifier columns associate WebEndpoints with appropriate Source record.
* Consumption
    * see [csc2_summary.md](csc2_summary.md) for a summary of the model instances generated from this annotated file.
