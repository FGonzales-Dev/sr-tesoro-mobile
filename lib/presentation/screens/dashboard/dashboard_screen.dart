import 'package:flutter/material.dart';
import 'package:stmdc_patient_app/presentation/screens/consultation/consultation_tab.dart';
import 'package:stmdc_patient_app/presentation/screens/ecg/ecg_tab.dart';
import 'package:stmdc_patient_app/presentation/screens/lab_tests/lab_test_tab.dart';
import 'package:stmdc_patient_app/presentation/screens/xray/xray_tab.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const EcgTab(),
    const XrayTab(),
    const LabTestTab(),
    const ConsultationTab(),
    const Center(child: Text('Profile', style: TextStyle(fontSize: 32))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF153846),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.monitor_heart), label: 'ECG'),
          BottomNavigationBarItem(icon: Icon(Icons.medical_services), label: 'X-ray'),
          BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Lab Test'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Consultation'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

