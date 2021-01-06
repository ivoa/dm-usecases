# Mango Based Proposal for the `Standard Properties` Case

## `4xmm_detections.annot.xml`

- This the annotated version of `4xmm_detections.xml`
- Raw data are mapped on the `MANGO` model
- The annotation syntax is this proposed as `ModelInstaceInVoT`
    - One annotation block on the top of the VOTable
    - One section with all the coordinate systems
        - Standard systems (e.g. ICRS) are just named
        - Specific system (energy band, flag values) are totally described
        - All are instances of MANGO classes
    - One section with the mapping of the data table
        - One instance per parameters
        - The content of this section denotes the model  struture
        
** Watchout** 
- Some class names can differ from the last MANGO proposal
- It is to be noted that the semantic fields are not properly set

The demo client (`ModelInstanceInVot/python_workflow/python/client/demo/4xmm_detections.py`) can generate one JSON serialization for each data row. These MANGO instance can be processed as dictionaries by any language. 
        