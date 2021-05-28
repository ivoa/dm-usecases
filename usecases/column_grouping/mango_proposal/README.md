# Mango Proposal for the `Combined Data` Case


## `vizier_grouped_col_withref.annot.xml`

- This the annotated version of `4xmm_litewithsp.annot.xml`
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
    
** Watchout** 
- Some class names can differ from the last MANGO proposal
- It is to be noted that the semantic fields are not properly set

The demo client (`ModelInstanceInVot/python_workflow/python/client/demo/vizier_grouped_col_withref.py`) can generate one Python dict serialization of the MANGO instance
        
```python
    votable_path = os.path.join(data_dir,
                                "vizier_grouped_col_withref.annot.xml"
                                )    
    mango_browser = MangoBrowser(votable_path) 
    
    mango_parameters = mango_browser.get_parameters()
    print(DictUtils.get_pretty_json(mango_parameters))
    #OUTPUT IN THE JSON FILE
    mango_data = mango_browser.get_data()
    print(DictUtils.get_pretty_json(mango_data))
```

Output (1st row):

```
{
  "data": [
    [
      1,
      -11.0,
      6,
      "S"
    ]
  ],
  "head": [
    "mango:MangoObject.identifier",
    "field:meas:GenericMeasure.coord (#radial velocity)",
    "field:meas:GenericMeasure.coord (#Number.of.plates)",
    "field:meas:GenericMeasure.coord (#observatory)"
  ],
  "selected_index": [
    4,
    3,
    0,
    1
  ]
}

```