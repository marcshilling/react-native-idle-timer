# react-native-idle-timer

A cross-platform bridge that allows you to enable and disable the screen idle timer in your React Native app

## Install

`yarn add react-native-idle-timer`

## Link

#### Automatically

`react-native link react-native-idle-timer`

#### Manually

##### iOS
1. In the XCode's "Project navigator", right click on your project's Libraries folder ➜ `Add Files to <...>`
2. Go to `node_modules` ➜ `react-native-idle-timer` ➜ `ios` ➜ select `RNIdleTimer.xcodeproj`
3. Add `libRNIdleTimer.a` to `Build Phases -> Link Binary With Libraries`

##### Android

1. in `android/settings.gradle`

```gradle
...
include ':react-native-idle-timer'
project(':react-native-idle-timer').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-idle-timer/android')
```

2. in `android/app/build.gradle` add:

```gradle
dependencies {
  ...
  compile project(':react-native-idle-timer')
}
```

3. and finally, in `android/src/main/java/com/{YOUR_APP_NAME}/MainActivity.java` add:

```java
//...
import com.marcshilling.idletimer.IdleTimerPackage; // <--- This!

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

### In your React Native javascript code, bring in the native module:

```javascript
import IdleTimerManager from 'react-native-idle-timer';
```
<br/>

### To disable the idle timer while a certain component is mounted:

Class component
```javascript
componentWillMount() {
  IdleTimerManager.setIdleTimerDisabled(true);
}

componentWillUnmount() {
  IdleTimerManager.setIdleTimerDisabled(false);
}
```


Function component

```javascript
useEffect(() => {
  IdleTimerManager.setIdleTimerDisabled(true);

  return () => IdleTimerManager.setIdleTimerDisabled(false);
}, [])
```
<br/>

### If you have multiple components that are responsible for interacting with the idle timer, you can pass a tag as the second parameter:

```javascript
useEffect(() => {
  IdleTimerManager.setIdleTimerDisabled(true, "video");

  return () => IdleTimerManager.setIdleTimerDisabled(false, "video");
}, [])
```
<br/>

### If you need to interact from the native Android or iOS side:

Android
```java
IdleTimerManager.activate(activity, "video");
IdleTimerManager.deactivate(activity, "video");
```

iOS
```objectivec
[IdleTimerManager activate:@"video"];
[IdleTimerManager deactivate:@"video"];
```
