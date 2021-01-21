# Raw Data for the `Combined Data` Case

## `4xmm_lite.xml`

VOTable with two tables
- `Results` : 5 sources with positions,names and identifiers
- `spectra` : 3 spectra URL all linked to the first source.

Both tables are joined by the `oidsaada` key.
The challenge is to annotate this VOTable in a way that a client can get the spectra attached to a particular source 