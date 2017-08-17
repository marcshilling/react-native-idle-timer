'use strict'

var { NativeModules, Platform } = require('react-native')
var Package = require('react-native-package');

module.exports = Package.create({
  json: require('./package.json'),
  nativeModule: NativeModules.IdleTimerManager,
  enabled: Platform.select({
    android: true,
    ios: true,
  }),
  export: function(IdleTimer) {
    return {
      setIdleTimerDisabled: function(isDisabled) {
        IdleTimer.setIdleTimerDisabled(isDisabled);
      },
    };
  },
});
