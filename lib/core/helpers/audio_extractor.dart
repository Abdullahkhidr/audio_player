import 'package:listen_to_me/core/helpers/native_code_invoker.dart';

class AudioExtractor {
  static Future<List<Map<String, dynamic>>> getAudioFiles() async {
    try {
      final audioPaths = await NativeCodeInvoker.invokeMethod('getAudioFiles')
          .then((value) => value.cast<String>());
      return audioPaths;
    } catch (e) {
      throw Exception(e);
    }
  }
}
