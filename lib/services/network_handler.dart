import 'package:camera/camera.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class NetworkHandler {
  String baseUrl = "https://recyclo.herokuapp.com/api";
  var log = Logger();

  Future<dynamic> get(String url) async {
    url = formater(url);
    var response = await http.get(Uri.parse(url));
    log.i(response.body);
    log.i(response.statusCode);
  }

  Future<dynamic> post(String url, Map<String, String> body) async {
    url = formater(url);
    var response = await http.post(Uri.parse(url), body: body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      log.i(response.body);
      return response;
    }
    log.d(response.body);
    log.d(response.statusCode);
  }

  Future<http.StreamedResponse> patchImage(String url, String filepath) async {
    url = formater(url);
    //String token = await storage.read(key:"token");
    var request = http.MultipartRequest('POST', Uri.parse((url)));
    request.files.add(await http.MultipartFile.fromPath("photo", filepath));
    // request.headers.addAll({
    //   "Content-type": "multipart/form-data",
    //   "Authorization": "Bearer $token"
    // });
    var response = await request.send();
    return response;
  }

  String formater(String url) {
    return baseUrl + url;
  }

  newPost(String url, String filepath) async {
    url = formater(url);
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath("photo", filepath));
    request.fields.addAll(
        {"caption": "new cap", "procedure": "done that", "price": "456"});
    print("request: " + request.toString());
    var res = await request.send();
    print("This is response:" + res.toString());
    return res.statusCode;
  }
}
