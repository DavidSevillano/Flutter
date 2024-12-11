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
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
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
                        ),
                        children: [
                          TextSpan(
                            text: "David!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "Observa tus actores favoritos",
                      style: TextStyle(fontSize: 16, color: Colors.white54),
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
            const SizedBox(
              height: 30,
            ),
            const TextField(
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
            const SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Actores de Star What",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 400,
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
          final gender = peopleResponse.results![index].gender!;
          final height = peopleResponse.results![index].height!;
          final mass = peopleResponse.results![index].mass!;

          return getImage(peopleId, gender, height, mass);
        });
  }
}

Widget getImage(String id, String gender, String height, String mass) {
  return Row(
    children: [
      Column(
        children: [
          Container(
            width: 200,
            height: 320,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: NetworkImage(
                  "https://starwars-visualguide.com/assets/img/characters/${id}.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Género: ${gender}",
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              Text(
                "Altura: ${height} cm",
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              Text(
                "Peso: ${mass} kg",
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(
        width: 20,
      )
    ],
  );
}
