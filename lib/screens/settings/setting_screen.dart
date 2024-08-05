import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String dropDownValue = "Arabic";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 100,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            "Settings",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("language"),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.blue)),
            child: DropdownButton(
                style: TextStyle(color: Colors.blue),
                value: dropDownValue,
                isExpanded: true,
                underline: SizedBox(),
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.blue,
                ),
                items: const [
                  DropdownMenuItem<String>(
                    value: "Arabic",
                    child: Text("Arabic"),
                  ),
                  DropdownMenuItem<String>(
                    value: "English",
                    child: Text("English"),
                  ),
                ],
                onChanged: (value) {
                  dropDownValue = value!;
                  setState(() {});
                }),
          )
        ]),
      ),
    );
  }
}
