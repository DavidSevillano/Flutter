import 'package:flutter/material.dart';

class ListaHorizontal extends StatelessWidget {
  const ListaHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 60),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Best Iranian Actors and Actresses",
                  style: TextStyle(fontSize: 30, color: Colors.black),
                ),
                Text(
                  "March 2020",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
      )
  }
}
