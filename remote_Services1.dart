import 'package:test_app/model/post.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/model/post2.dart';

class Remote_Service {
  Future<List<Posts>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postsFromJson(json);
    }
  }
}
