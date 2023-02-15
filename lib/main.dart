import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/component/dropdown.dart';
import 'package:weather/component/tabbar.dart';
import 'package:weather/data/api.dart';
import 'package:weather/data/cuaca.dart';
import 'package:weather/data/wilayah.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Wilayah>> futureWilayah;
  late Future<List<Cuaca>> futureCuaca;
  late List<Wilayah>? listWilayah;
  late Map<String, List<Cuaca>>? groupCuaca;
  late Wilayah? wilayah;
  final f = DateFormat('yyyy-MM-dd hh:mm');

  @override
  void initState() {
    super.initState();
    futureWilayah = API.getWilayah();
    wilayah = null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder(
          future: futureWilayah,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text("Loading..."),
              );
            }

            // success
            listWilayah = snapshot.data;
            var idWilayah = wilayah?.id ?? listWilayah?.first.id;
            return Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color(0xFF6B56FD),
                    Color(0xFF59A0F1),
                    Color(0xFF8977FD),
                  ])),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Dropdown
                  MyDropDown(
                      listWilayah: listWilayah,
                      onChange: (value) => setState(() {
                            wilayah = value;
                          })),

                  // Detail Cuaca
                  FutureBuilder(
                    future: API.getCuaca(idWilayah),
                    builder: ((context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Text("Loading...");
                      }

                      // Sukses
                      var listCuaca = snapshot.data;
                      var cuaca = listCuaca?.first;
                      groupCuaca = groupBy(
                          listCuaca!, (obj) => obj.jamCuaca.substring(0, 10));
                      wilayah = listWilayah
                          ?.singleWhere((element) => element.id == idWilayah);
                      return Column(
                        children: [
                          Text(wilayah!.propinsi),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cuaca?.tempC ?? "0",
                                style: const TextStyle(fontSize: 50),
                              ),
                              const Text("o"),
                            ],
                          ),
                          // Text(f.parse(DateTime.parse(cuaca.jamCuaca))),
                          Text(cuaca!.cuaca),
                          Image.network(
                            "https://ibnux.github.io/BMKG-importer/icon/${cuaca.kodeCuaca}.png",
                          ),

                          MyTabBar(tab: groupCuaca),
                        ],
                      );
                    }),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
