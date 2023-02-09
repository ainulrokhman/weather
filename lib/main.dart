import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    const List<String> list = <String>['DKI Jakarta', 'Bali', 'Jawa Tengah'];
    const List<Tab> myTabs = <Tab>[
      Tab(text: 'Hari Ini'),
      Tab(text: 'Besok'),
    ];
    String dropdownValue = list.first;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          // constraints: const BoxConstraints.expand(),
          // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
          // width: double.infinity,
          // color: const Color(0xFF6B56FD),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                value: dropdownValue,
                onChanged: ((value) {
                  setState(() {
                    dropdownValue = value!;
                    // ignore: avoid_print
                    print(dropdownValue);
                  });
                }),
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const Text("Kota Jakarta Barat"),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "27",
                    style: TextStyle(fontSize: 50),
                  ),
                  Text("o")
                ],
              ),
              const SizedBox(height: 20),
              const Text("Kamis, 09 Febuari 2023"),
              const Text("Cerah Berawan"),
              const SizedBox(height: 20),
              Image.asset("img/berawan.png"),
              const SizedBox(height: 20),
              Container(
                color: Colors.white,
                width: double.infinity,
                child: DefaultTabController(
                  length: myTabs.length,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      TabBar(
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: myTabs,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
