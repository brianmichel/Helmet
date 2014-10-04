Helmet
=====

Hate how you can edit system header files for no reason other then to make your life terrible? 

Me too...

This seems like a regression in Xcode, as I used to remember Apple locking these files and making the input view non-editable. I've filed a radar for this (which got marked as a dupe) but please feel free to dupe it [here](http://openradar.appspot.com/radar?id=6381406439604224).

This is pretty crude for right now as I'd like to provide some indication that a file is locked, but it seems to work well enough.

Installation
----

Eventually this will be on Alcatraz, but until then…

* Run the project yourself, this will install the plugin.

*OR*

* Download the latest release from [here](https://github.com/brianmichel/Helmet/releases) and move the .xcplugin file to `~/Application Support/Developer/Shared/Xcode/Plugin-ins`

After installation, restart xcode to load the plugin. Helmet can be removed simply by deleting `Helmet.xcplugin` from `~/Application Support/Developer/Shared/Xcode/Plugin-ins` and restart Xcode.

Issues
----

Feel free to contact me on Twitter [@brianmichel](https://www.twitter.com/brianmichel) if you have any questions/feedback/concerns. This is my first Xcode plugin, so I'm all ears. 

Thanks to [@bcapps](https://www.twitter.com/bcapps) for feeling my pain enough to force me to build this, and thanks to [@irace](https://www.twitter.com/irace) for the name!
