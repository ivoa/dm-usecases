# Implementation of 'Identity' case

# Overview
  This case involves data extracted from a SIMBAD TAP service.
  The data includes entries from 3 sources, giving several parameters of different types 
  with associated quality and precision for each source.

  NOTE: the case description specifies using the 'oid' FIELD for the identifier.
  This field is 'long' type, and ucd="meta.record;meta.id"
  * the model specified Source.identifier as "ivoa:string"
  * the identifier chosen is NOT the main id in the Table, which is column 57: name="main_id", ucd="meta.id;meta.main"
  whose values appear to be the common name from Simbad (eg: "LEDA  888961").

  The primary goals of the case appear to be
  * Simply to show that one can tag Sources with an 'identity' which can be used to 
    extract/match records in various usage cases.

  The data has been annotated using IVOA VO-DML Mapping syntax

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

* **Goal: Extract Source records matching a particular Identity.
    ```
    catalog = doc.find_instances(Source)[0]
    for srcid in [ 11237005, 99999999, 11173790 ]:
        matches = [rec for rec in catalog.unroll() if rec.identifier == srcid]
        sys.stdout.write("o Match Source records with id='%s': # matches = %d\n"%(str(srcid), len(matches)) )
    ```
o Match Source records with id='11237005': # matches = 1  
o Match Source records with id='99999999': # matches = 0  
o Match Source records with id='11173790': # matches = 1  
