
**Two TimeSeries serializations**

  * The File TimeSeriesGAVO-Gaia-RP-annot.xml contains onte table with a Light curve from Gaia DR2 as provided by GAVO. It's a simple RP filter monoband Light curve

  * The serialization is using ModelInstanceIntoVOT.

  * Of course we need a datamodel to annotate that. These TimeSeries are time dependant measurements for identified sources.

  * So Mango is adapted as a general frame.
      * Look at the Mango diagram in this directory (figure 1)
      * The source is a "mango object" (yellow)
      * We could attach non variable parameters directly to the Mango Object (blue classes on the right) but we don't do it here
      * We go to dataDock (green classes for associated data) instead 
      * So we associate TimeSeries data as an instance of a "TimeSeriesData small DataModel"
         (It is ONLY a TimeSeriesData datamodel at this stage, but we could transform it in a full TimeSeries model by adding a reference to DataSetMetadata there )
   
  * How is this small DataModel built ?
     * The trick is that it is reusing the Mango model itself !!!
     * Look at figure 2.
     * TimeSeriesData is the "top" class.
     * It is a composition of "Point" instances
     * The "Point" class is derived from mango:Parameter 
        * A Point is a Time Parameter with at least 1 associatedParameter !
   * Here in this Light curve  we have the Time Parameter and two Photometry dependant Parameters, flux and magnitude. Only flux comes with an error
   * So the model instance is basically a tree like this :
   
```   
   mangoObject
      identifier
      modelInstance
         TimeSeriesData
            Point
               meas:Time
                 coords:JD
                     coords:JD.date
                     coords:timesys reference
                 associatedParameter
                     meas:Flux              
                         coords:FluxAxis (borrowzed from spectrum data model)
                             coords:FluxAxis.value
                             coords:Photometry Coord System (refernec to Photcal instance from PhotDM  
                         meas:Error
                              meas:Symetrical
                 associatedParameter
                     meas:magnitude              
                         coords:FluxAxis (borrowed from spectrum data model)
                             coords:FluxAxis.value
                             coords:Photometry Coord System (reference to Photcal instance from PhotDM)     

```


   * In the VOTABLE file we added an annotation consistent with ModelInstanceIntoVOT. there are a lot of comments inside
   
   * The file TimeSeriesMangoZTF.annot.xml  contains a table with a zg band light curve obtained by the Zwicky Transient facility.
   * In this table each detection at a given time comes with a lot of details completing the observed magnitude.
   * The calibration details, reduction features, varying position of the detection, instrumental details are given
   * They are all considered as TimeDependant  parameters
   * So the structure of the instance is very similar to the previous one except than instead of having two associatedParameters (to the time) we have plenty of those now. 
   * We have defined CoordinateSystems. TimeSys (and HelioTimeSys) are classical coords datamodel instances. PhotSys (actually PhotFrame inside it) encompass an instance of PhotDM "Photcal". 
   * we have added two yml files which implement excerpt of our two xml examples in yaml : TimeSeriesGAVO-Gaia-RP-annot.xml  and TimeSeriesMangoZTF.yml
   
**New version in May 2021**
   * The 4 files TimeSeriesMangoZTF.new.yml, TimeSeriesMangoGAIADR2.new.yml,  TimeSeriesMangoZTF.new.xml and TimeSeriesGAVO-Gaia-RP.new.xml :
   * - implement a new version of PhotCal based on PhotDM 1.1
   * - add "direct" Parameters to the mangoObject describing the source both for ZTF and Gaia
   * - make use of extension of Measures and Coordinates defined inside mango instead of GenericMeasure 



