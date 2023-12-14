import 'dart:io';

import 'package:dio/dio.dart';

import '../models/data_model.dart';

class ApiService {
  final dio = Dio();

  static const String _userDataUrl = 'https://crudcrud.com/api/a48e3800cea24694b37b8c6cf8bc1b14/users';

  Future<Response<List<DataModel>>> fetchData() async => await dio.get<List<DataModel>>(_userDataUrl);

  Future<List<DataModel>?> fetchDataNew() async {
    try {
      var apiResponse = await dio.get(_userDataUrl);
      var apiResponseJson = apiResponse.data;
      print(apiResponseJson);
      return (apiResponseJson as List).map((p) => DataModel.fromJson(p)).toList();
    } on DioError catch (e) {
      if (e.isNoConnection || e.isBadConnection) {
        print("Something went wrong");
      } else if (e.isBadRequest) {
        print(e.response?.data?['message'] ?? 'Bad request');
      } else {
        print("Something went wrong");
      }
      return null;
    }
  }
}

extension DioErrorX on DioError {
  bool get isBadConnection => type == DioErrorType.connectionTimeout;

  bool get isNoConnection => type == DioErrorType.unknown && error is SocketException;

  bool get isBadRequest => (400 <= (response?.statusCode ?? 499) && (response?.statusCode ?? 499) < 500);
}

extension ResponceX on Response {
  bool get isSuccessful => (200 <= (statusCode ?? 499) && (statusCode ?? 499) < 300);
}
