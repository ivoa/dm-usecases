# Raw Data for the `Combined Data` Case

## `4xmm_lite.xml`

VOTable with two tables
- `Results` : 5 sources with positions,names and identifiers
- `spectra` : 3 spectra URL all linked to the first source.

Both tables are joined by the `oidsaada` key.
The challenge is to annotate this VOTable in a way that
* a client can get the spectra attached to a particular source
    * mango:Source + mango:WebEndpoint


## `csc2_example.xml`

VOTable with two tables
- `MasterSourceTable` : 326 Sources with various properties (identifier, position, significance, extent, etc)
- `DetectionTable` : 1000 Detections (per Observation) of these sources, with various properties (identfier, position, time, flux, hardness_ratios, etc)

Tables can be joined by the identifier column (FIELD ID = 'mcol0','col0' respectively).  
The challenge is to annotate this VOTable in a way which:
* annotates the Master Source records
    * mango:Source
* associates the Detections with their corresponding Master record
    * mango:Source + mango:AssociatedMangoInstance
* annotates a LightCurve ( time, flux ) from the Detections for each source
    * cube:SparseCube
* associates the LightCurve with the corresponding Master record as well.
    * mango:VOModelInstance

