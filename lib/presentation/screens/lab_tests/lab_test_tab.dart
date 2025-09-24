import 'package:flutter/material.dart';
import 'lab_test_list_screen.dart';

class LabTestTab extends StatelessWidget {
  final List<Map<String, String>> testTypes = const [
    {'label': 'Serology', 'type': 'serology'},
    {'label': 'Fecalysis', 'type': 'fecalysis'},
    {'label': 'Pregnancy test', 'type': 'pregnancy-test'},
    {'label': 'Urinalysis', 'type': 'urinalysis'},
    {'label': 'OGTT', 'type': 'ogtt'},
    {'label': 'Chemistry', 'type': 'chemistry'},
    {'label': 'ABO Blood Typing', 'type': 'abo-blood-typing'},
    {'label': 'CBC', 'type': 'cbc'},
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
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => LabTestListScreen(testType: test['type']!, label: test['label']!),
                ),
              );
            },
            child: Center(
              child: Text(test['label']!, style: const TextStyle(fontSize: 18)),
            ),
          ),
        );
      }).toList(),
    );
  }
}

