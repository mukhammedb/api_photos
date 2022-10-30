import 'package:api_photos/model/photo.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Photo>?> getphotos() async {
    var client = http.Client();
    var uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return photosFromJson(json);
    }
    return null;
  }
}
