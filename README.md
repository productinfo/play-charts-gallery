ShinobiPlay: Charts Gallery (Objective-C)
=====================

An app which demonstrates the different chart types which can be created using ShinobiCharts.

![Screenshot](screenshot.png?raw=true)

Building the project
------------------

In order to build this project you'll need a copy of ShinobiCharts. If you don't have it yet, you can download a free trial from the [ShinobiControls website](http://www.shinobicontrols.com/ios/shinobisuite/price-plans/shinobicontrols-product-bundle/shinobicontrols-free-trial-form).

The project also uses a utility project as a git submodule, so after cloning it you'll need to initialize the submodules:

    $ git submodule update --init

Alternatively if you downloaded the project as a zip, you'll need to [download the utils project as a zip](https://bitbucket.org/shinobicontrols/shinobi-play-utils/get/bbc72dbdb493.zip) into the **ShinobiPlayUtils** directory.

If you've used the installer to install ShinobiCharts, the project should just work. If you haven't, then once you've downloaded and unzipped ShinobiCharts, open up the project in Xcode, and drag ShinobiCharts.framework from the finder into Xcode's 'frameworks' group, and Xcode will sort out all the header and linker paths for you.

If you're using the trial version you'll need to add your license key. To do so, open up **ChartsGalleryViewController.m** and add the following line inside `viewDidLoad`:

    [ShinobiCharts setLicenseKey:@"your license key"];

About the project
-----------------
Each chart has its own group with the specific files for that chart, but there are base classes for both the view controller and data source, which you'll need to take a look at if you want to recreate any of the example charts.

**`ChartsGalleryCommonViewController`** is the base for all the chart view controllers, contains some basic chart setup code that is applied to each chart, which sets its datasource and background color, makes the legend visible, and enables panning and zooming. It is a subclass of `SPUGalleryManagedChartViewController`.

**`SPUGalleryManagedChartViewController`** is a class which manages a ShinobiChart, tearing it down when the view is removed from the view hierarchy, and restoring it when it reappears. (We do this because of the large number of charts in this project; if you've only got one or two charts in your app you should be able to leave your chart in memory.)
 
The group **DataSources** contains several base classes for data sources:

 * **`ChartsGalleryCommonDataSource`** is the base for all of the charts with axes (line, area, bar, column, etc.). It extracts data from a plist into an array, and provides concrete implementations of most of the methods required by the `SChartDataSource` protocol, based on the data in the plist and on the values in its `seriesNames` property. It requires subclasses to provide the following implementations:

    * `-(id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex` should provide the x-value for the given series and data indices
    * `-(SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index` (from `SChartDataSource`)should create a series of the appropriate type fot the given chart.
    
 * **`ChartsGalleryCommonDateDataSource`** subclasses `ChartsGalleryCommonDataSource` and provides  `NSCalendar` and `NSDateComponents` objects for use by charts with a DateTime axis.
 * **`ChartsGalleryMultiYDataSource`** subclasses `ChartsGalleryCommonDateDataSource` for use by the financial series types (OHLC, candlestick, band), to cater for data points with multiple y-values. It requires subclasses to provide an implementation of `-(id)yValuesAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex`
 * **`ChartsGalleryProportionDataSource`** provides the data for the pie and donut charts. It requires the subclass to implement `-(SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index` (from `SChartDataSource`) to create a series of the appropriate type fot the given chart.

Creating your own chart
-----------------------
If you want to recreate any of the samples in your own app, the easiest way is probably to follow the [ShinobiCharts Quick Start Guide](http://www.shinobicontrols.com/ios/shinobicharts/quickstartguide/introduction) but with a few changes as detailed below. You'll need to copy some code from the view controller and data source associated with your chart type.

* In **Drawing a Simple Chart**, when creating the axes, instead of copying the lines from the guide, copy any lines containing `chart.xAxis` or `chart.yAxis` from the `setupChart` method in the relevant view controller.
* In **Adding A Data Source**:
	* Create a variable to hold your data, and initialise it in `viewDidLoad`. (If you want to use the data from our sample app, copy the relevant plist into your app and take a look at the `init` method of the relevant data source, and the `initWithDataFromFile` method from `ChartsGalleryCommonDataSource` to see how to load it into a variable.)
	* Modify `- (NSInteger)numberOfSeriesInSChart:(ShinobiChart *)chart` to return the correct number of series based on your data.
	* Copy `- (SChartSeries *)sChart:(ShinobiChart *)chart seriesAtIndex:(NSInteger)index` from the relevant data source rather than from the guide.
	* Modify `- (NSInteger)sChart:(ShinobiChart *)chart numberOfDataPointsForSeriesAtIndex:(int)seriesIndex` to return the correct number of data points based on your data.
	* Copy `- (id<SChartData>)sChart:(ShinobiChart *)chart dataPointAtIndex:(int)dataIndex forSeriesAtIndex:(int)seriesIndex` from the guide, but after creating the data point, set its x- and y-values based on your data. If you're using our data source, you can copy the code from `(id)xValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex` (in the relevant data source) and `- (id)yValueAtIndex:(NSInteger)dataIndex forSeriesAtIndex:(NSInteger)seriesIndex ` (in the base class) to get the relevant values.
	
That should give you the basics of the chart you want to create - have a dig around our code to see what else you can do with it!

Contributing
------------

We'd love to see your contributions to this project - please go ahead and fork it and send us a pull request when you're done! Or if you have a new project you think we should include here, email info@shinobicontrols.com to tell us about it.

License
-------

The [Apache License, Version 2.0](license.txt) applies to everything in this repository, and will apply to any user contributions.

