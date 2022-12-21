# Mango Based Proposal for the `Simple Position` Case

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
                     
 
## Overlaying positions
       
The code snippet below shows how that same code is able to process 3 different annotated VOTables

```Python
    # data presentation
    base_path = os.path.join("USECASE_LOCATION", "raw_data")
    votable_paths = [
        os.path.join(data_dir, "NGC5139_4xmm.annot.xml" ),
        os.path.join(data_dir, "NGC5139_gaiadr2.annot.xml"),
        os.path.join(data_dir, "ivoa_csc2_example.annot.xml" )
        ]
    layouts = {
        0: {"marker": "x", "color": "red","label": "4xmm","size": 40,"plot": None},
        1: {"marker": "o","color": "blue","label": "Gaia dr2","size": 1,"plot": None},
        2: {"marker": "x","color": "green","label": "Chandra","size": 40,"plot": None}
        }
    # matplotlib initial setup    
    fig = plt.figure(figsize=(8,6))
    plt.xlabel('ra (deg)')
    plt.ylabel('dec (deg)')
    plt.title("NCG5139 Demo")
    # The target is not written in the VOTable: set it up by hand for the purpose if this demo case.
    target = SkyCoord("13:26:45.89 -47:28:36.7", unit=(u.hour, u.deg))
    target_ra = target.ra.degree 
    target_dec = target.dec.degree 
    box_halfsize = 0.03
    # iterate over the 3 data sets
    plan = 0
    for votable_path in votable_paths:
        # get the MANGO properties list
        mango_browser = MangoBrowser(votable_path) 
        mango_parameters = mango_browser.get_parameters()
        # get the MANGO position property
        if "#1 pos.eq" in mango_parameters:
            mango_parameter = mango_parameters["#1 pos.eq"]
        if "#1 pos" in mango_parameters:
            mango_parameter = mango_parameters["#1 pos"]
        # get the space frame    
        mango_frame  = mango_parameter[mango_parameter["coosys_type"]]
        frame = mango_frame["coords:SpaceFrame.spaceRefFrame"]["@value"].lower()
        # Get the data mapped on the position property
        # we assume that positions are modeled as "mango:stcextend.LonLatSkyPosition" instances
        # Could be "coords:Point" Not implemented here
        position_data = mango_browser.get_data(measure_type="mango:stcextend.LonLatSkyPosition") 
        # Looking for columns having positions a
        # Column ranks are the mapped ones, not the native one
        ra_col = -1
        dec_col = -1
        for cpt in range(len(position_data["head"])):
            head = position_data["head"][cpt]
            if head.startswith("field:longitude") is True :
                ra_col = cpt
            elif head.startswith("field:latitude") is True :
                dec_col = cpt
        # Build the position data arrays expressed in the right frame (ICRS)
        ra = []
        dec = []
        # Positional values are assumed to be given in degree
        # Note that the native format (u.deg, u.deg) is not given by the mapping. should be read from the FIELD.
        # Let's use Astropy to convert positions to a common space frame (ICRS).
        for data_row in position_data["data"] :
            sky_coord = SkyCoord(data_row[ra_col], data_row[dec_col], frame=frame, unit=(u.deg, u.deg))
            sky_coord_icrs = sky_coord.icrs
            rap = sky_coord_icrs.ra.degree
            decp = sky_coord_icrs.dec.degree
            # discard data out of the box
            if( rap > (target_ra - box_halfsize) and rap < (target_ra + box_halfsize) 
                and decp > (target_dec - box_halfsize) and decp < (target_dec + box_halfsize)):
                ra.append(rap)
                dec.append(decp)
        # plot the sources
        layout = layouts[plan]
        layout["plot"] = plt.scatter(ra, dec, color=layout["color"], marker=layout["marker"], s=layout["size"])
        
    # some plot tuning         
    plt.legend(
        (layouts[0]["plot"], layouts[1]["plot"], layouts[2]["plot"]),
        (layouts[0]["label"], layouts[1]["label"], layouts[2]["label"]),
        scatterpoints=1, loc='lower left', ncol=3, fontsize=8)
    plt.gca().invert_xaxis()       
    plt.grid()
    plt.show()
    ```

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
                     
 
## Overlaying positions
       
