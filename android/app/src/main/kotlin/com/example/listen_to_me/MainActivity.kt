package com.example.listen_to_me

import android.content.ContentResolver
import android.database.Cursor
import android.net.Uri
import android.provider.MediaStore
import android.util.Base64
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.os.Bundle
import android.media.MediaMetadataRetriever
import java.io.File

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

    private fun getAllAudioFiles(contentResolver: ContentResolver): List<Map<String, Any?>> {
        val audioList = mutableListOf<Map<String, Any?>>()

        val uri: Uri = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI
        val projection = arrayOf(
            MediaStore.Audio.Media._ID,
            MediaStore.Audio.Media.TITLE,
            MediaStore.Audio.Media.ARTIST,
            MediaStore.Audio.Media.ALBUM,
            MediaStore.Audio.Media.DATA,
            MediaStore.Audio.Media.DURATION,
            MediaStore.Audio.Media.ALBUM_ID,
            MediaStore.Audio.Media.ARTIST_ID,
            MediaStore.Audio.Media.DATE_ADDED,
            MediaStore.Audio.Media.DATE_MODIFIED
        )

        val selection = MediaStore.Audio.Media.IS_MUSIC + " != 0"
        val cursor: Cursor? = contentResolver.query(
            uri, projection, selection, null, null
        )

        cursor?.use {
            val idColumn = it.getColumnIndexOrThrow(MediaStore.Audio.Media._ID)
            val titleColumn = it.getColumnIndexOrThrow(MediaStore.Audio.Media.TITLE)
            val artistColumn = it.getColumnIndexOrThrow(MediaStore.Audio.Media.ARTIST)
            val albumColumn = it.getColumnIndexOrThrow(MediaStore.Audio.Media.ALBUM)
            val dataColumn = it.getColumnIndexOrThrow(MediaStore.Audio.Media.DATA)
            val durationColumn = it.getColumnIndexOrThrow(MediaStore.Audio.Media.DURATION)
            val albumIdColumn = it.getColumnIndexOrThrow(MediaStore.Audio.Media.ALBUM_ID)
            val artistIdColumn = it.getColumnIndexOrThrow(MediaStore.Audio.Media.ARTIST_ID)
            val dateAddedColumn = it.getColumnIndexOrThrow(MediaStore.Audio.Media.DATE_ADDED)
            val dateModifiedColumn = it.getColumnIndexOrThrow(MediaStore.Audio.Media.DATE_MODIFIED)

            val retriever = MediaMetadataRetriever()
            while (it.moveToNext()) {
                val id = it.getLong(idColumn)
                val title = it.getString(titleColumn)
                val artist = it.getString(artistColumn)
                val album = it.getString(albumColumn)
                val path = it.getString(dataColumn)
                val duration = it.getLong(durationColumn)
                val albumId = it.getLong(albumIdColumn)
                val artistId = it.getLong(artistIdColumn)
                val dateAdded = it.getLong(dateAddedColumn) * 1000L // Convert to milliseconds
                val dateModified = it.getLong(dateModifiedColumn) * 1000L // Convert to milliseconds

                var artworkBase64: String? = null
                // try {
                //     retriever.setDataSource(path)
                //     val artworkData = retriever.embeddedPicture
                //     if (artworkData != null) {
                //         artworkBase64 = Base64.encodeToString(artworkData, Base64.DEFAULT)
                //     }
                // } catch (e: Exception) {
                //     // Log.e("MainActivity", "Error getting artwork", e)
                // }

                val file = File(path)
                val fileExtension = file.extension

                retriever.release()

                val audioMetadata = mapOf(
                    "id" to id,
                    "title" to title,
                    "artist" to artist,
                    "album" to album,
                    "path" to path,
                    "duration" to duration,
                    "albumId" to albumId,
                    "artistId" to artistId,
                    "dateAdded" to dateAdded,
                    "dateModified" to dateModified,
                    "fileExtension" to fileExtension,
                    "artwork" to artworkBase64
                )

                audioList.add(audioMetadata)
            }
        }

        return audioList
    }
}