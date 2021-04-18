## Model Instance Summary:
Input file: csc2_example_annotated.vot

### Goal: Find Primary Instances
    doc = Reader( Votable(infile) )
    masterSources = doc.find_instances(Source)[0]
    detections = doc.find_instances(Source)[1]
    lightcurves = doc.find_instances(SparseCube)[0]

### Goal: High Level content summary
```
Master Source List
  o Type: rama.models.mango.Source
  o Number of records: 326
  o Number of unique Sources: 326
  o Associated Parameters: 4
  o Associated Data: 8

Detections List = all detections
  o Type: rama.models.mango.Source
  o Number of records: 1000
  o Number of unique Sources: 326
  o Associated Parameters: 5
  o Associated Data: none

LightCurves - one per source
  o Type: rama.models.cube.SparseCube
  o Number of curves: 326
  o Independent Axis: ['time']
  o Dependent Axis: ['generic']
  o Length (max detections): 7
```

### Goal: Detailed content example
Source number: 4
```
rama.models.mango.Source:
  o identifier: 2CXO J004206.0-125512
  o Associated Parameters:
     1.rama.models.mango.Parameter:
         o semantic: position
         o ucd: pos
         o measure: Position: ( 113.731191 [deg], -75.624794 [deg] ) [GALACTIC]
     2.rama.models.mango.Parameter:
         o semantic: significance
         o ucd: stat.snr
         o measure: GenericMeasure: ( 1.355204e+01 )
     3.rama.models.mango.Parameter:
         o semantic: quality
         o ucd: src.extent
         o measure: Flag: 0 [Not Extended]
     4.rama.models.mango.Parameter:
         o semantic: quality
         o ucd: src.var
         o measure: Flag: 1 [Source hardness ratios are statistically inconsistent between two or more observations]
  o Associated Data:
     1.rama.models.mango.VOModelInstance:
         o semantic: lightcurve
         o datatype: cube:SparseCube?
         o ivoid: cube:SparseCube
         o modelName: cube
         o modelURL: https://volute.g-vo.org/svn/trunk/projects/dm/Cube/vo-dml/Cube-1.0.vo-dml.xml
         o modelInstance:
           rama.models.cube.SparseCube:
                o Independent Axis: ['time']
                o Dependent Axis: ['generic']
                o Length: 7
                o    Time: 2009-08-23T13:09:54.000 [TT]      GenericMeasure: ( 1.50801e-14 [erg/s/cm^2] )
                o    Time: 2011-11-03T14:34:59.000 [TT]      GenericMeasure: ( 8.63692e-15 [erg/s/cm^2] )
                o    Time: 2011-11-15T23:19:21.000 [TT]      GenericMeasure: ( 1.1981e-14 [erg/s/cm^2] )
                o    Time: 2012-01-26T08:30:21.000 [TT]      GenericMeasure: ( 1.66831e-14 [erg/s/cm^2] )
                o    Time: 2012-08-30T04:04:22.000 [TT]      GenericMeasure: ( 1.65738e-14 [erg/s/cm^2] )
     2.rama.models.mango.AssociatedMangoInstance:
         o semantic: detection
         o datatype: mango:Source
         o mangoInstance:
           rama.models.mango.Source:
                o identifier: 2CXO J004206.0-125512
                o Associated Parameters:
                   1.rama.models.mango.Parameter:
                       o semantic: obs.start
                       o ucd: time
                       o measure: Time: 2009-08-23T13:09:54.000 [TT]
                   2.rama.models.mango.Parameter:
                       o semantic: flux
                       o ucd: phot.flux
                       o measure: Photometry: (1.508e-14 [erg/s/cm^2]) [band=CHANDRA/ACIS.broad]
                   3.rama.models.mango.Parameter:
                       o semantic: hardness_ratio
                       o ucd: phot.color
                       o measure: HardnessRatio: -0.349 range(low:-0.473, high:-0.220) [band_low: CHANDRA/ACIS.hard, band_high: CHANDRA/ACIS.soft]
                   4.rama.models.mango.Parameter:
                       o semantic: hardness_ratio
                       o ucd: phot.color
                       o measure: HardnessRatio: -0.174 range(low:-0.284, high:-0.062) [band_low: CHANDRA/ACIS.medium, band_high: CHANDRA/ACIS.soft]
                   5.rama.models.mango.Parameter:
                       o semantic: hardness_ratio
                       o ucd: phot.color
                       o measure: HardnessRatio: -0.184 range(low:-0.323, high:-0.044) [band_low: CHANDRA/ACIS.hard, band_high: CHANDRA/ACIS.medium]
                o Associated Data:
                   0. none
     3.rama.models.mango.AssociatedMangoInstance:
         o semantic: detection
         o datatype: mango:Source
         o mangoInstance:
           rama.models.mango.Source:
                o identifier: 2CXO J004206.0-125512
                o Associated Parameters:
                   1.rama.models.mango.Parameter:
                       o semantic: obs.start
                       o ucd: time
                       o measure: Time: 2011-11-03T14:34:59.000 [TT]
                   2.rama.models.mango.Parameter:
                       o semantic: flux
                       o ucd: phot.flux
                       o measure: Photometry: (8.637e-15 [erg/s/cm^2]) [band=CHANDRA/ACIS.broad]
                   3.rama.models.mango.Parameter:
                       o semantic: hardness_ratio
                       o ucd: phot.color
                       o measure: HardnessRatio: -0.839 range(low:-0.960, high:-0.689) [band_low: CHANDRA/ACIS.hard, band_high: CHANDRA/ACIS.soft]
                   4.rama.models.mango.Parameter:
                       o semantic: hardness_ratio
                       o ucd: phot.color
                       o measure: HardnessRatio: -0.477 range(low:-0.643, high:-0.288) [band_low: CHANDRA/ACIS.medium, band_high: CHANDRA/ACIS.soft]
                   5.rama.models.mango.Parameter:
                       o semantic: hardness_ratio
                       o ucd: phot.color
                       o measure: HardnessRatio: -0.601 range(low:-0.856, high:-0.285) [band_low: CHANDRA/ACIS.hard, band_high: CHANDRA/ACIS.medium]
                o Associated Data:
                   0. none
     4.rama.models.mango.AssociatedMangoInstance:
         o semantic: detection
         o datatype: mango:Source
         o mangoInstance:
           rama.models.mango.Source:
                o identifier: 2CXO J004206.0-125512
                o Associated Parameters:
                   1.rama.models.mango.Parameter:
                       o semantic: obs.start
                       o ucd: time
                       o measure: Time: 2011-11-15T23:19:21.000 [TT]
                   2.rama.models.mango.Parameter:
                       o semantic: flux
                       o ucd: phot.flux
                       o measure: Photometry: (1.198e-14 [erg/s/cm^2]) [band=CHANDRA/ACIS.broad]
                   3.rama.models.mango.Parameter:
                       o semantic: hardness_ratio
                       o ucd: phot.color
                       o measure: HardnessRatio: -0.344 range(low:-0.578, high:-0.083) [band_low: CHANDRA/ACIS.hard, band_high: CHANDRA/ACIS.soft]
                   4.rama.models.mango.Parameter:
                       o semantic: hardness_ratio
                       o ucd: phot.color
                       o measure: HardnessRatio: -0.157 range(low:-0.365, high: 0.066) [band_low: CHANDRA/ACIS.medium, band_high: CHANDRA/ACIS.soft]
                   5.rama.models.mango.Parameter:
                       o semantic: hardness_ratio
                       o ucd: phot.color
                       o measure: HardnessRatio: -0.190 range(low:-0.450, high: 0.078) [band_low: CHANDRA/ACIS.hard, band_high: CHANDRA/ACIS.medium]
                o Associated Data:
                   0. none
     5.rama.models.mango.AssociatedMangoInstance:
         o semantic: detection
         o datatype: mango:Source
         o mangoInstance:
           rama.models.mango.Source:
                o identifier: 2CXO J004206.0-125512
                o Associated Parameters:
                   1.rama.models.mango.Parameter:
                       o semantic: obs.start
                       o ucd: time
                       o measure: Time: 2012-01-26T08:30:21.000 [TT]
                   2.rama.models.mango.Parameter:
                       o semantic: flux
                       o ucd: phot.flux
                       o measure: Photometry: (1.668e-14 [erg/s/cm^2]) [band=CHANDRA/ACIS.broad]
                   3.rama.models.mango.Parameter:
                       o semantic: hardness_ratio
                       o ucd: phot.color
                       o measure: HardnessRatio: -0.110 range(low:-0.365, high: 0.148) [band_low: CHANDRA/ACIS.hard, band_high: CHANDRA/ACIS.soft]
                   4.rama.models.mango.Parameter:
                       o semantic: hardness_ratio
                       o ucd: phot.color
                       o measure: HardnessRatio: -0.326 range(low:-0.549, high:-0.074) [band_low: CHANDRA/ACIS.medium, band_high: CHANDRA/ACIS.soft]
                   5.rama.models.mango.Parameter:
                       o semantic: hardness_ratio
                       o ucd: phot.color
                       o measure: HardnessRatio:  0.227 range(low:-0.054, high: 0.479) [band_low: CHANDRA/ACIS.hard, band_high: CHANDRA/ACIS.medium]
                o Associated Data:
                   0. none
     6.rama.models.mango.AssociatedMangoInstance:
         o semantic: detection
         o datatype: mango:Source
         o mangoInstance:
           rama.models.mango.Source:
                o identifier: 2CXO J004206.0-125512
                o Associated Parameters:
                   1.rama.models.mango.Parameter:
                       o semantic: obs.start
                       o ucd: time
                       o measure: Time: 2012-08-30T04:04:22.000 [TT]
                   2.rama.models.mango.Parameter:
                       o semantic: flux
                       o ucd: phot.flux
                       o measure: Photometry: (1.657e-14 [erg/s/cm^2]) [band=CHANDRA/ACIS.broad]
                   3.rama.models.mango.Parameter:
                       o semantic: hardness_ratio
                       o ucd: phot.color
                       o measure: HardnessRatio: -0.336 range(low:-0.548, high:-0.107) [band_low: CHANDRA/ACIS.hard, band_high: CHANDRA/ACIS.soft]
                   4.rama.models.mango.Parameter:
                       o semantic: hardness_ratio
                       o ucd: phot.color
                       o measure: HardnessRatio: -0.492 range(low:-0.670, high:-0.284) [band_low: CHANDRA/ACIS.medium, band_high: CHANDRA/ACIS.soft]
                   5.rama.models.mango.Parameter:
                       o semantic: hardness_ratio
                       o ucd: phot.color
                       o measure: HardnessRatio:  0.195 range(low:-0.089, high: 0.452) [band_low: CHANDRA/ACIS.hard, band_high: CHANDRA/ACIS.medium]
                o Associated Data:
                   0. none
```
