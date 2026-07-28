import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ResourceEngine {
  Future<String> downloadAndCacheResource(String url) async {
    if (!url.startsWith('http')) return url;

    try {
      final appDir = await getApplicationDocumentsDirectory();
      final resourceDir = Directory('${appDir.path}/devatlas_resources');
      if (!await resourceDir.exists()) {
        await resourceDir.create(recursive: true);
      }

      final uri = Uri.parse(url);
      final rawFileName = uri.pathSegments.isNotEmpty ? uri.pathSegments.last : 'resource';
      final fileName = '${url.hashCode}_$rawFileName';
      final localFile = File('${resourceDir.path}/$fileName');

      if (await localFile.exists()) {
        return localFile.path;
      }

      final response = await http.get(uri);
      if (response.statusCode == 200) {
        await localFile.writeAsBytes(response.bodyBytes);
        return localFile.path;
      }
    } catch (e) {
      // Resource download failed, gracefully fallback to url
    }
    return url;
  }
}
