Technologies:

 - Ruby
 - Cucumber
 - Appium

Requirements:

 - Mac ou Windows (Android)
    - with an environment variable $ANDROID_HOME configured in your SDK android
 - Java 1.8 >=
 - Android SDK
 - Adb
 - Ruby 2.23 >=
    - with bundler gem (gem install bundler)
 - Appium (http://appium.io/)
 - Android Device 4.1 >=

Execution:

 - Connect your previously configured Android to Appium
 - Raise your Appium application
 - Go to the mobile folder `${your_path}/mobile`
 - Dependencies install command: `bundle install`
 - Run tests command `cucumber @client`