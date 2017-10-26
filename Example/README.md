# Using Example skeleton Consent Access iOS application

## Requirements
You have to be a registered Apple Developer to be able to run this demo project on your iOS device.

## Installation

Open 'Example' folder and navigate to 'DigiMeFramework.xcworkspace' file.
Open macOS Terminall app and change your current location to:

```bash
/.../digime-ios-sdk/Example
```
and run the following command:

```bash
$ pod install
```
[Ask digi.me support](http://devsupport.digi.me/) for the new contract ids and add them to the project by editing this file:

```
/.../digime-ios-sdk/Example/DigiMeFramework/Constants.swift
```
Replace `your_real_contract_id` with the real contract ids:
```swift
static let kContractId = "your_real_contract_id"
```
Replace the default app name `your_real_app_id` with one of your choosing (32 characters hex string):

```swift
static let kAppId = "your_real_app_id"
```
Replace the default `your_real_app_id` with your chosen app name in the application Info.plist file:

```bash
/.../digime-ios-sdk/Example/DigiMeFramework/Info.plist
```
Info.plist part to be amended:

```plist
<key>CFBundleURLTypes</key>
<array>
<dict>
<key>CFBundleTypeRole</key>
<string>Editor</string>
<key>CFBundleURLName</key>
<string>Consent Access</string>
<key>CFBundleURLSchemes</key>
<array>
<string>digime-ca-your_real_app_id</string>
</array>
</dict>
</array>
```
[Ask digi.me support](http://devsupport.digi.me/) for the sample private key in p12 format and add it to the the project.
check if p12 file is available under 'Targets' > 'Build Phases' > 'Copy Bundle Resources'

```bash
/.../digime-ios-sdk/Example/DigiMeFramework/CA_RSA_PRIVATE_KEY.p12
```

Open project in XCode, build and run on your iOS device.
(NB! Default settings allow you to build and run on XCode Simulator. To run this demo project on your ios device you may need to have a developer account registered on Apple Developer portal.)

Press 'Start' button to run the app.

![screen shot 1](https://raw.githubusercontent.com/digime/digime-ios-sdk/master/Example/ScreenShot1.png)

If the digi.me app was installed and onborded then it will be opened by Example app.
The contract view will appear. You can preview your data that will be shared using Consent Access.
Press 'Authorise' to allow Consent Access to gather and forward your data.

![screen shot 2](https://raw.githubusercontent.com/digime/digime-ios-sdk/master/Example/ScreenShot2.png)

Example app will return to foreground.
Shortly you should be able to preview your data in JSON file format.

![screen shot 3](https://raw.githubusercontent.com/digime/digime-ios-sdk/master/Example/ScreenShot3.png)


##
Copyright © 2017 digi.me Ltd. All rights reserved.



