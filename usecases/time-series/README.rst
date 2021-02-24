Time Series
===========

This is about annotating time series (or similar 1D-data like spectra).
Use cases include:

* identifying the whole thing as a time series (or spectrum) in order to
  activate special configurations for different data types in clients
* identifying the independent axis/axes (in this case, time) for
  plotting
* identifying the dependent axes so users can choose what to plot
* associating values and errors
* figuring out the position of the observation (or the target object) so
  a client can, for instance, mark the location or transmit it through
  SAMP.

The annotation in md-proposal has been produced for several million time
series (cf. ivo://org.gavo.dc/bgds/l/ssa,
ivo://org.gavo.dc/k2c9vst/q/ssa,
ivo://org.gavo.dc/gaia/q2/ssa, where you'll find a lot more of those).

The central idea is to not hide the fact that we're annotating colums
and params: The different annotations (for "ndcube"
(dependent/independent axes), "stc" (where do we look?) etc talk about
the VOTable items as much as possible.

The workflow intended is that clients determine all the annotations for
the various items (tables probably should be annotatable, too) and then
pick the annotations they understand.  This facilitates a smooth
evolution – and, I claim, matches well the typical use case of
applications that almost never will use our data models internally but
instead will just want to map parts of what we do to their internal
representations.


