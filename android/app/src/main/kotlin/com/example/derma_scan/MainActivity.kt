package com.example.derma_scan

import android.content.Context
import android.hardware.camera2.CameraCharacteristics
import android.hardware.camera2.CameraManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "camera_utils"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "getFocalLength" -> {
                    val focalLength = getFocalLength()
                    if (focalLength != null) {
                        result.success(focalLength)
                    } else {
                        result.error("UNAVAILABLE", "Focal length not available.", null)
                    }
                }
                "getSensorWidth" -> {
                    val sensorWidth = getSensorWidth()
                    if (sensorWidth != null) {
                        result.success(sensorWidth)
                    } else {
                        result.error("UNAVAILABLE", "Sensor width not available.", null)
                    }
                }
                else -> result.notImplemented()
            }
        }
    }

    private fun getFocalLength(): Float? {
        val cameraManager = getSystemService(Context.CAMERA_SERVICE) as CameraManager
        val cameraId = cameraManager.cameraIdList[0] // Typically use the first camera (main back camera)
        val characteristics = cameraManager.getCameraCharacteristics(cameraId)
        return characteristics.get(CameraCharacteristics.LENS_INFO_AVAILABLE_FOCAL_LENGTHS)?.get(0)
    }

    private fun getSensorWidth(): Float? {
        val cameraManager = getSystemService(Context.CAMERA_SERVICE) as CameraManager
        val cameraId = cameraManager.cameraIdList[0] // Typically use the first camera (main back camera)
        val characteristics = cameraManager.getCameraCharacteristics(cameraId)
        val sensorSize = characteristics.get(CameraCharacteristics.SENSOR_INFO_PHYSICAL_SIZE)
        return sensorSize?.width // Width of the sensor in mm
    }
}
