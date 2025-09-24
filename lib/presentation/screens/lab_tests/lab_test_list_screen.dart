import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';
import '../../../domain/entities/lab_test.dart';
import '../../../domain/entities/fecalysis_lab_test.dart';
import '../../../domain/entities/pregnancy_lab_test.dart';
import '../../../domain/entities/chemistry_lab_test.dart';
import '../../../domain/entities/serology_lab_test.dart';
import '../../../domain/entities/urinalysis_lab_test.dart';
import '../../../domain/entities/ogtt_lab_test.dart';
import '../../../domain/entities/cbc_lab_test.dart';
import '../../../domain/entities/abo_blood_typing_lab_test.dart';
// Import all detail screens
import 'cbc/cbc_detail_screen.dart';
import 'chemistry/chemistry_detail_screen.dart';
import 'serology/serology_detail_screen.dart';
import 'fecalysis/fecalysis_detail_screen.dart';
import 'pregnancy/pregnancy_detail_screen.dart';
import 'urinalysis/urinalysis_detail_screen.dart';
import 'ogtt/ogtt_detail_screen.dart';
import 'abo_blood_typing/abo_blood_typing_detail_screen.dart';
import 'generic_lab_test_detail_screen.dart';

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
    // Only fetch data if not already loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadLabTestDataIfNeeded();
    });
  }

  void _loadLabTestDataIfNeeded() {
    final labTestState = ref.read(labTestViewModelProvider);
    final loginVM = ref.read(loginViewModelProvider.notifier);
    final token = loginVM.accessToken;
    
    print('Lab Test List init - Test Type: ${widget.testType}');
    print('Lab Test List init - Access token: ${token != null ? 'Present' : 'Null'}');
    print('Lab Test List init - Current state: ${labTestState.runtimeType}');
    
    // Always fetch data for the specific test type (don't skip if data exists)
    if (token != null) {
      print('Lab Test List: Fetching ${widget.testType} tests...');
      ref.read(labTestViewModelProvider.notifier).fetchLabTests(token, widget.testType);
    } else {
      print('Lab Test List: No access token available');
    }
  }

  @override
  Widget build(BuildContext context) {
    final labTestState = ref.watch(labTestViewModelProvider);
    print('Lab Test List build - State: ${labTestState.runtimeType}');
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.label),
        backgroundColor: const Color(0xFF153846),
        foregroundColor: Colors.white,
      ),
      body: labTestState.isLoading
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text('Loading lab tests...'),
                ],
              ),
            )
          : labTestState.hasError
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error, size: 48, color: Colors.red),
                      const SizedBox(height: 16),
                      Text('Failed to load ${widget.label.toLowerCase()}'),
                      const SizedBox(height: 8),
                      Text('Error: ${labTestState.error}'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          final loginVM = ref.read(loginViewModelProvider.notifier);
                          final token = loginVM.accessToken;
                          if (token != null) {
                            ref.read(labTestViewModelProvider.notifier).refreshLabTests(token, widget.testType);
                          }
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : _buildList((labTestState.value as List<dynamic>).cast<LabTest>()),
    );
  }

  Widget _buildList(List<LabTest> tests) {
    if (tests.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_getTestIcon(), size: 48, color: Colors.grey),
            const SizedBox(height: 16),
            Text('No ${widget.label.toLowerCase()} found'),
          ],
        ),
      );
    }
    
    return ListView.builder(
      itemCount: tests.length,
      itemBuilder: (context, index) {
        final test = tests[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            leading: Icon(_getTestIcon(), color: _getStatusColor(test.status)),
            title: Text('${test.testType} - ${test.status}'),
            subtitle: Text('Date Accepted: ${test.dateAccepted}\nMedtech: ${test.medtechName}'),
            isThreeLine: true,
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              _navigateToDetailScreen(test);
            },
          ),
        );
      },
    );
  }

  IconData _getTestIcon() {
    switch (widget.testType) {
      case 'serology':
        return Icons.biotech;
      case 'fecalysis':
        return Icons.science;
      case 'pregnancy-test':
        return Icons.child_care;
      case 'urinalysis':
        return Icons.water_drop;
      case 'ogtt':
        return Icons.local_drink;
      case 'chemistry':
        return Icons.science;
      case 'abo-blood-typing':
        return Icons.bloodtype;
      case 'cbc':
        return Icons.analytics;
      default:
        return Icons.science;
    }
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'in_progress':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  void _navigateToDetailScreen(LabTest test) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => _getDetailScreen(test),
      ),
    );
  }

  Widget _getDetailScreen(LabTest test) {
    switch (test.runtimeType.toString()) {
      case 'FecalysisLabTest':
        return FecalysisDetailScreen(test: test as FecalysisLabTest);
      case 'PregnancyLabTest':
        return PregnancyDetailScreen(test: test as PregnancyLabTest);
      case 'ChemistryLabTest':
        return ChemistryDetailScreen(test: test as ChemistryLabTest);
      case 'SerologyLabTest':
        return SerologyDetailScreen(test: test as SerologyLabTest);
      case 'UrinalysisLabTest':
        return UrinalysisDetailScreen(test: test as UrinalysisLabTest);
      case 'OgttLabTest':
        return OgttDetailScreen(test: test as OgttLabTest);
      case 'CbcLabTest':
        return CbcDetailScreen(test: test as CbcLabTest);
      case 'AboBloodTypingLabTest':
        return AboBloodTypingDetailScreen(test: test as AboBloodTypingLabTest);
      default:
        return GenericLabTestDetailScreen(test: test);
    }
  }
}