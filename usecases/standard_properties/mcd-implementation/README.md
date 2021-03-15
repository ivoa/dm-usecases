# Implementation of 'Native-Frame' case

# Overview
This case involves data from several Catalogs
* 4XMM DR9
* Chandra Source Catalog - Release 2.0
* GAIA DR2

The primary goal of is to annotate common Properties from each.
* There appears to be no 'action' goal involved with this case yet.  
So, will start with using the same script to extract and summarize  
the contents of each.. illustrating that the model concepts are  
facilitating the identification/extraction of the relevant data.

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
    catalog = doc.find_instances(Source)[0]
    ```

* **Goal: Apply Annotation on data from multiple catalogs **  
    ```
    sys.stdout.write("High Level content summary\n")
    sys.stdout.write("o Number of records: %d\n"%( len(catalog.identifier) ) )
    sys.stdout.write("o Number of unique Sources: %d\n"%( len(set(catalog.identifier)) ) )

    sys.stdout.write("Detail Level content example\n")
    sys.stdout.write("o Source number: %d\n"%( srcno+1 ) )
    sys.stdout.write("o Identifier: %s\n"%( str(catalog.identifier[srcno])) )

    // example logic for each 'Property'
    //   o Obs. Start
    //   o Obs. Duration
    //   o Position
    //   o Flux w/Error - per band
    //   o Hardness Ratio w/Error - per
    //   o Quality flags
    matches = find_property( catalog, Type, Role )
    for prop in matches:
        sys.stdout.write("o {Property}  {value w/ error} [unit] [frame_metadata]]\n"%( prop.measure... )

    ```  
** 4XMM Catalog Results
High Level content summary
o Number of records: 5
o Number of unique Sources: 5

Detail Level content example
o Source number: 3
o Identifier: 581245887037857577
o Obs Start:     58300.444884 [TCB]
o Obs Duration:  47325.900000 s
o Position: ( 183.267881,  27.708168 ) deg [ICRS]
o Flux: ( 1.101e-16 +/- 2.278e-16) erg/cm**2/s  [band=XMM_EB1]
o Flux: ( 3.290e-16 +/- 2.624e-16) erg/cm**2/s  [band=XMM_EB2]
o Flux: ( 3.248e-15 +/- 8.170e-16) erg/cm**2/s  [band=XMM_EB3]
o Flux: ( 2.026e-15 +/- 1.380e-15) erg/cm**2/s  [band=XMM_EB4]
o Flux: ( 2.867e-14 +/- 1.529e-14) erg/cm**2/s  [band=XMM_EB5]
o HardnessRatio: ( 0.519 +/- 2.045e-01) [band_low=XMM_EB2, band_high=XMM_EB1]
o HardnessRatio: ( 0.783 +/- 1.049e-01) [band_low=XMM_EB3, band_high=XMM_EB2]
o HardnessRatio: (-0.664 +/- 2.006e-01) [band_low=XMM_EB4, band_high=XMM_EB3]
o HardnessRatio: ( 0.583 +/- 2.790e-01) [band_low=XMM_EB5, band_high=XMM_EB4]
o Quality: 0 [good]

** GAIA Catalog Results
High Level content summary
o Number of records: 50
o Number of unique Sources: 50

Detail Level content example
o Source number: 3
o Identifier: 117544667186560
o Obs Start:     none
o Obs Duration:  none
o Position: (  45.319941,   0.916037 ) deg [ICRS]
o Flux: ( 7.209e+02 +/- 2.007e+00) e-/s  [band=GAIA/GAIA2r.G]
o Flux: ( 2.501e+02 +/- 1.211e+01) e-/s  [band=GAIA/GAIA2r.Gbp]
o Flux: ( 7.589e+02 +/- 9.894e+00) e-/s  [band=GAIA/GAIA2r.Grp]
o HardnessRatio: ( 1.795 +/- [none]) [band_low=GAIA/GAIA2r.Grp, band_high=GAIA/GAIA2r.Gbp]
o Quality: 0 [Not duplicated]

** Chandra Catalog Results
High Level content summary
o Number of records: 1000
o Number of unique Sources: 326

Detail Level content summary
o Source number: 3
o Identifier: 2CXO J104732.7+123024
o Obs Start:     53834.452488 [TT]
o Obs Duration:  none
o Position: ( 233.542479,  57.535140 ) deg [GALACTIC]
o Flux: ( 9.743e-15 +/- [none]) erg/s/cm^2  [band=CHANDRA/ACIS.broad]
o HardnessRatio: ( 0.239 +/- [hi: 0.439, low: 0.028]) [band_low=CHANDRA/ACIS.soft, band_high=CHANDRA/ACIS.hard]
o HardnessRatio: ( 0.311 +/- [hi: 0.489, low: 0.132]) [band_low=CHANDRA/ACIS.soft, band_high=CHANDRA/ACIS.medium]
o HardnessRatio: (-0.080 +/- [hi: 0.077, low:-0.242]) [band_low=CHANDRA/ACIS.soft, band_high=CHANDRA/ACIS.medium]
o Quality: 0 [Not Extended]
o Quality: 1 [Source hardness ratios are statistically inconsistent between two or more observations]


