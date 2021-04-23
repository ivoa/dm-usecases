# Mango Based Proposal for the `Standard Properties` Case



## Annotated Dataset `RAW_DATASET.annot.xml`

- This the annotated version of `RAW_DATASET.xml`
- Raw data are mapped on the `MANGO` model
- The annotation syntax is this proposed as `ModelInstaceInVoT`:
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
- Semantic fields are not properly set
        
#### MANGO Parser

The MANGO parsing API is documented [here](https://github.com/ivoa/dm-usecases/wiki/mango#lm-mango-parser)

Client code can be found [here](https://github.com/ivoa/modelinstanceinvot-code/python/client/demo/)
                     
 
## Plotting Proper Motions from `vizier_propermotion.annot.xml`
       
The code snippet below shows how proper motions can be plot (see vizier_propermotion.annot.png)  by using the MANGO browser. 


```python
    votable_path = os.path.join(data_dir,
                                "vizier_propermotion.annot.xml"      
                               )
    mango_browser = MangoBrowser(votable_path) 
    
    # print out parameter map to inform user on the model mapping
    mango_parameters = mango_browser.get_parameters()
    DictUtils.print_pretty_json(mango_parameters)

    # Get all mapped data {head:[] data:[] selected_index:[]}
    proper_motions = mango_browser.get_data()

    ra_col = -1
    dec_col = -1
    pmra_col = -1
    pmdec_col = -1
    # Looking for columns having positions and pms
    # Column ranks are the mapped ones, not the native one
    # look at proper_motions to get more
    for cpt in range(len(proper_motions["head"])):
        head = proper_motions["head"][cpt]
        if head.startswith("field:coords:Point.axis1") is True :
            ra_col = cpt
        elif head.startswith("field:coords:Point.axis2") is True :
            dec_col = cpt
        elif head.startswith("field:meas:ProperMotion.lon") is True :
            pmra_col = cpt
        elif head.startswith("field:meas:ProperMotion.lat") is True :
            pmdec_col = cpt
       
    ra = []
    dec = []
    pm_ra = []
    pm_dec = []
    # Positional values are given in HMS, 
    # Let's use Astropy to convert them in degree.
    # And put data in column oriented arrays
    for data_row in proper_motions["data"]:
        c = SkyCoord((data_row[ra_col] + " " + data_row[dec_col]), frame='icrs', unit=(u.hourangle, u.deg))
        ra.append(c.ra.degree)
        dec.append(c.dec.degree)
        pm_ra.append(data_row[pmra_col])
        pm_dec.append(data_row[pmdec_col])

    fig = plt.figure(figsize=(8,6))
    plt.xlabel('ra (deg)')
    plt.ylabel('dec (deg)')
    plt.title("Proper Motion Demo [Positions and Proper Motions - North (Roeser+, 1988)]")
    plt.scatter(ra, dec) 
    plt.quiver(ra, dec, pm_ra, pm_dec, scale=0.5, color="red")
    plt.grid()
    plt.show()
```