
Android WifiRttScan Sample
===================================

Sample demonstrates best practices for using WifiRTT APIs in Android. Also, this is a a useful
application for testing Wifi-RTT enabled phones and access points and validating the estimated
distance is close to the actual distance between them.

Introduction
------------

Steps for trying out the sample:
* Compile and install the mobile app onto your mobile device (for mobile scenario).

This sample demonstrates best practices for using the WifiRtt APIs in Android. The main activity
lists all access points that are WifiRtt enabled using the [WifiManager][1]. By clicking on one of
the access points, another activity will launch and initiate [RangingRequest][2] via the
[WifiRttManager][3]. The activity will display many of the details returned from the access point
including the distance between the access point and the phone.

[1]: https://developer.android.com/reference/android/net/wifi/WifiManager
[2]: https://developer.android.com/reference/android/net/wifi/rtt/RangingRequest
[3]: https://developer.android.com/reference/android/net/wifi/rtt/WifiRttManager

Pre-requisites
--------------

- Android SDK 28
- Android Build Tools v27.0.3
- Android Support Repository

Screenshots
-------------

<img src="screenshots/main1.png" height="400" alt="Screenshot"/> <img src="screenshots/main2.png" height="400" alt="Screenshot"/> <img src="screenshots/main3.png" height="400" alt="Screenshot"/> 

Getting Started
---------------

This sample uses the Gradle build system. To build this project, use the
"gradlew build" command or use "Import Project" in Android Studio.

Support
-------

- Google+ Community: https://plus.google.com/communities/105153134372062985968
- Stack Overflow: http://stackoverflow.com/questions/tagged/android

If you've found an error in this sample, please file an issue:
https://github.com/googlesamples/android-WifiRttScan

Patches are encouraged, and may be submitted by forking this project and
submitting a pull request through GitHub. Please see CONTRIBUTING.md for more details.

License
-------

Copyright 2017 The Android Open Source Project, Inc.

Licensed to the Apache Software Foundation (ASF) under one or more contributor
license agreements.  See the NOTICE file distributed with this work for
additional information regarding copyright ownership.  The ASF licenses this
file to you under the Apache License, Version 2.0 (the "License"); you may not
use this file except in compliance with the License.  You may obtain a copy of
the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
License for the specific language governing permissions and limitations under
the License.
