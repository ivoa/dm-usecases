# Implementation of 'Time-Series' case

# Overview
This case features TimeSeries data in a variety of formats.

The primary goals:
* Annotate the datasets to the SparseCube model
* Consume the annotation and plot the TimeSeries data.

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
* File:
    * ts_annotated.vot - Provided by GAVO Data Center, TimeSeries derived from GAIA DR2 data.
* Annotation:
    * cube:SparseCube instance
        * data (NDPoint) populated from '_cube1' TABLE.
    * Dataset and CoordSys/Frame objects defined mainly by LITERALs
* Consumption
    * see [ts_summary.md](4xmm_summary.md) for a summary of the model instances generated from this annotated file.

## Example 2:
* Annotation: TimeSeriesZTF_annotated.vot - ZTF time series  
    * TimeSeriesZTF_annotated.vot - ZTF time series
    * TABLE includes measurements from multiple sources within the field.
* File modifications:
    * added missing VOTABLE node start.
    * added IDs to FIELDs being referenced in annotation
    * changed type of FIELD used as KEYs to 'ivoa:string' type
        * JOVIAL hardcodes the type; RAMA does not convert the native values
* Annotation: TimeSeriesZTF_annotated.vot - ZTF time series  
TABLE includes measurements from multiple sources within the field.
    * Added SourceList TABLE containing 1 row per source in main TABLE, 1 column providing the source id.
        * this enables compact annotation, using PRIMARYKEY|FOREIGNKEY to create 1 SparseCube per source.
    * GLOBALS for Coordinate systems
    * GLOBALS for ds:ObsDataset instances (1 per source for reference by SparseCube
    * GLOBALS for ds:Target instances (referenced by ObsDataset)
    * TEMPLATES on SourceList TABLE for cube:SparseCube (creates one per row/source)
    * TEMPLATES on RESULTS TABLE for cube:NDPoint
        * uses PRIMARYKEY|FOREIGNKEY to select appropriate rows for the current source.
    * Dataset and CoordSys/Frame objects defined mainly by LITERALs
* Consumption
    * see [ztf_summary.md](ztf_summary.md) for a summary of the model instances generated from this annotated file.

