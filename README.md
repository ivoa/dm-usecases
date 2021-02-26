# DM Workshop Repository

## Context

- During fall 2020 Interop a wide discussion on both Measure and Coordinate models and possibly at refining their usages has been open.
  https://wiki.ivoa.net/twiki/bin/view/IVOA/InterOpNov2020DM
  
- This came after a long discussion on the mailing list, related to the necessity of keeping or not a tight dependency between Measurements and Coordinates (MC). 
- It has also been suggested that product models (e.g. CubeDM ) could be replaced with domain related components.

- The major points of the audience contributions are :
    - There is a clear demand for using models
    - There is a clear demand for the models to be simple and modular.
    - The distinction between what is modelling and what is serialisation is unclear.
  
- The need for a concrete solution for annotating catalog data has been tackled by the WG for a couple of years along with the development of Measurements/Coordinates models.
    - 2018:Discussions have been engaged on this topic after a hands-on session in Victoria.
    https://wiki.ivoa.net/twiki/bin/view/IVOA/SourceCatalogs
    - 2019: Data providers and client developers were asked to present their needs in a dedicated session at Paris
    https://wiki.ivoa.net/twiki/bin/view/IVOA/InterOpMay2019DM
    
- After these 2 surveys the scope of the model usage has been exposed in Virtual May and we have been working on MANGO (model for source data with some MC adaptations ) that has been sketched in Groningen and the in virtual-May 2020. It has been presented presented in virtual-Fall 2020.
    https://wiki.ivoa.net/internal/IVOA/InterOpNov2020DM/Mango_interopFall2020.pdf

## The workshop

- To continue this action we propose to organize a virtual workshop (initially proposed by Tom to the TCG) with the hope of getting a widely accepted framework.
- The idea is not to start afresh but to give to the participants the opportunity of matching their needs with the current proposals.
- To get a clear picture of what has to be done, we propose to work with a variety concrete use cases and data samples provided by interested people. 
- This repository contains all material gathered to exercise the models and their annotations.

## Repository setup

- All use cases are located un `use-cases`
- Each use case has the following content
    - One `README` describing the case
    - One `raw-data` directory containing non annotated VOTables which content matches the case. A `README` tells more about these data files
    - One sub-directory for each proposal
        - The content of the proposal sub-dirs is left to the discrepancy of the author.
        - It must however contain data and text (`README`) only.

## Contributor Guide

- Please have a look at that [guide](https://github.com/ivoa/dm-usecases/wiki/guide) to contribute
