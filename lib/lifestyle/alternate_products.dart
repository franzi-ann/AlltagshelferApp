import 'package:flutter/material.dart';

class AlternateProducts extends StatefulWidget {
  const AlternateProducts({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AlternateProducts();
  }
}

class _AlternateProducts extends State<AlternateProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Alternativprodukte",
        ),
      ),
      body: Column(
        children: [
          _getTile(
            "Milch",
            'Es gibt viele Alternativen. Doch wirklich lokal ist nur der Haferdrink. Dieser schneidet auch in der Umweltbilanz am besten ab. Im Gegensatz zur Kuhmilch, welche 2,5 kg/CO2,ca.220 l Wasser,und 2,2 m² Landnutzung pro Liter verbraucht liegt der Haferdrink bei ca. 0,7 kg CO2, 0,2 L Wasser und 0,5 m² Landnutzung und Tiere müssen auch nicht leiden',
          ),
          _getTile(
            "Ei",
            'Beim Backen lässt sich Ei relativ einfach ersetzen durch 1EL Chiasamen, 60g Apfelmus, 1/2 reife Banane. Aber auch Tofu oder Kichererbsenmehl können ein Ei gerade zum Frühstück wunderbar ersetzen. Vorteil: keine Belastung mit Salmonellen,  Weniger Cholesterin, Tierfreundlicher',
          ),
          _getTile(
            "Fleisch",
            'Tofu, Bohnen, Kichererbsen, Grünkern, Seitan - die Auswahl ist vielseitig oft gesünder als Fleisch und vor allem: Bei einem Verzehr von 100g Geflügelfleisch pro Woche liegt der CO2 Verbrauch in 10 Jahren bei 285 kg CO2 bei 285 kg CO2. Vegane Alternativen würden ca. 207 kg CO2 einsparen. Schweinefleisch hätte einen CO2 Verbrauch von 351 kg CO2 (demnach würde man 277 kg CO2 sparen) und Rindfleisch läge schon bei 1.435 kg CO2 (1435 kg CO2 ließe sich mit veganen alternativen einsparen). - und das bei nur 100g pro Woche!!',
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
            maxLines: 15,
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
