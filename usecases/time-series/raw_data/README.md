# Time Series Data Sample

## Simple case: `ts.vot` 

Simple time series (time vs mag + flux) proposed by Markus.

## Complex case: `gaia_multiband.xml`

- Gaia time series (ESAC) containing 3 light curves (G BR, RP) merged in one table. 
- The challenge is to restore all individual light curves.
- This dataset has been initially used by the TDIG as a use-case related to the CSP [roadmap](https://wiki.ivoa.net/twiki/bin/view/IVOA/CSPTimeSeries)

## Complex case: `TimeSeriesZTF.xml`

- ZTF time series where measurements related to both sources on the field of view are mixed together in one table 
- See [doc](https://irsa.ipac.caltech.edu/docs/program_interface/ztf_lightcurve_api.html)