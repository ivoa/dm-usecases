## Contributor Guide
- Please have a look at that [guide](https://github.com/ivoa/dm-usecases/wiki/guide) to contribute

## Contribution Summary

### Connections between projects and use-cases

* *P* Raw data provided
* *C* Concerned by the use-case

| Usecase vs Project | XMM | Chandra | Vizier | GLAST | LSST | GAVO | Gaia | Simbad | Other project | Mock data |
| -------------------| ------ | ----- | ----- | ---- | --- | --- | ----- | ----- | ----- | ----- |
| identity           |  C     | C    | C     | C     | C    | C   |C    | P C   |       |       |
| native_frames      |        |         | P C   |       |      |     |     |       |       |       |
| simple_position    |  C     |  C      | C     | C     | C    | C   | C   | C     |       |       |
| standard_properties|  P C   |  C      | C     | C     | C    | C   | C   | C     |       |       |
| precise_astrometry |        |         | C     |       | C    |     | C   |       |       | P     |
| column_grouping    |        |         | P C   |       |      |     |     |       |       |       |
| combined_data      |  P C   |   C     | C     | C     |  C   |  C  |     |       |       |       |
| complex-shaped-object|        |       |       | P C   |      |     |     |       |       |       |
| orbital-system     |        |         |       |  P C  |      |     |     |       |       |       |
| time-series        |  C     | C       | C     |       | C    | P C |     |       |       |       |

### Use case proposal coverage 

| Usecase vs proposal  | mango-proposal | md-proposal |
| ---------------------| -------------- | ----------- |
| identity             |  yes           |             |
| native_frames        |  yes           |             |
| simple_position      |  yes           |             |
| standard_properties  |  yes           |             |
| precise_astrometry   |  yes           |             |
| column_grouping      |  yes           |             |
| combined_data        |  yes           |             |
| complex-shaped-object|  niy           |             |
| orbital-system       |  niy           |             |
| time-series          |                | yes         |

* *niy* supported by not implemented yet
