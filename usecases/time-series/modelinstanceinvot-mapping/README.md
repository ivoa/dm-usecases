## `cube_ts.xml` serialization


This proposal is derived from the MCD's [proposal](../mcd-implementation). 

It maps the same data on the same model (Cube) but by using another syntax, namely `ModelInstanceInVot`

### Resources

* The **ModelInstanceInVot** [repository](https://github.com/ivoa-std/ModelInstanceInVot) provides rationale, syntax rules, XSD schema and large data samples.

* The [modelinstanceinvot-code](https://github.com/ivoa/modelinstanceinvot-code/) repository contains many Python tools operating different aspects of the data mapping.

### Test tools

The current proposal can be processed by [cube_ts.py](https://github.com/ivoa/modelinstanceinvot-code/modelinstanceinvot-code/python/client/demo/cube_ts.py)

* In the frame of `ModelInstanceInVot` we are considering that providing JSON serializations of model instances is a good validation scheme as long as the code generating those JSONs has no dependence with any particular model or data set.

* Such JSONs can be very easily processed with most of the languages (Py, JS, Java, Rust). Therefore it becomes easy for different softwares to share model instances. 

* The code snippets below show how to generate and process JSON serializations:
  * Building the JSON Serialization

```python
votable_path = os.path.join(data_dir,
                                "annotated_data",
                                "cube_ts.annot.xml"
                                )
vodml_instance = VodmlInstance(votable_path)
vodml_instance.populate_templates()
vodml_instance.connect_join_iterators()

instance = vodml_instance.get_root_element("cube:SparseCube")
```

  * Retrieving the GLOBALS Types

```python
coord_systems = instance_browser.get_globals_types()
print(coord_systems)

['mango:stcextends.PhotometryCoordSys', 'coords:TimeSys', 'coords:SpaceSys']
```

  * Getting the time coordinate system

```
print(DictUtils.get_pretty_json(instance_browser.get_globals_by_type("coords:TimeSys")))

{
  "@ID": "TimeSys_BARYCENTER",
  "@dmtype": "coords:TimeSys",
  "coords:PhysicalCoordSys.frame": {
    "@dmtype": "coords:TimeFrame",
    "coords:TimeFrame.refPosition": {
      "@dmtype": "coords:StdRefLocation",
      "coords:StdRefLocation.position": {
        "@dmtype": "ivoa:string",
        "@value": "BARYCENTER"
      }
    },
    "coords:TimeFrame.timescale": {
      "@dmtype": "ivoa:string",
      "@value": "TCB"
    }
  }
}
```

  * Getting the roles of the root object child

```python
root_component_roles = instance_browser.get_root_component_roles()
print(root_component_roles)

['cube:SparseCube.data', 'cube:SparseCube.dataset']
```

  * Getting the dataset instance

```python
print(DictUtils.get_pretty_json(instance_browser.get_root_component_by_role('cube:SparseCube.dataset')))

{
  "@dmtype": "ds:experiment.ObsDataset",
  "ds:dataset.Dataset.curation": {
    "@dmtype": "ds:dataset.Curation",
    "ds:dataset.Curation.publisher": {
      "@dmtype": "ds:dataset.Publisher",
      "ds:dataset.Publisher.publisherID": {
        "@dmtype": "ivoa:anyURI",
        "@value": "ivo://org.gavo.dc"
      },
      "ds:party.Role.party": {
        "@dmtype": "ds:party.Organization",
        "ds:party.Party.name": {
          "@dmtype": "ivoa:string",
          "@value": "GAVO Data Center"
        }
      }
    }
  },
  "ds:dataset.Dataset.dataID": {
    "@dmtype": "ds:dataset.DataID",
    "ds:dataset.DataID.title": {
      "@dmtype": "ivoa:string",
      "@ref": "ndupgttbwtit",
      "@value": "Gaia DR2 G photometry time series for star 1866721434011386240"
    }
  },
  "ds:dataset.Dataset.dataProductSubtype": {
    "@dmtype": "ivoa:string",
    "@value": "lightcurve"
  },
  "ds:dataset.Dataset.dataProductType": {
    "@dmtype": "ds:dataset.DataProductType",
    "@value": "TIMESERIES"
  },
  "ds:experiment.ObsDataset.calibLevel": {
    "@dmtype": "ivoa:integer",
    "@value": "1"
  },
  "ds:experiment.ObsDataset.target": {
    "@dmtype": "ds:experiment.Target",
    "ds:experiment.BaseTarget.name": {
      "@dmtype": "ivoa:string",
      "@value": "1866721434011386240"
    },
    "meas:Position.coord": {
      "@dmtype": "meas:Position",
      "ds:experiment.Target.position": {
        "@dmtype": "coords:Point",
        "coords:Coordinate.coordSys": {
          "@dmref": "SpaceSys_ICRS"
        },
        "coords:Point.axis1": {
          "@dmtype": "ivoa:RealQuantity",
          "@ref": "ndupgttbwuga",
          "@value": 315.018457397759
        },
        "coords:Point.axis2": {
          "@dmtype": "ivoa:RealQuantity",
          "@ref": "ndupgttbwltt",
          "@value": 35.3014389949649
        }
      }
    }
  }
}
```

  * Getting the column mapping. The syntax used for describing individual columns is not par of any standard. It is due the client implementation.

```python
print(instance.get_flatten_data_head())

['meas:Time.coord(coords:JD.date) [col#0 obs_time]', 'meas:GenericMeasure.coord(coords:PhysicalCoordinate.cval) [col#1 phot]', 'meas:GenericMeasure.coord(coords:PhysicalCoordinate.cval) [col#2 flux]', 'meas:Error.statError(meas:Symmetrical.radius) [col#3 flux_error]']
```

  * Getting the mapped table data row per row. The elements of the data arrays returned by the iterator match the above column mapping on the base of their positions.

```python
 while True:
    inst = instance._get_next_flatten_row()
    if inst != None:
        print(DictUtils.get_pretty_json(inst))
    else:
        break
[
  2456964.614751482,
  13.1433285545337,
  104238.6015625,
  784.7562866210938
]
[
  2456964.688753904,
  13.145307101711005,
  104048.8203125,
  203.0587615966797
]
...
...
[
  2457507.3690639553,
  13.019767042062135,
  116802.78125,
  137.4085693359375
]
[
  2457507.443075384,
  13.014477387452114,
  117373.2265625,
  457.4692077636719
]
```