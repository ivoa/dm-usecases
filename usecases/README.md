
The table below summarize the connection betzeen porject and use-cases

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

| Usecase vs proposal  | mango-proposal | md-proposal |
| identity             |  yes           |             |
| native_frames        |  yes           |             |
| simple_position      |  yes           |             |
| standard_properties  |  yes           |             |
| precise_astrometry   |  yes           |             |
| column_grouping      |  yes           |             |
| combined_data        |  yes           |             |
| complex-shaped-object|  yes           |             |
| orbital-system       |  yes           |             |
| time-series          |                | yes         |
