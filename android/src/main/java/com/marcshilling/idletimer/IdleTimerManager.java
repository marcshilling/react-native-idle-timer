package com.marcshilling.idletimer;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import java.util.HashSet;

import android.app.Activity;
import android.view.WindowManager;

import org.jetbrains.annotations.NotNull;

public class IdleTimerManager extends ReactContextBaseJavaModule
{
    static final String MODULE_NAME = "IdleTimerManager";

    static final HashSet<String> tags = new HashSet();

    public IdleTimerManager(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return this.MODULE_NAME;
    }

    @ReactMethod
    public void setIdleTimerDisabled(final boolean disabled, final String tag) {
        final Activity activity = this.getCurrentActivity();
        if (disabled) {
            activate(activity, tag);
        } else {
            deactivate(activity, tag);
        }
    }

    public static void activate(@NotNull final Activity activity, final String tag) {
        if (tags.isEmpty()) {
            activity.runOnUiThread(() -> {
                activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
            });
        }
        tags.add((tag == null ? "" : tag));
    }

    public static void deactivate(@NotNull final Activity activity, final String tag) {
        if (tags.size() == 1 && tags.contains((tag))) {
            activity.runOnUiThread(() -> {
                activity.getWindow().clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
            });
        }
        tags.remove((tag == null ? "" : tag));
    }
}
