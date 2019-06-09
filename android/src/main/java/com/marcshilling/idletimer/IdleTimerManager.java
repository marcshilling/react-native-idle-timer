package com.marcshilling.idletimer;

import android.app.Activity;
import android.view.WindowManager;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.module.annotations.ReactModule;

@ReactModule(name = IdleTimerManager.MODULE_NAME)
public class IdleTimerManager extends ReactContextBaseJavaModule
{
    static final String MODULE_NAME = "IdleTimerManager";

    public IdleTimerManager(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return this.MODULE_NAME;
    }

    @ReactMethod
    public void setIdleTimerDisabled(final boolean disabled) {

        final Activity activity = this.getCurrentActivity();
        if (activity != null) {
            activity.runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    if (disabled) {
                        activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
                    } else {
                        activity.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
                    }
                }
            });
        }


    }
}
