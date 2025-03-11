import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter List View Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TeamListScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TeamListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Alexis Jimenez Mat: 1213",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff)),
        ),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildTeamSection('Team A', [
            TeamMember('Kelly Lewis', Colors.pink),
            TeamMember('Elwin Howard', Colors.purple),
            TeamMember('Ron Reed', Colors.blueGrey),
          ]),
          _buildTeamSection('Team B', [
            TeamMember('Yusuf Owens', Colors.red),
            TeamMember('Tate Knox', Colors.teal),
          ]),
          _buildTeamSection('Team C', [
            TeamMember('Mircea Brown', Colors.amber),
            TeamMember('Syed Gilbert', Colors.indigo),
          ]),
        ],
      ),
    );
  }

  Widget _buildTeamSection(String teamName, List<TeamMember> members) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 16, bottom: 8),
          child: Text(
            teamName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ),
        ...members
            .map((member) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: _buildMemberTile(member),
                ))
            .toList(),
      ],
    );
  }

  Widget _buildMemberTile(TeamMember member) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        // CONFIGURACIÓN DE SOMBRAS: Modifica estos valores para cambiar el aspecto de las sombras
        boxShadow: [
          BoxShadow(
            color: Color(0xff868484)
                .withOpacity(0.3), // Opacidad: 0.0 (transparente) a 1.0 (opaco)
            spreadRadius: 4, // Dispersión: Qué tan expandida está la sombra
            blurRadius: 6, // Desenfoque: Qué tan borrosa está la sombra
            offset: Offset(0, 3), // Desplazamiento: (horizontal, vertical)
          ),
        ],
        // FIN DE CONFIGURACIÓN DE SOMBRAS
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: member.color,
          child: Text(
            member.name.split(' ').map((name) => name[0]).join(''),
            style: TextStyle(color: Colors.white),
          ),
        ),
        title: Text(member.name),
        trailing: Icon(Icons.chevron_right, color: Colors.grey),
      ),
    );
  }
}

class TeamMember {
  final String name;
  final Color color;

  TeamMember(this.name, this.color);
}
