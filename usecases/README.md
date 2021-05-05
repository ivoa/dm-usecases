## Contributor Guide
- Please have a look at that [guide](https://github.com/ivoa/dm-usecases/wiki/guide) to contribute

## Contribution Summary

### Connections between projects and use-cases

| Usecase vs Project | XMM | Chandra | Vizier | GLAST | LSST | GAVO | Gaia | Simbad | Other project | Mock data |
| -------------------| ------ | -----| -----  | ----- | ---- | ---- | ---- | ------ | ------------- | --------- |
| identity           |  C     | C    | C      | C     | C    | C    | C    | R C    |               |           |
| native_frames      |        |      | R C    |       |      |      |      |        |               |           |
| simple_position    |  C     |  C   | C      | C     | C    | C    | C    | C      |               |           |
| standard_properties|  R C   |  C   | C      | C     | C    | C    | C    | C      |               |           |
| precise_astrometry |        |      | C      |       | C    |      | C    |        |               | R         |
| column_grouping    |        |      | R C    |       |      |      |      |        |               |           |
| combined_data      |  R C   |   C  | C      | C     |  C   |  C   |      |        |               |           |
| complex-shaped-object|      |      |        | R C   |      |      |      |        |               |           |
| orbital-system     |        |      |        | R C   |      |      |      |        |               |           |
| time-series        |  C     | C    | C      |       | C    | R C  |      |        |  ZTF: R C     |           |

* **R** Raw data provided
* **C** Concerned by the use-case


### Use case proposal coverage 

| Usecase vs proposal  | mango-proposal (*)| md-proposal | mcd-implementation | modelinstanceinvot | VODML-Mapper (**)|
| ---------------------| ----------------- | ----------- | ------------------ |--------------------|------------------|
| identity             |  S I              |             | S I                |                    |  S I             |
| native_frames        |  S I              |             | S I                |                    |  S I             |
| simple_position      |  S I              |             |                    |                    |                  |
| standard_properties  |  S I              |             | S I                |                    |  S I             |
| precise_astrometry   |  S I              |  S I        |                    |                    |  S I             |
| column_grouping      |  S I              |             |                    |                    |  S I             |
| combined_data        |  S I              |             | S I                |                    |  S I             |
| complex-shaped-object|  S                |             |                    |                    |                  |
| orbital-system       |  S                |             |                    |                    |                  |
| time-series          |                   | S I         | S I                |  S I               |                  |

* **S** supported
* **I** implemented

(*) Serialized with modelinstanceinvot
(**) VODML-Mapper is available on http://dsa012.pha.jhu.edu:8081/VODML-Mapper/