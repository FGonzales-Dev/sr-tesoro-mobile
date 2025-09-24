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
        backgroundColor: const Color(0xFF153846),
        foregroundColor: Colors.white,
        actions: [
          // Profile section in header
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                  child: const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person,
                      color: Color(0xFF153846),
                      size: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
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
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

