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

Contributing
------------

We'd love to see your contributions to this project - please go ahead and fork it and send us a pull request when you're done! Or if you have a new project you think we should include here, email info@shinobicontrols.com to tell us about it.

License
-------

The [Apache License, Version 2.0](license.txt) applies to everything in this repository, and will apply to any user contributions.

