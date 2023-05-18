import 'package:flutter/material.dart';

class SaveEnergy extends StatefulWidget {
  const SaveEnergy({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SaveEnergy();
  }
}

class _SaveEnergy extends State<SaveEnergy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Energie sparen",
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          _getTile(
            "Heizkosten",
            'Mit geringen Änderungen bei der Beheizung der Wohnung oder des Hauses kann sehr leicht Heizkosten gespart werden. Dazu gibt es folgende einfache Tipps'
                '\n\n·  Faustregel:\njedes Grad Raumtemperatur senkt den Heizkostenverbrauch um ca 6%'
                '\n\n·  Heizkörper entlüften:\nein gut gelüftetes Heizungssystem verbraucht weniger Energie und beseitigt gleichzeitig das nervige Gluckern der Heizkörper.'
                '\n\n·  Richtige Positionierung der Möbel:\nVor einer Heizung sollen keine Möbel oder Vorhänge stehen, dahinter staut sich die Wärme und verteilt sich nicht im Raum.  Bonustipp: Selbst Staub auf den Heizkörpern kann die Wärmeabgabe mindern.'
                '\n\n·  Lüften:\nin der Zeit in der geheizt wird sollten die Fenster nicht auf Kipp gestellt werden. Mehrmaliges kurzes Stoßlüften ist wesentlich energiesparender.\n',
          ),
          _getTile(
            "Stromkosten",
            'Ebenso wie bei den Heizkosten reichen kleinere Anpassungen im Alltag aus um der Senkung der Stromkosten beizutragen.'
                '\n\n·  Abschaltbare Mehrfachsteckdosen:\ngroße Mengen des Stromverbrauchs im Haushalt werden durch das Standby verschiedener Geräte verwendet. Darunter gehören Ladegeräte oder auch Spielekonsolen oder TVs.'
                '\n\n·  Effizienz durch Neugeräte:\noft zahlt sich der Austausch eines Altgeräts durch ein neues aus. Durch effektivere Technik wird so sehr viel Energie eingespart und damit amortisiert sich Kaufpreis auch oft sehr schnell.'
                '\n\n·  Sparpotenzial des Kühlschranks:\nKühl und Gefrierschänke verbrauchen einen extrem hohen Prozentsatz des Stromverbrauchs, da diese dauerhaft eingeschaltet sein müssen. Daher zahlt sich Optimierungen dieser Geräte besonders aus. Energieeffiziente Geräte sowie eine Anpassung der Temperatur auf +7°C des Kühlschrankes und -18°C im Gefrierfach können effektive Sparmaßnahmen sein.'
                '\n\n·  Strommessgerät:\nEin guter Tipp zum Einsparen von Strom ist es, die aktuell genutzten Geräte mit einem Strommessgerät zu messen und den aktuellen Verbrauch aufzuzeigen und damit heimliche Stromfresser zu finden. Durch diese Methode kann man sich einen klaren Überblick schaffen und evtl. Einsparnisse durch Neuanschaffungen vergleichen.\n',
          ),
        ],
      ),
    );
  }

  _getTile(String title, String content) {
    return ExpansionTile(
      expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
      initiallyExpanded: false,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 18,
        ),
      ),
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(
            10,
            0,
            10,
            10,
          ),
          child: Text(
            content,
            maxLines: 40,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
