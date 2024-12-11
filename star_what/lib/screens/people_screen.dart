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
    return FutureBuilder<PeopleResponse>(
      future: peopleResponse,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return buildPeopleList(snapshot.data!);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }

  Future<PeopleResponse> getPeople() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/people/'));

    if (response.statusCode == 200) {
      return PeopleResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load people');
    }
  }

  Widget buildPeopleList(PeopleResponse peopleResponse) {
    return ListView.builder(
        itemCount: peopleResponse.results!.length,
        itemBuilder: (context, index) {
          return Text(peopleResponse.results![index].name);
        });
  }
}
