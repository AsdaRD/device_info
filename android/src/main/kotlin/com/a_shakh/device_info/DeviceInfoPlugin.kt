package com.a_shakh.device_info

import android.content.Context
import androidx.core.content.ContextCompat
import android.app.Activity
import android.app.ActivityManager
import android.app.ActivityManager.MemoryInfo
import androidx.core.app.ActivityCompat
import kotlin.math.roundToInt

import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.util.ViewUtils.getActivity




import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** DeviceInfoPlugin */
class DeviceInfoPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  private  var context: Context? = null
    private var baseContext: Context? = null
    private var appContext: Context? = null
    private lateinit var mactivity: Activity

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
      mactivity = binding.activity
      baseContext = mactivity.baseContext
      appContext = mactivity.applicationContext

  }

  override fun onDetachedFromActivityForConfigChanges() {

  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
      mactivity = binding.activity
      baseContext = mactivity.baseContext
      appContext = mactivity.applicationContext
  }

  override fun onDetachedFromActivity() {

  }

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "a.shakh/device_info")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    val ram = getRamInfo()
    if (call.method == "getDeviceName") {
      result.success(android.os.Build.DEVICE)
    } else if (call.method == "getModel") {
      result.success(android.os.Build.MODEL)
    } else if (call.method == "getOS") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else if (call.method == "getApi") {
      result.success(android.os.Build.VERSION.SDK)
    } else if (call.method == "getRam") {
      result.success(ram)
    } else if (call.method == "getScreenResolution") {
      result.success("${context?.resources?.displayMetrics?.heightPixels} x${context?.resources?.displayMetrics?.widthPixels}")
    } else if (call.method == "getDeviceInfo") {
      result.success("Device: ${android.os.Build.DEVICE}, Model: ${android.os.Build.MODEL}, OS: Android ${android.os.Build.VERSION.RELEASE}, API: ${android.os.Build.VERSION.SDK}, Ram: ${ram}Gb, Screen resolution: ${context?.resources?.displayMetrics?.heightPixels} x${context?.resources?.displayMetrics?.widthPixels}")
    }
    else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    context=null
    baseContext = null
    appContext = null
  }

  private fun getRamInfo(): Int {
    val actManager = context?.getSystemService(Context.ACTIVITY_SERVICE) as ActivityManager
    
    val memInfo = MemoryInfo()
    actManager.getMemoryInfo(memInfo)
    val totalMemory = memInfo.totalMem.toDouble()

    val res = totalMemory / 1073741824.0
    return res.roundToInt()
  }
}
