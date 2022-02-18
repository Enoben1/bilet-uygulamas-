import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class person extends StatelessWidget {
  person(this.ucakbilet, this.otobusbilet);

  final ucakbilet;
  final otobusbilet;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Alınan Uçak Biletleri"),
              Text("Alınan Otobüs Biletleri"),
            ],
          ),
          ListView.builder(itemCount: 5 , itemBuilder: (BuildContext ctxt, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 3, bottom: 3),
              child: Text(index.toString())
            );
          }),
        ],
      ),
    );
  }
}