## Contributor Guide
- Please have a look at that [guide](https://github.com/ivoa/dm-usecases/wiki/guide) to contribute

## Contribution Summary

### Connections between projects and use-cases

* **P** Raw data provided
* **C** Concerned by the use-case

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
| identity             |  SI            |             |
| native_frames        |  SI            |             |
| simple_position      |  SI            |             |
| standard_properties  |  SI            |             |
| precise_astrometry   |  SI            |             |
| column_grouping      |  SI            |             |
| combined_data        |  SI            |             |
| complex-shaped-object|  S             |             |
| orbital-system       |  S             |             |
| time-series          |                | SI          |

* **S** supported
* **I** implemented
