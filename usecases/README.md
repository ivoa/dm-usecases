## Contributor Guide
- Please have a look at that [guide](https://github.com/ivoa/dm-usecases/wiki/guide) to contribute

## Contribution Summary

### Connections between projects and use-cases

| Usecase vs Project | XMM | Chandra | Vizier | GLAST | LSST | GAVO | Gaia | Simbad | Other project | Mock data |
| -------------------| ------ | -----| -----  | ----- | ---- | ---- | ---- | ------ | ------------- | --------- |
| identity           |  C     | C    | C      | C     | C    | C    | C    | P C    |               |           |
| native_frames      |        |      | P C    |       |      |      |      |        |               |           |
| simple_position    |  C     |  C   | C      | C     | C    | C    | C    | C      |               |           |
| standard_properties|  P C   |  C   | C      | C     | C    | C    | C    | C      |               |           |
| precise_astrometry |        |      | C      |       | C    |      | C    |        |               | P         |
| column_grouping    |        |      | P C    |       |      |      |      |        |               |           |
| combined_data      |  P C   |   C  | C      | C     |  C   |  C   |      |        |               |           |
| complex-shaped-object|      |      |        | P C   |      |      |      |        |               |           |
| orbital-system     |        |      |        |  P C  |      |      |      |        |               |           |
| time-series        |  C     | C    | C      |       | C    | P C  |      |        |               |           |

* **P** Raw data provided
* **C** Concerned by the use-case


### Use case proposal coverage 

| Usecase vs proposal  | mango-proposal | md-proposal | mcd-implementation | modelinstanceinvot |
| ---------------------| -------------- | ----------- | ------------------ |--------------------|
| identity             |  S I           |             | S I                |                    |
| native_frames        |  S I           |             | S I                |                    |
| simple_position      |  S I           |             |                    |                    |
| standard_properties  |  S I           |             | S I                |                    |
| precise_astrometry   |  S I           |             |                    |                    |
| column_grouping      |  S I           |             |                    |                    |
| combined_data        |  S I           |             |                    |                    |
| complex-shaped-object|  S             |             |                    |                    |
| orbital-system       |  S             |             |                    |                    |
| time-series          |                | S I         | S I                |  S I               |

* **S** supported
* **I** implemented
