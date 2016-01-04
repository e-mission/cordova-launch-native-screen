/*global cordova, module*/

var exec = require("cordova/exec")

var LaunchNative = {
    launch: function (screenName, successCallback, errorCallback) {
        exec(successCallback, errorCallback, "LaunchNative", "launch", [screenName]);
    }
}

module.exports = LaunchNative;
