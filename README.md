# react-native-idle-timer
An Objective-C bridge that allows you to enable and disable the screen idle timer in your React Native app

## Install
1. `npm install react-native-idle-timer@latest --save`
2. In the XCode's "Project navigator", right click on your project's Libraries folder ➜ `Add Files to <...>`
3. Go to `node_modules` ➜ `react-native-idle-timer` ➜ select the `IdleTimerManager` folder
4. Make sure `IdleTimerManager.m` is listed under 'Compile Sources' in your project's 'Build Phases' tab

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
