import 'package:dio/dio.dart';

class ApiManager {
  Dio dio = Dio();
  getRequest(var url) async {
    Response response = await dio.get(
      url,
      options: Options(
        headers: {
          'Authorization': "Bearer ",
        },
      ),
    );

    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }
}
