# Implementation of 'Combined Data' case

# Overview
This case exercises the FOREIGNKEY feature to associate Spectra to each Source record.

Data: 4XMM DR9

The primary goals:
* Exercise the assocated data feature.

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

## Details
* Goal: Find Source-s
    ```
    catalog = doc.find_instances(Source)[0]
    ```
* Goal: Summarize Source records
    * Number of records: 5
    * Number of unique Sources: 5

* Goal: Source record data
    * Source record
        * Souce ID:   581245887037857579
        * Associated Properties: 
            * Position: (340.910551, -17.071667) [deg] +/- 4.105e-04
        * Associated Data: 
            * WebEndpoint{ semantic=spectrum.raw content=application/fits url=http://spectrum/581245887037857579/MOS1 }
            * WebEndpoint{ semantic=spectrum.raw content=application/fits url=http://spectrum/581245887037857579/MO2 }
            * WebEndpoint{ semantic=spectrum.raw content=application/fits url=http://spectrum/581245887037857579/PN }
    * Source record
        * Souce ID:   581245887037857578
        * Associated Properties: 
            * Position: ( 52.616760, -27.720584) [deg] +/- 4.309e-04
        * Associated Data: 
            * none
    * Source record
        * Souce ID:   581245887037857577
        * Associated Properties: 
            * Position: (183.267881,  27.708168) [deg] +/- 3.517e-04
        * Associated Data: 
            * none
    * Source record
        * Souce ID:   581245887037857576
        * Associated Properties: 
            * Position: (126.308367, -77.837500) [deg] +/- 2.208e-04
        * Associated Data: 
            * none
    * Source record
        * Souce ID:   581245887037857575
        * Associated Properties: 
            * Position: (107.506608, -39.135986) [deg] +/- 3.702e-04
        * Associated Data: 
            * none
