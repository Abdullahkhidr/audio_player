package com.example.listen_to_me

import android.content.ContentResolver
import android.database.Cursor
import android.net.Uri
import android.provider.MediaStore
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.os.Bundle

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.listenToMe.app/native"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) { 
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getAudioFiles") {
                try {
                    val audioFiles = getAllAudioFiles(contentResolver)
                    result.success(audioFiles)
                }
                catch(e: Exception) {
                    result.error("Error getting audio files", e.message, e)
                }
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getAllAudioFiles(contentResolver: ContentResolver): List<String> {
        val audioList = mutableListOf<String>()

        val uri: Uri = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI
        val projection = arrayOf(
            MediaStore.Audio.Media.DATA,
            MediaStore.Audio.Media.DISPLAY_NAME
        )

        val selection = MediaStore.Audio.Media.IS_MUSIC + " != 0"
        val cursor: Cursor? = contentResolver.query(
            uri, projection, selection, null, null
        )

        cursor?.use {
            val dataColumn = it.getColumnIndexOrThrow(MediaStore.Audio.Media.DATA)

            while (it.moveToNext()) {
                val audioPath = it.getString(dataColumn)
                audioList.add(audioPath)
            }
        }

        return audioList
    }
}