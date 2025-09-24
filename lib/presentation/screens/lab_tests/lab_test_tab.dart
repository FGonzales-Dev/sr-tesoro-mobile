import 'package:flutter/material.dart';
import 'serology/serology_list_screen.dart';
import 'cbc/cbc_list_screen.dart';
import 'chemistry/chemistry_list_screen.dart';
import 'fecalysis/fecalysis_list_screen.dart';
import 'pregnancy/pregnancy_list_screen.dart';
import 'urinalysis/urinalysis_list_screen.dart';
import 'ogtt/ogtt_list_screen.dart';
import 'abo_blood_typing/abo_blood_typing_list_screen.dart';

class LabTestTab extends StatelessWidget {
  final List<Map<String, dynamic>> testTypes = const [
    {'label': 'Serology', 'type': 'serology', 'icon': Icons.science, 'color': Color(0xFF153846)},
    {'label': 'Fecalysis', 'type': 'fecalysis', 'icon': Icons.visibility, 'color': Color(0xFF153846)},
    {'label': 'Pregnancy test', 'type': 'pregnancy-test', 'icon': Icons.favorite, 'color': Color(0xFF153846)},
    {'label': 'Urinalysis', 'type': 'urinalysis', 'icon': Icons.water_drop, 'color': Color(0xFF153846)},
    {'label': 'OGTT', 'type': 'ogtt', 'icon': Icons.local_drink, 'color': Color(0xFF153846)},
    {'label': 'Chemistry', 'type': 'chemistry', 'icon': Icons.biotech, 'color': Color(0xFF153846)},
    {'label': 'ABO Blood Typing', 'type': 'abo-blood-typing', 'icon': Icons.bloodtype, 'color': Color(0xFF153846)},
    {'label': 'CBC', 'type': 'cbc', 'icon': Icons.analytics, 'color': Color(0xFF153846)},
  ];

  const LabTestTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      children: testTypes.map((test) {
        return Card(
          margin: const EdgeInsets.all(8),
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        child: InkWell(
          onTap: () {
            Widget screen;
            switch (test['type']) {
              case 'serology':
                screen = const SerologyListScreen();
                break;
              case 'cbc':
                screen = const CbcListScreen();
                break;
              case 'chemistry':
                screen = const ChemistryListScreen();
                break;
              case 'fecalysis':
                screen = const FecalysisListScreen();
                break;
              case 'pregnancy-test':
                screen = const PregnancyListScreen();
                break;
              case 'urinalysis':
                screen = const UrinalysisListScreen();
                break;
              case 'ogtt':
                screen = const OgttListScreen();
                break;
              case 'abo-blood-typing':
                screen = const AboBloodTypingListScreen();
                break;
              default:
                return; // Don't navigate for unknown types
            }
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => screen),
            );
          },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    test['icon'] as IconData,
                    size: 48,
                    color: test['color'] as Color,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    test['label']!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: test['color'] as Color,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

