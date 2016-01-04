package com.example.plugin;

import org.apache.cordova.*;
import org.json.JSONArray;
import org.json.JSONException;

public class Hello extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray data, CallbackContext callbackContext) throws JSONException {

        if (action.equals("launch")) {
            String activityName = data.getString(0);
            callbackContext.success("Launched activity "+activityName);
            return true;
        } else {
            return false;
        }
    }
}
