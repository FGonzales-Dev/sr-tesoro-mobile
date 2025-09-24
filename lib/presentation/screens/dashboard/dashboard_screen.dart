import 'package:flutter/material.dart';
import 'package:stmdc_patient_app/presentation/screens/consultation/consultation_tab.dart';
import 'package:stmdc_patient_app/presentation/screens/ecg/ecg_tab.dart';
import 'package:stmdc_patient_app/presentation/screens/lab_tests/lab_test_tab.dart';
import 'package:stmdc_patient_app/presentation/screens/xray/xray_tab.dart';
import 'package:stmdc_patient_app/presentation/screens/profile/profile_screen.dart';

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
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('STMDC Patient App'),
        actions: [
          // Profile section in header
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Theme.of(context).colorScheme.surface,
                child: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.monitor_heart), label: 'ECG'),
          BottomNavigationBarItem(icon: Icon(Icons.medical_services), label: 'X-ray'),
          BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Lab Test'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Consultation'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

