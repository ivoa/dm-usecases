# Raw Data for the `Standard Property` Case

## `4xmm_detections.xml`

Subset of the 4XMM dr9 detection catalogs.

Only a subset of parameters must be annotated for this case:
- Source `identifier`
- Corrected `position` with error
- `Flux` in all energy bands with errors
- `Hardness Ratio` in all energy bands with errors
- Observation `duration`
- Observation `start time`
- Detection flag

Most of the parameters have a mission specific space frame (flag values, energy bands, HR) that must be described in the annotated VOTable