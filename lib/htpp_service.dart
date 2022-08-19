import 'package:dio/dio.dart';

class HttpService{
  Dio dio = Dio();
  final baseUrl = 'https://api.openweathermap.org/data/2.5/weather?q=';

  HttpService(){
    dio = Dio(BaseOptions(
      baseUrl: baseUrl

    ));
  }
  Future<Response> getRequest(String endpoint) async{
    late Response response;
    try {
      response = await dio.get(endpoint);
    } on DioError catch (e) {
      print(e.message);
    }
    return response;
  }
  initialiseInterceptors(){
    dio.interceptors.add(InterceptorsWrapper(
        onError: (error, errorInterceptorHandler ){
          print(error.message);
        },
        onRequest: (request, requestInterceptorHandler){
          print("${request.method} | ${request.path}");
        },
        onResponse: (response, responseInterceptorHandler) {
          print('${response.statusCode} | ${response.data}');
        }
    ));
  }
}