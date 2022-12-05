// ignore_for_file: must_be_immutable
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:smttnbl_nba_app/model/team.dart';

  List<Team> teams = [];

  Future getTeams() async {
    var response = await http.get(Uri.https('balldontlie.io', 'api/v1/teams'));
    var jsonData = jsonDecode(response.body);
    for (var eachTeam in jsonData['data']) {
      final team =
          Team(abbreviation: eachTeam['abbreviation'], city: eachTeam['city']);
      teams.add(team);
    }
  }