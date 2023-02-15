import 'package:flutter/material.dart';
import 'package:weather/data/cuaca.dart';

class MyTabBar extends StatefulWidget {
  final Map<String, List<Cuaca>>? tab;
  const MyTabBar({super.key, @required this.tab});

  @override
  State<MyTabBar> createState() => _MyTabBarState();
}

class _MyTabBarState extends State<MyTabBar> {
  late List<String>? keys;
  late List<Cuaca>? listCuaca;
  late int i;
  List<Tab> myTabs = <Tab>[
    const Tab(text: 'Hari ini'),
    const Tab(text: 'Besok'),
  ];

  @override
  void initState() {
    super.initState();
    i = 0;
    keys = widget.tab?.keys.toList();
    listCuaca = widget.tab?[keys![i]];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: DefaultTabController(
        length: widget.tab!.length,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: myTabs.map((Tab tab) {
                  return Text(tab.text!);
                }).toList(),
                onTap: (value) {
                  setState(() {
                    i = value;
                    listCuaca = widget.tab?[keys![i]];
                  });
                },
              ),
            ),
            SizedBox(
              height: 200,
              child: TabBarView(
                  children: myTabs.map((Tab tab) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(10),
                  itemCount: listCuaca?.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      // flex: 1,
                      child: Column(
                        children: [
                          Text(listCuaca![index].jamCuaca.substring(11, 16)),
                          SizedBox(
                            width: 55,
                            child: Image.network(
                              "https://ibnux.github.io/BMKG-importer/icon/${listCuaca![index].kodeCuaca}.png",
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listCuaca![index].tempC,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text("o"),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                );
              }).toList()),
            ),
          ],
        ),
      ),
    );
  }
}
