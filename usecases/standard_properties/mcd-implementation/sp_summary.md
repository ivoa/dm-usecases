* Load Annotated VOTable
    ```
    doc = Reader( Votable(infile) )
    catalog = doc.find_instances(Source)[0]
    ```

* Goal: Apply Annotation on data from multiple catalogs  
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
* 4XMM Catalog Results
    * High Level content summary
        * Number of records: 5
        * Number of unique Sources: 5

    * Detail Level content example
        * Source number: 3
        * Identifier: 581245887037857577
        * Obs Start:     58300.444884 [TCB]
        * Obs Duration:  47325.900000 s
        * Position: ( 183.267881,  27.708168 ) deg [ICRS]
        * Flux: ( 1.101e-16 +/- 2.278e-16) erg/cm**2/s  [band=XMM_EB1]
        * Flux: ( 3.290e-16 +/- 2.624e-16) erg/cm**2/s  [band=XMM_EB2]
        * Flux: ( 3.248e-15 +/- 8.170e-16) erg/cm**2/s  [band=XMM_EB3]
        * Flux: ( 2.026e-15 +/- 1.380e-15) erg/cm**2/s  [band=XMM_EB4]
        * Flux: ( 2.867e-14 +/- 1.529e-14) erg/cm**2/s  [band=XMM_EB5]
        * HardnessRatio: ( 0.519 +/- 2.045e-01) [band_low=XMM_EB2, band_high=XMM_EB1]
        * HardnessRatio: ( 0.783 +/- 1.049e-01) [band_low=XMM_EB3, band_high=XMM_EB2]
        * HardnessRatio: (-0.664 +/- 2.006e-01) [band_low=XMM_EB4, band_high=XMM_EB3]
        * HardnessRatio: ( 0.583 +/- 2.790e-01) [band_low=XMM_EB5, band_high=XMM_EB4]
        * Quality: 0 [good]

* GAIA Catalog Results
    * High Level content summary
        * Number of records: 50
        * Number of unique Sources: 50

    * Detail Level content example
        * Source number: 3
        * Identifier: 117544667186560
        * Obs Start:     none
        * Obs Duration:  none
        * Position: (  45.319941,   0.916037 ) deg [ICRS]
        * Flux: ( 7.209e+02 +/- 2.007e+00) e-/s  [band=GAIA/GAIA2r.G]
        * Flux: ( 2.501e+02 +/- 1.211e+01) e-/s  [band=GAIA/GAIA2r.Gbp]
        * Flux: ( 7.589e+02 +/- 9.894e+00) e-/s  [band=GAIA/GAIA2r.Grp]
        * HardnessRatio: ( 1.795 +/- [none]) [band_low=GAIA/GAIA2r.Grp, band_high=GAIA/GAIA2r.Gbp]
        * Quality: 0 [Not duplicated]

* Chandra Catalog Results
    * High Level content summary
        * Number of records: 1000
        * Number of unique Sources: 326

    * Detail Level content summary
        * Source number: 3
        * Identifier: 2CXO J104732.7+123024
        * Obs Start:     53834.452488 [TT]
        * Obs Duration:  none
        * Position: ( 233.542479,  57.535140 ) deg [GALACTIC]
        * Flux: ( 9.743e-15 +/- [none]) erg/s/cm^2  [band=CHANDRA/ACIS.broad]
        * HardnessRatio: ( 0.239 +/- [hi: 0.439, low: 0.028]) [band_low=CHANDRA/ACIS.soft, band_high=CHANDRA/ACIS.hard]
        * HardnessRatio: ( 0.311 +/- [hi: 0.489, low: 0.132]) [band_low=CHANDRA/ACIS.soft, band_high=CHANDRA/ACIS.medium]
        * HardnessRatio: (-0.080 +/- [hi: 0.077, low:-0.242]) [band_low=CHANDRA/ACIS.soft, band_high=CHANDRA/ACIS.medium]
        * Quality: 0 [Not Extended]
        * Quality: 1 [Source hardness ratios are statistically inconsistent between two or more observations]

