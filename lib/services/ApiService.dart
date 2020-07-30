import 'package:dio/dio.dart';
const BASE_URL = "https://hai-touna.lentera-lipuku.com/";
class ApiService{
  // Mengambil Semua Data Dari Database Berdasarkan Route Yang Di Inginkan
  Future<List> getData(url) async {
    var response = await Dio().get(
        BASE_URL + url);
    return response.data["data"];
  }
}