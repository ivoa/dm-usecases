# Mango Based Proposal for the `Native Frame` Case

## `vizier_csc2_gal.annot.xml`

- This the annotated version of `vizier_csc2_gal.xml`
- Raw data are mapped on the `MANGO` model
- The annotation syntax is this proposed as `ModelInstaceInVoT`
    - One annotation block on the top of the VOTable
    - One section with all the coordinate systems
        - Standard systems (e.g. ICRS) are just named
        - Specific system (energy band, flag values) are totally described
        - All are instances of MANGO classes
    - One section with the mapping of the data table
        - One instance per parameters
        - The content of this section denotes the model structure
    - The Spectra table is joined to the Result table by the `JOIN` mechanism of `ModelInstaceInVoT`
    
** Watchout** 
- Some class names can differ from the last MANGO proposal
- It is to be noted that the semantic fields are not properly set

The demo client (`ModelInstanceInVot/python_workflow/python/client/demo/vizier_csc2_gal.py`) can generate one JSON serialization for each data row. These MANGO instance can be processed as dictionaries by any language. 
        
The client output is in  `vizier_csc2_gal.mangoinstance.josn`      
```python

    mango_browser = MangoBrowser(votable_path) 
    
    mango_parameters = mango_browser.get_parameters()
    print("======== Parameters ")
    DictUtils.print_pretty_json(mango_parameters)
        
    print("======== 1st row data ")
    mango_data = mango_browser.get_data()
    DictUtils.print_pretty_json(mango_data)
  ```
