# react-native-idle-timer

A cross-platform bridge that allows you to enable and disable the screen idle timer in your React Native app

## Install

`npm install react-native-idle-timer@latest --save`

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

1. In your React Native javascript code, bring in the native module:

```javascript
import IdleTimerManager from 'react-native-idle-timer';
```

1. To disable the idle timer on a specific view component:

```javascript
componentWillMount() {
  IdleTimerManager.setIdleTimerDisabled(true);
}

componentWillUnmount() {
  IdleTimerManager.setIdleTimerDisabled(false);
}
```

1. Sometimes you want to disable the idle timer in multiple places, for example, both parent and child component disable and enable the idle timer on mount and unmoumt respectively. When the child component unmount, you expect the idle timer should still disable. The fact is the idle timer get enabled. Because of that, you need to scope it.

```javascript
IdleTimerManager.setIdleTimerDisabled(true, "<any name you want>");

IdleTimerManager.setIdleTimerDisabled(false, "<any name you want>");
```

1. If you have multiple places set the idle time on native side, you will have the previous issue. Because of that, this library provide a centralized way to enable and able the idle timer

```java
IdleTimerManager.activate(activity, "<any name you want>");

IdleTimerManager.deactivate(activity, "<any name you want>");
```

```objc
[IdleTimerManager activate:@"<any name you want>"];

[IdleTimerManager deactivate:@"<any name you want>"];
```