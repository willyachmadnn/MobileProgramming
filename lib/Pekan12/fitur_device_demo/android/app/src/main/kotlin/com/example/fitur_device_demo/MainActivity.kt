package com.example.fitur_device_demo

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.os.Build

class MainActivity: FlutterActivity() {
    // Pastikan CHANNEL ini sama persis dengan yang ada di kode Dart Anda
    private val CHANNEL = "com.yourapp/device_info"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "getOsVersion") {
                val osVersion = "Android " + Build.VERSION.RELEASE
                result.success(osVersion)
            } else {
                result.notImplemented()
            }
        }
    }
}