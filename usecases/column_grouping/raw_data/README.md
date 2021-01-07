# Raw Data for the `Column Grouping` Case

## `vizier_grouped_col.xml`

VOTable returned by a query on the `III/21/gcrv` Vizier catalog.

This table contains a set of columns related to the radial velocity:
- `VR` : radial velocity
- `q_VR` : quality flag of the radial velocity.
- `o_VR` : number of plates used to compute the radial velocity.
- `r_VR` : Abbreviation of observatory .

The challenge is to annotate this VOTable in a way that a client can see that the `*_VR` columns are related to `VR`  