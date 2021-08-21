import 'package:flutter/material.dart';
import 'package:ylabs_task2/ongkir_api.dart';

class OngkirPage extends StatefulWidget {
  @override
  _OngkirPageState createState() => _OngkirPageState();
}

class _OngkirPageState extends State<OngkirPage> {
  List<String> listKota = [];
  List<dynamic> listKotaId = [];
  List<String> daftarLayanan = [];
  final TextEditingController _asalKotaController = TextEditingController();
  final TextEditingController _tujuanController = TextEditingController();
  final TextEditingController _beratController = TextEditingController();
  String _kurirValue = "jne";
  String keteranganLayanan = "";

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Text(listKota.toString()),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue value) {
                  return listKota
                      .where((element) => element
                          .toLowerCase()
                          .startsWith(value.text.toLowerCase()))
                      .toList();
                },
                fieldViewBuilder:
                    (context, textController, focusNode, onfieldSubmitted) =>
                        TextField(
                  controller: textController,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Asal Kota"),
                  onChanged: (String value) {
                    setState(() {
                      _asalKotaController.value = TextEditingValue(text: value);
                    });
                  },
                ),
                onSelected: (String value) {
                  setState(() {
                    _asalKotaController.value = TextEditingValue(text: value);
                  });
                },
              ),
              SizedBox(
                height: 24,
              ),
              Autocomplete<String>(
                optionsBuilder: (TextEditingValue value) {
                  return listKota
                      .where((element) => element
                          .toLowerCase()
                          .startsWith(value.text.toLowerCase()))
                      .toList();
                },
                fieldViewBuilder:
                    (context, textController, focusNode, onfieldSubmitted) =>
                        TextField(
                  controller: textController,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Kota Tujuan"),
                  onChanged: (String value) {
                    setState(() {
                      _tujuanController.value = TextEditingValue(text: value);
                    });
                  },
                ),
                onSelected: (String value) {
                  setState(() {
                    _tujuanController.value = TextEditingValue(text: value);
                  });
                },
              ),
              SizedBox(
                height: 24,
              ),
              TextField(
                controller: _beratController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Berat (gram)"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                          value: 'jne',
                          groupValue: _kurirValue,
                          onChanged: (String? value) {
                            setState(() {
                              _kurirValue = value ?? "";
                            });
                          }),
                      Text("JNE")
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                          value: 'pos',
                          groupValue: _kurirValue,
                          onChanged: (String? value) {
                            setState(() {
                              _kurirValue = value ?? "";
                            });
                          }),
                      Text("POS Kilat")
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                          value: 'tiki',
                          groupValue: _kurirValue,
                          onChanged: (String? value) {
                            setState(() {
                              _kurirValue = value ?? "";
                            });
                          }),
                      Text("Tiki")
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (_beratController.text.isEmpty ||
                        _asalKotaController.text.isEmpty ||
                        _tujuanController.text.isEmpty) return;
                    daftarLayanan = await GetLayananList(
                        idAsal: getIdKota(_asalKotaController.text),
                        idTujuan: getIdKota(_tujuanController.text),
                        berat: int.parse(_beratController.text),
                        kurir: _kurirValue);
                    keteranganLayanan = "";
                    daftarLayanan.forEach((layanan) {
                      keteranganLayanan += "-" + layanan + "\n";
                    });
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text("Ongkos Kirim"),
                              content: Text(keteranganLayanan),
                            ));
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Text("Cek Ongkir"),
                  ))
            ],
          )),
    );
  }

  int getIdKota(String kota) {
    int idKota = -1;
    listKotaId.forEach((city) {
      if ((city["city_name"]).toString() == kota) {
        idKota = int.parse(city["city_id"]);
      }
    });
    return idKota;
  }

  void getData() async {
    setState(() async {
      listKota = await getKotaList();
      listKotaId = await getKotaIdList();
    });
  }
}