The code snippet below shows how that same code is able to process 3 different annotated VOTables

```Python
    # data presentation
    base_path = os.path.join("USECASE_LOCATION", "raw_data")
    votable_paths = [
        os.path.join(data_dir, "NGC5139_4xmm.annot.xml" ),
        os.path.join(data_dir, "NGC5139_gaiadr2.annot.xml"),
        os.path.join(data_dir, "ivoa_csc2_example.annot.xml" )
        ]
    layouts = {
        0: {"marker": "x", "color": "red","label": "4xmm","size": 40,"plot": None},
        1: {"marker": "o","color": "blue","label": "Gaia dr2","size": 1,"plot": None},
        2: {"marker": "x","color": "green","label": "Chandra","size": 40,"plot": None}
        }
    # matplotlib initial setup    
    fig = plt.figure(figsize=(8,6))
    plt.xlabel('ra (deg)')
    plt.ylabel('dec (deg)')
    plt.title("NCG5139 Demo")
    # The target is not written in the VOTable: set it up by hand for the purpose if this demo case.
    target = SkyCoord("13:26:45.89 -47:28:36.7", unit=(u.hour, u.deg))
    target_ra = target.ra.degree 
    target_dec = target.dec.degree 
    box_halfsize = 0.03
    # iterate over the 3 data sets
    plan = 0
    for votable_path in votable_paths:
        # get the MANGO properties list
        mango_browser = MangoBrowser(votable_path) 
        mango_parameters = mango_browser.get_parameters()
        # get the MANGO position property
        if "#1 pos.eq" in mango_parameters:
            mango_parameter = mango_parameters["#1 pos.eq"]
        if "#1 pos" in mango_parameters:
            mango_parameter = mango_parameters["#1 pos"]
        # get the space frame    
        mango_frame  = mango_parameter[mango_parameter["coosys_type"]]
        frame = mango_frame["coords:SpaceFrame.spaceRefFrame"]["@value"].lower()
        # Get the data mapped on the position property
        # we assume that positions are modeled as "mango:stcextend.LonLatSkyPosition" instances
        position_data = mango_browser.get_data(measure_type="mango:stcextend.LonLatSkyPosition") 
        # Looking for columns having positions a
        # Column ranks are the mapped ones, not the native one
        ra_col = -1
        dec_col = -1
        for cpt in range(len(position_data["head"])):
            head = position_data["head"][cpt]
            if head.startswith("field:longitude") is True :
                ra_col = cpt
            elif head.startswith("field:latitude") is True :
                dec_col = cpt
        # Build the position data arrays expressed in the right frame (ICRS)
        ra = []
        dec = []
        # Positional values are assumed to be given in degree
        # Note that the native format (u.deg, u.deg) is not given by the mapping. should be read from the FIELD.
        # Let's use Astropy to convert positions to a common space frame (ICRS).
        for data_row in position_data["data"] :
            sky_coord = SkyCoord(data_row[ra_col], data_row[dec_col], frame=frame, unit=(u.deg, u.deg))
            sky_coord_icrs = sky_coord.icrs
            rap = sky_coord_icrs.ra.degree
            decp = sky_coord_icrs.dec.degree
            # discard data out of the box
            if( rap > (target_ra - box_halfsize) and rap < (target_ra + box_halfsize) 
                and decp > (target_dec - box_halfsize) and decp < (target_dec + box_halfsize)):
                ra.append(rap)
                dec.append(decp)
        # plot the sources
        layout = layouts[plan]
        layout["plot"] = plt.scatter(ra, dec, color=layout["color"], marker=layout["marker"], s=layout["size"])
        
    # some plot tuning         
    plt.legend(
        (layouts[0]["plot"], layouts[1]["plot"], layouts[2]["plot"]),
        (layouts[0]["label"], layouts[1]["label"], layouts[2]["label"]),
        scatterpoints=1, loc='lower left', ncol=3, fontsize=8)
    plt.gca().invert_xaxis()       
    plt.grid()
    plt.show()
    ```