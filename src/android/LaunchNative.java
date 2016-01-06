package edu.berkeley.eecs.emission.cordova.launchnative;

import org.apache.cordova.*;
import org.json.JSONArray;
import org.json.JSONException;
import android.content.Intent;

public class LaunchNative extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray data, CallbackContext callbackContext) throws JSONException {
        if (action.equals("launch")) {
            String pkgName = cordova.getActivity().getPackageName();
            System.out.println("cordova has package name "+pkgName);
            String activityName = data.getString(0);
            String fqcn = pkgName+"."+activityName;
            System.out.println("FQCN = "+ fqcn);
            try {
                Class fqClass = Class.forName(fqcn);
                Intent startIntent = new Intent(cordova.getActivity(), fqClass);
                cordova.getActivity().startActivity(startIntent);
                callbackContext.success("Launched activity " + activityName);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                callbackContext.error("Class "+fqcn+" not found, unable to launch");
            }
            return true;
        } else {
            return false;
        }
    }
}
