# Implementation of 'Standard Properties' case

# Overview
This case involves data from several Catalogs
* 4XMM DR9
* Chandra Source Catalog - Release 2.0
* GAIA DR2

There are two parts to this challenge:
1. Common Properties
    1. Annotate common Properties in each file.
    2. Use the same script to process and summarize the contents of each.
       This illustrates how the model concepts facilitate the identification/extraction of the relevant data.  
       Special Note: The Chandra data serializes Obs. Start using ISO8601 format, while the others serialize in MJD.
       The annotations identify the particular type for interpretation.  These are auto-converted to astropy:Time instances.
2. Proper Motion focus
    1. The primary goal here is for each implementation to plot Position and Proper Motion data from the test file.


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
## Challenge 1:
* Annotation
    * 4xmm_detections_annotated.vot
        * Position (ICRS) with Ellipse Error
        * Photometry (flux) with Symmetrical Error; per band
        * HardnessRatio with Symmetrical Error; x4
        * Observation Duration
        * Observation Start Time (MJD)
        * Detection Flag
    * ivoa_csc2_example_annotated.vot
        * Position (Galactic)
        * Photometry (flux); 1 band
        * HardnessRatio with Bounds Error; x3
        * Observation Start Time (ISOTime)
        * Extended Flag
        * Variability Flag
    * vizier_gaiadr2_annotated.vot
        * Position (ICRS) with Box Error
        * Photometry (flux); 3 bands
        * HardnessRatio; x1
	
* Consumption
    * Generic scan for contained properties: see [sp_summary_generic.md](sp_summary_generic.md)
    * Targeted search for specific properties: see [sp_summary.md](sp_summary.md)

## Challenge 2:
* Annotation: vizier_propermotion_annotated.vot
    * Annotating ONLY the Measurements (no Source context).
      This is to help illustrate that it does not matter if the Measures are isolated, or part of a larger product, the processing script would continue to work.. without change.
    * Annotated Position and ProperMotion columns.  We did not include the Error terms, mainly because the AstroPy code
      featured in this case do not include error terms.
        * SkyCoord proper motion expects (pm_racosdec, pm_dec), this data seems to contain (pm_ra, pm_dec).  The model needs something to convey whether or not the data has applied cos(dec).

* Consumption
    * see [vizier_pm_summary.md](vizier_pm_summary.md) for data summary and plot generation details.
