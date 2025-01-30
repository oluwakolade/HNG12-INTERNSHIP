package com.example.mobile_app

import io.flutter.embedding.android.FlutterActivity
import android.content.Intent
import android.net.Uri
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "url_launcher"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "openUrl" -> {
                    val url = call.argument<String>("url")
                    if (url != null) {
                        openUrl(url)
                        result.success(null)
                    } else {
                        result.error("INVALID_URL", "URL is null", null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun openUrl(url: String) {
        val intent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
        startActivity(intent)
    }
}
