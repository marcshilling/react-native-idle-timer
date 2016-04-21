# react-native-idle-timer
A cross-platform bridge that allows you to enable and disable the screen idle timer in your React Native app

## Install
`npm install react-native-idle-timer@latest --save`

#### iOS
1. In the XCode's "Project navigator", right click on your project's Libraries folder ➜ `Add Files to <...>`
2. Go to `node_modules` ➜ `react-native-idle-timer` ➜ `ios` ➜ select `RNIdleTimer.xcodeproj`
3. Add `libRNIdleTimer.a` to `Build Phases -> Link Binary With Libraries`


#### Android

1. in `android/settings.gradle`
   ```
   ...
   include ':react-native-idle-timer'
   project(':react-native-idle-timer').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-idle-timer/android')
   ```

2. in `android/app/build.gradle` add:
   ```
   dependencies {
       ...
       compile project(':react-native-idle-timer')
   }
   ```

3. and finally, in `android/src/main/java/com/{YOUR_APP_NAME}/MainActivity.java` add:
   ```java
   //...
   import com.marcshilling.idletimer.IdleTimerPackage;; // <--- This!
   
   //...
   @Override
   protected List<ReactPackage> getPackages() {
     return Arrays.<ReactPackage>asList(
       new MainReactPackage(),
       new IdleTimerPackage() // <---- and This!
     );
}
   ```

## Usage
1. In your React Native javascript code, bring in the native module:

  ```javascript
var IdleTimerManager = require('NativeModules').IdleTimerManager;
  ```
2. To disable the idle timer on a specific view component:
  
  ```javascript
  componentWillMount() {
    IdleTimerManager.setIdleTimerDisabled(true);
  }
  
  componentWillUnmount() {
    IdleTimerManager.setIdleTimerDisabled(false);
  }
  ```
