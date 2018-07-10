# Overview

Create an iOS app that lists bank locations in Estonia, Latvia and Lithuania. This includes:
<ul>
<li>A list of all location regions with countries as section headers (in alphabetical order).</li>
<li>A list of all locations in the selected region (in alphabetical order).</li>
<li>Details of the selected location.</li>
</ul>

# Implementation

The app should download and parse 3 files with bank locations in JSON format:
<ul>
<li>Estonia: https://www.swedbank.ee/finder.json</li>
<li>Latvia: https://ib.swedbank.lv/finder.json</li> 
<li>Lithuania: https://ib.swedbank.lt/finder.json</li>
</ul>

The app should save the files or the data in a local storage.<br/>
The app should allow refreshing on the list of all location regions.<br/>
The app should redownload the files at launch and on refresh once in 1 hour (otherwise it should reuse the stored data).<br/>

To download the files the app should set the following cookie:
<ul>
<li>Name: “Swedbank-Embedded”</li>
<li>Value: “iphone-app”</li>
</ul>

The bank locations in the files are described with the following keys:
<ul>
<li>“lat”: latitude</li>
<li>“lon”: longitude</li>
<li>“n”: name</li>
<li>“a”: address </li>
<li>“t”: type</li>
<li>“r”: region</li>
<li>“av”: availability (optional)</li>
<li>“i”: info (applicable only for branches)</li>
<li>“ncash”: no cash (applicable only for branches)</li>
<li>“cs”: has a coin station (applicable only for branches)</li>
</ul>

The possible type values are:
<ul>
<li>0: Branch</li>
<li>1: ATM (Automated Teller Machine)</li> 
<li>2: BNA (Bunch Note Acceptor)</li>
</ul>
  
# Requirements
<ul>
<li>Use the latest version of Swift and Xcode.</il>
<li>Follow the Swift API design guidelines (https://swift.org/documentation/api-design-guidelines/).</li> 
<li>Support the latest major iOS version (including all minor versions).</li>
<li>Support all iOS devices and trait variations (size classes).</li>
<li>Do not use any third-party frameworks or libraries.</li>
<li>Write production-ready code (clean, modular, testable).</li>
</ul>
