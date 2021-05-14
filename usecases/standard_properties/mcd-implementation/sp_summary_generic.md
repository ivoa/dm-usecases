### Code
```
    # Load annotated file
    doc = Reader( Votable(infile) )

    # Extract list of Source records
    #  - Source model provides structure, organizing the Properties
    catalog = doc.find_instances(Source)[0]
    
    sys.stdout.write("\n")
    sys.stdout.write("o Goal: High Level content summary\n")
    sys.stdout.write("    o Number of records: %d\n"%( len(catalog.identifier) ) )
    sys.stdout.write("    o Number of unique Sources: %d\n"%( len(set(catalog.identifier)) ) )

    # Summarize content of example Source record.
    srcno = 2
    source = catalog.unroll()[srcno]

    sys.stdout.write("\n")
    sys.stdout.write("o Goal: Detail Level content summary\n")
    sys.stdout.write("    o Source number: {}\n".format( srcno+1 ) )
    sys.stdout.write("    o Identifier: {}\n".format( source.identifier ))

    for prop in ( source.parameter_dock ):
        sys.stdout.write( "    o Property: semantic={}, ucd={}\n".format( prop.semantic.label, prop.ucd ))
        sys.stdout.write( "        o {}\n".format( measure_toString( prop.measure )))
```

### 4XMM Catalog Results
* Goal: High Level content summary
    * Number of records: 5
    * Number of unique Sources: 5

* Goal: Detail Level content summary
    * Source number: 3
    * Identifier: 581245887037857577
    * Property: semantic=position, ucd=pos
        * Position: ( 183.267881 [deg],  27.708168 [deg] ) ellipse(major:3.517e-04, minor:3.517e-04, angle: 0.000) [ICRS]
    * Property: semantic=flux, ucd=phot.flux
        * Photometry: (1.101e-16 [erg/cm**2/s]) +/- 2.278e-16 [band=XMM_EB1]
    * Property: semantic=flux, ucd=phot.flux
        * Photometry: (3.290e-16 [erg/cm**2/s]) +/- 2.624e-16 [band=XMM_EB2]
    * Property: semantic=flux, ucd=phot.flux
        * Photometry: (3.248e-15 [erg/cm**2/s]) +/- 8.170e-16 [band=XMM_EB3]
    * Property: semantic=flux, ucd=phot.flux
        * Photometry: (2.026e-15 [erg/cm**2/s]) +/- 1.380e-15 [band=XMM_EB4]
    * Property: semantic=flux, ucd=phot.flux
        * Photometry: (2.867e-14 [erg/cm**2/s]) +/- 1.529e-14 [band=XMM_EB5]
    * Property: semantic=hardness_ratio, ucd=phot.color
        * HardnessRatio:  0.519 +/- 2.045e-01 [band_low: XMM_EB1, band_high: XMM_EB2]
    * Property: semantic=hardness_ratio, ucd=phot.color
        * HardnessRatio:  0.783 +/- 1.049e-01 [band_low: XMM_EB2, band_high: XMM_EB3]
    * Property: semantic=hardness_ratio, ucd=phot.color
        * HardnessRatio: -0.664 +/- 2.006e-01 [band_low: XMM_EB3, band_high: XMM_EB4]
    * Property: semantic=hardness_ratio, ucd=phot.color
        * HardnessRatio:  0.583 +/- 2.790e-01 [band_low: XMM_EB4, band_high: XMM_EB5]
    * Property: semantic=obs.exposure, ucd=time.duration
        * GenericMeasure: (    47325.9 [s] )
    * Property: semantic=obs.start, ucd=time
        * Time: 58300.444884 [TCB]
    * Property: semantic=quality, ucd=meta.code.qual
        * Flag: 0 [good]


### GAIA Catalog Results
* Goal: High Level content summary
    * Number of records: 50
    * Number of unique Sources: 50

* Goal: Detail Level content summary
    * Source number: 3
    * Identifier: 117544667186560
    * Property: semantic=position, ucd=pos
        * Position: (  45.319941 [deg],   0.916037 [deg] ) ellipse(major:1.988e-01, minor:1.955e-01, angle:   nan) [ICRS]
    * Property: semantic=flux, ucd=phot.flux
        * Photometry: (7.209e+02 [e-/s]) +/- 2.007e+00 [band=GAIA/GAIA2r.G]
    * Property: semantic=flux, ucd=phot.flux
        * Photometry: (2.501e+02 [e-/s]) +/- 1.211e+01 [band=GAIA/GAIA2r.Gbp]
    * Property: semantic=flux, ucd=phot.flux
        * Photometry: (7.589e+02 [e-/s]) +/- 9.894e+00 [band=GAIA/GAIA2r.Grp]
    * Property: semantic=hardness_ratio, ucd=phot.color
        * HardnessRatio:  1.795 [band_low: GAIA/GAIA2r.Gbp, band_high: GAIA/GAIA2r.Grp]
    * Property: semantic=quality, ucd=meta.code.qual
        * Flag: 0 [Not duplicated]


### Chandra Catalog Results
* Goal: High Level content summary
    * Number of records: 1000
    * Number of unique Sources: 326

* Goal: Detail Level content summary
    * Source number: 3
    * Identifier: 2CXO J104732.7+123024
    * Property: semantic=position, ucd=pos
        * Position: ( 233.542479 [deg],  57.535140 [deg] ) [GALACTIC]
    * Property: semantic=flux, ucd=phot.flux
        * Photometry: (9.743e-15 [erg/s/cm^2]) [band=CHANDRA/ACIS.broad]
    * Property: semantic=hardness_ratio, ucd=phot.color
        * HardnessRatio:  0.239 range(low: 0.028, high: 0.439) [band_low: CHANDRA/ACIS.hard, band_high: CHANDRA/ACIS.soft]
    * Property: semantic=hardness_ratio, ucd=phot.color
        * HardnessRatio:  0.311 range(low: 0.132, high: 0.489) [band_low: CHANDRA/ACIS.medium, band_high: CHANDRA/ACIS.soft]
    * Property: semantic=hardness_ratio, ucd=phot.color
        * HardnessRatio: -0.080 range(low:-0.242, high: 0.077) [band_low: CHANDRA/ACIS.medium, band_high: CHANDRA/ACIS.soft]
    * Property: semantic=obs.start, ucd=time
        * Time: 2006-04-09T10:51:35.000 [TT]
    * Property: semantic=quality, ucd=src.extent
        * Flag: 0 [Not Extended]
    * Property: semantic=quality, ucd=src.var
        * Flag: 1 [Source hardness ratios are statistically inconsistent between two or more observations]
