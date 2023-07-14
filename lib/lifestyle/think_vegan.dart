import 'package:flutter/material.dart';

class ThinkVegan extends StatefulWidget {
  const ThinkVegan({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ThinkVegan();
  }
}

class _ThinkVegan extends State<ThinkVegan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Think vegan",
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          _getTile(
            "Softeis",
            '2 gefrorene Bananen\n\n'
                '2 EL Kakao\n\n'
                '1 EL Nussmus\n\n'
                'plus Datteln oder Schokodrops\n\n'
                '→ einfach alles zusammen in den Mixer und ihr habt ein schönes "gesundes" Schokoeis',
          ),
          _getTile(
            "Mousse au Chocolat",
            '300g vegane Schokolade (im Wasserbad schmelzen)\n\n'
                '400 g Seidentofu\n\n'
                'Alles in den Mixer und ab in den Kühlschrank',
          ),
          _getTile(
            "Crispy Tofu Salat",
            'Tofu im Ofen bei 180 Grad ca 10 Min knusprig backen \n\n'
                'Anschließend: Reisnudeln, Karotte, Gurke und Paprika mit dem Tofu in eine Schüssel geben.\n\n'
                'Für das Dressing:\n2 EL Erdnussmus, 1 EL Erdnussöl, 1EL Ahornsirup, 4 EL sojasauce und 1/2 Zitrone',
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
