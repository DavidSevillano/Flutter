import 'package:flutter/material.dart';

class ListaHorizontal extends StatelessWidget {
  const ListaHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 60, bottom: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Best Iranian Actors and Actresses",
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "March 2020",
                    style: TextStyle(fontSize: 12, color: Colors.black26),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            SizedBox(
              height: 500,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(65),
                          child: Image.network(
                            "https://media.themoviedb.org/t/p/w235_and_h235_face/xak9L0fkIOkjSwJpz3SWLl94tVP.jpg",
                            width: 150,
                            height: 400,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Dyessa",
                          style: TextStyle(fontSize: 24, fontFamily: "Raleway"),
                        ),
                        const Text(
                          "Garcia",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black38,
                              fontFamily: "Raleway"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(65),
                          child: Image.network(
                            "https://media.themoviedb.org/t/p/w235_and_h235_face/3Xm4zDO3gUVU4OWZnhb983GnEGx.jpg",
                            width: 150,
                            height: 400,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Julia",
                          style: TextStyle(fontSize: 24, fontFamily: "Raleway"),
                        ),
                        const Text(
                          "Victoria",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black38,
                              fontFamily: "Raleway"),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(65),
                          child: Image.network(
                            "https://media.themoviedb.org/t/p/w235_and_h235_face/UQsBo3oeK5aw9tNHpLA2XKrgQt.jpg",
                            width: 150,
                            height: 400,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Naresh",
                          style: TextStyle(fontSize: 24, fontFamily: "Raleway"),
                        ),
                        const Text(
                          "Agastya",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black38,
                              fontFamily: "Raleway"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
