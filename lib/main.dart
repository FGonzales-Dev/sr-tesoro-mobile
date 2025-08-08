import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'presentation/screens/login_screen.dart';
import 'providers/viewmodel_providers.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  bool _isLoggedIn = false;
  bool _isSplashDone = false;

  @override
  void initState() {
    super.initState();
    _startSplash();
  }

  void _startSplash() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _isSplashDone = true;
    });
  }

  void _onLoginSuccess() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patient App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: !_isSplashDone
          ? const SplashScreen()
          : !_isLoggedIn
              ? LoginScreen(onLoginSuccess: _onLoginSuccess)
              : DashboardScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            FlutterLogo(size: 100),
            SizedBox(height: 24),
            Text('Welcome to Patient App', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    EcgTab(),
    Center(child: Text('X-ray', style: TextStyle(fontSize: 32))),
    LabTestTab(),
    ConsultationTab(),
    Center(child: Text('Profile', style: TextStyle(fontSize: 32))),
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

class ConsultationTab extends ConsumerStatefulWidget {
  const ConsultationTab({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsultationTab> createState() => _ConsultationTabState();
}

class _ConsultationTabState extends ConsumerState<ConsultationTab> {
  @override
  void initState() {
    super.initState();
    final loginVM = ref.read(loginViewModelProvider.notifier);
    final token = loginVM.accessToken;
    if (token != null) {
      ref.read(consultationViewModelProvider.notifier).fetchConsultations(token);
    }
  }

  @override
  Widget build(BuildContext context) {
    final consultationsState = ref.watch(consultationViewModelProvider);
    if (consultationsState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (consultationsState.hasError) {
      return Center(child: Text('Failed to load consultations'));
    }
    final consultations = consultationsState.value ?? [];
    if (consultations.isEmpty) {
      return const Center(child: Text('No consultations found'));
    }
    return ListView.builder(
      itemCount: consultations.length,
      itemBuilder: (context, index) {
        final c = consultations[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(c.doctorName),
            subtitle: Text('Date: ${c.consultationDate}\nChief Complaint: ${c.chiefComplaint}'),
            isThreeLine: true,
          ),
        );
      },
    );
  }
}

class EcgTab extends ConsumerStatefulWidget {
  const EcgTab({Key? key}) : super(key: key);

  @override
  ConsumerState<EcgTab> createState() => _EcgTabState();
}

class _EcgTabState extends ConsumerState<EcgTab> {
  @override
  void initState() {
    super.initState();
    final loginVM = ref.read(loginViewModelProvider.notifier);
    final token = loginVM.accessToken;
    if (token != null) {
      ref.read(ecgViewModelProvider.notifier).fetchEcgRecords(token);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ecgState = ref.watch(ecgViewModelProvider);
    if (ecgState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (ecgState.hasError) {
      return Center(child: Text('Failed to load ECG records'));
    }
    final records = ecgState.value ?? [];
    if (records.isEmpty) {
      return const Center(child: Text('No ECG records found'));
    }
    return ListView.builder(
      itemCount: records.length,
      itemBuilder: (context, index) {
        final r = records[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(r.doctorName),
            subtitle: Text('Date: ${r.createdAt}\nStatus: ${r.status}\nHeart Rate: ${r.heartRate}'),
            isThreeLine: true,
          ),
        );
      },
    );
  }
}

class LabTestTab extends StatelessWidget {
  final List<Map<String, String>> testTypes = [
    {'label': 'Serology', 'type': 'serology'},
    {'label': 'Fecalysis', 'type': 'fecalysis'},
    {'label': 'Pregnancy test', 'type': 'pregnancy-test'},
    {'label': 'Urinalysis', 'type': 'urinalysis'},
    {'label': 'OGTT', 'type': 'ogtt'},
    {'label': 'Chemistry', 'type': 'chemistry'},
    {'label': 'ABO Blood Typing', 'type': 'abo-blood-typing'},
    {'label': 'CBC', 'type': 'cbc'},
  ];

  LabTestTab({Key? key}) : super(key: key);

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

class LabTestListScreen extends ConsumerStatefulWidget {
  final String testType;
  final String label;
  const LabTestListScreen({Key? key, required this.testType, required this.label}) : super(key: key);

  @override
  ConsumerState<LabTestListScreen> createState() => _LabTestListScreenState();
}

class _LabTestListScreenState extends ConsumerState<LabTestListScreen> {
  @override
  void initState() {
    super.initState();
    final loginVM = ref.read(loginViewModelProvider.notifier);
    final token = loginVM.accessToken;
    if (token != null) {
      ref.read(labTestViewModelProvider.notifier).fetchLabTests(token, widget.testType);
    }
  }

  @override
  Widget build(BuildContext context) {
    final labTestState = ref.watch(labTestViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: Text(widget.label)),
      body: labTestState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : labTestState.hasError
              ? Center(child: Text('Failed to load lab tests'))
              : _buildList(labTestState.value ?? []),
    );
  }

  Widget _buildList(List<dynamic> tests) {
    if (tests.isEmpty) {
      return const Center(child: Text('No lab tests found'));
    }
    return ListView.builder(
      itemCount: tests.length,
      itemBuilder: (context, index) {
        final t = tests[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text('${t.testType} - ${t.status}'),
            subtitle: Text('Date Accepted: ${t.dateAccepted}\nMedtech: ${t.medtechName}'),
            isThreeLine: true,
          ),
        );
      },
    );
  }
}
