

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart';

// Key apinya punya juang hehe, jangan dipakai ya
// Nyari daftar kota buat autocomplete

Future<List<String>> getKotaList() async {
  List<String> returnList = [];
  final response = await Dio().get(
    "https://api.rajaongkir.com/starter/city",
    options: Options(
      headers: {
      "key": "237d4652a598ea4bd9ac7047bba33a90"
        },
      responseType: ResponseType.plain
      )
    );
  if(response.statusCode ==200){
    final obj = jsonDecode(response.data);
    final rajaobj = obj["rajaongkir"];
    List<dynamic> cityList = rajaobj["results"];
    cityList.forEach((city){ returnList.add(city["city_name"].toString());});
  }
  return returnList;
}

Future<List<dynamic>> getKotaIdList() async {
  List<String> returnList = [];
  final response = await Dio().get(
    "https://api.rajaongkir.com/starter/city",
    options: Options(
      headers: {
      "key": "237d4652a598ea4bd9ac7047bba33a90"
        },
      responseType: ResponseType.plain
      )
    );;
  if(response.statusCode ==200){
    final obj = jsonDecode(response.data);
    final rajaobj = obj["rajaongkir"];
    List<dynamic> cityList = rajaobj["results"];
    return cityList;
  }
  return returnList;
}

Future<List<String>> GetLayananList({required int idAsal,required int idTujuan,required  int berat,required  String kurir}) async
{
  List<String> returnList = [];
  final response = await Dio().post(
    "https://api.rajaongkir.com/starter/cost",
    data: {
      'origin': '$idAsal',
      'destination' : '$idTujuan',
      'weight': berat,
      'courier': kurir
    },
    options: Options(
      headers: {
        "key": "237d4652a598ea4bd9ac7047bba33a90",
        "content-type": "application/x-www-form-urlencoded"
      },
      contentType: Headers.formUrlEncodedContentType,
      responseType: ResponseType.plain
    )
    );
  if(response.statusCode !=200) return returnList;
  final obj = jsonDecode(response.data);
  final rajaObj = obj["rajaongkir"];
  List<dynamic> resultList = rajaObj["results"];
  final courierInfo = resultList[0];
  List<dynamic> servicesList = courierInfo["costs"];
  servicesList.forEach((service){
    String layanan = courierInfo["name"].toString();
    layanan += "-" + service["service"].toString();
    List<dynamic> detail = service["cost"];
    dynamic infoService = detail[0];
    layanan += " Rp" + (infoService["value"]).toString();
    layanan += " " + infoService["etd"] + " Hari";
    returnList.add(layanan);
   }
   );

  return returnList;
}
