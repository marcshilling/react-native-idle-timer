'use strict'

var { NativeModules } = require('react-native')

module.exports.setIdleTimerDisabled = (disabled, tag = "") => {
  NativeModules.IdleTimerManager.setIdleTimerDisabled(disabled, tag);
}
