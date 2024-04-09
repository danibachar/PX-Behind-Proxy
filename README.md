# PX-Behind-Proxy
This repo presents an example of PX fails initialization behind proxy in a Swift application


## Steps
1) Clone the repo
2) Install Proxyman
   1) Go to this [link](https://proxyman.io/download) and install the latest version (we tested with 5.1.1 on mac)
3) Open the xcode project `PXExampleAPp.xcodeproj` and let the px package to be resolved
4) Start Proxyman, make sure px domains are whitelisted
5) Run the app and withhold the start function fails

## Environment
We have tested this application with Proxyman on a MacOS Sonoma 14.4.1 (23E224) with xcode 15.3.
But we believe it will also be reproducible with xcode 15.2 and other mac versions

PX version 2.2.4
The issue does not exists on PX 3.1.3 and above version