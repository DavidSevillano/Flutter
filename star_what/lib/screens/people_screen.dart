import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:star_what/models/people_response/people_response.dart';
import 'package:http/http.dart' as http;

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  late Future<PeopleResponse> peopleResponse;

  @override
  void initState() {
    super.initState();
    peopleResponse = getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://img.freepik.com/foto-gratis/fondo-papel-tapiz-colorido-borroso-artistico_58702-8312.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: "Hola ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: "Roboto"),
                          children: [
                            TextSpan(
                              text: "David!",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontFamily: "Roboto"),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                        "Observa tus actores favoritos",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white54,
                            fontFamily: "Roboto"),
                      ),
                    ],
                  ),
                  ClipOval(
                    child: Image.network(
                      "https://img.freepik.com/vector-premium/icono-perfil-avatar_188544-4755.jpg",
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white38),
                    ),
                    labelText: 'Buscar actores',
                    labelStyle: TextStyle(color: Colors.white38),
                    hintText: 'Escribe el nombre del actor',
                    hintStyle: TextStyle(color: Colors.white30)),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 30, bottom: 5),
                  child: RichText(
                    text: const TextSpan(
                      text: "Actores ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: "Roboto",
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: "de Star What",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            fontFamily: "Roboto",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  children: [
                    SizedBox(
                      height: 430,
                      child: FutureBuilder<PeopleResponse>(
                        future: peopleResponse,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return _buildPeopleList(snapshot.data!);
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }

                          // By default, show a loading spinner.
                          return const CircularProgressIndicator();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<PeopleResponse> getPeople() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/people'));

    if (response.statusCode == 200) {
      return PeopleResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Widget _buildPeopleList(PeopleResponse peopleResponse) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: peopleResponse.results!.length,
        itemBuilder: (context, index) {
          final people = peopleResponse.results![index].url!;
          final peopleId = people.split('/')[5];
          final name = peopleResponse.results![index].name!;
          final gender = peopleResponse.results![index].gender!;
          final height = peopleResponse.results![index].height!;
          final mass = peopleResponse.results![index].mass!;

          return getCharacterData(peopleId, name, gender, height, mass);
        });
  }
}

Widget getCharacterData(
    String id, String name, String gender, String height, String mass) {
  final Duration initialDelay = Duration(seconds: 1);

  return Row(
    children: [
      Column(
        children: [
          DelayedDisplay(
            delay: initialDelay,
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://starwars-visualguide.com/assets/img/characters/$id.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$name",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Género: $gender",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "Roboto",
                      ),
                    ),
                    Text(
                      "Altura: $height cm",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "Roboto",
                      ),
                    ),
                    Text(
                      "Peso: $mass kg",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "Roboto",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(
        width: 20,
      )
    ],
  );
}