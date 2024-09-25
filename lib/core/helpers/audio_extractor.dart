import 'package:listen_to_me/core/helpers/native_code_invoker.dart';
import 'package:listen_to_me/core/utils/constants.dart';

class AudioExtractor {
  Future<List<Map<String, dynamic>>> getSongs() async {
    try {
      final audioData = await NativeCodeInvoker.invokeMethod(
              'getAudioFiles', {'extensions': kAudioFileExtensions.join(',')})
          as List;
      return audioData.map((e) => Map<String, dynamic>.from(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Map<String, dynamic>>> getAlbums() async {
    try {
      final albums =
          await NativeCodeInvoker.invokeMethod('queryAlbums') as List;
      return albums.map((e) => Map<String, dynamic>.from(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Map<String, dynamic>>> getPlaylists() async {
    try {
      final playlists =
          await NativeCodeInvoker.invokeMethod('queryPlaylists') as List;
      return playlists.map((e) => Map<String, dynamic>.from(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
