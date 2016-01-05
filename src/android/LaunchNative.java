package edu.berkeley.eecs.emission.cordova.launchnative;

import org.apache.cordova.*;
import org.json.JSONArray;
import org.json.JSONException;

public class LaunchNative extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray data, CallbackContext callbackContext) throws JSONException {
        if (action.equals("launch")) {
            java.lang.Package pkg = cordova.getClass().getPackage();
            System.out.println("cordova has package name "+pkg);
            String activityName = data.getString(0);
            String fqcn = pkg.getName()+"."+activityName;
            System.out.println("FQCN = "+pkg.getName() + fqcn);
            try {
                Class fqClass = Class.forName(fqcn);
                Intent startIntent = new Intent(cordova.getActivity(), fqClass);
                cordova.getActivity().startActivity(startIntent);
                callbackContext.success("Launched activity " + activityName);
            } catch (ClassNotFoundException e) {
                callbackContext.error("Class "+fqcn+" not found, unable to launch");
            }
            return true;
        } else {
            return false;
        }
    }
}
