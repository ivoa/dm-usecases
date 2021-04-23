# Mango Based Proposal for the `Identity` Case

### `simbad_idonly.annot.xml`
- This the annotated version of `simbad_idonly.xml`
- Raw data are mapped on the `MANGO` model
- The annotation syntax is this proposed as `ModelInstaceInVoT`
    - One annotation block on the top of the VOTable
    - One section with all the coordinate systems
    - One section with the mapping of the data table
        - One instance per parameters
        - The content of this section denotes the model structure
    
** Watchout** 
- Some class names can differ from the last MANGO proposal
- It is to be noted that the semantic fields are not properly set

The demo client (`ModelInstanceInVot/python_workflow/python/client/demo/simbad_idonly.py`) can generate one JSON serialization for each data row. These MANGO instance can be processed as dictionaries by any language. 
        
The client output is in  `simbad_id_only.mangoinstance.josn`      
```python

    mango_browser = MangoBrowser(votable_path) 
    
    mango_parameters = mango_browser.get_parameters()
    print("======== Parameters ")
    DictUtils.print_pretty_json(mango_parameters)
        
    print("======== 1st row data ")
    mango_data = mango_browser.get_data()
    DictUtils.print_pretty_json(mango_data)
  ```
