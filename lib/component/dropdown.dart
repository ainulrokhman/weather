import 'package:flutter/material.dart';
import 'package:weather/data/wilayah.dart';

class MyDropDown extends StatefulWidget {
  final List<Wilayah>? listWilayah;
  final ValueChanged<Wilayah>? onChange;
  const MyDropDown(
      {super.key, @required this.listWilayah, @required this.onChange});

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  late Wilayah? dDValue;
  @override
  void initState() {
    super.initState();
    dDValue = widget.listWilayah?.first;
  }

  @override
  Widget build(BuildContext context) {
    var listWilayah = widget.listWilayah;
    var wilayah = widget.onChange;
    return DropdownButton(
      value: dDValue?.id,
      items: listWilayah?.map<DropdownMenuItem<String>>((Wilayah wilayah) {
        return DropdownMenuItem(
          value: wilayah.id,
          child: Text(wilayah.kecamatan),
          // child: Text("${wilayah.kecamatan}, ${wilayah.kota}"),
        );
      }).toList(),
      onChanged: ((value) {
        setState(() {
          dDValue = listWilayah?.singleWhere((element) => element.id == value);
          wilayah!(dDValue!);
        });
      }),
    );
  }
}
