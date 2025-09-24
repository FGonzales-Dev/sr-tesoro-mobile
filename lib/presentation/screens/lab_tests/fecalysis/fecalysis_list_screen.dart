import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/providers.dart';
import '../../../../domain/entities/fecalysis_lab_test.dart';
import 'fecalysis_detail_screen.dart';

class FecalysisListScreen extends ConsumerStatefulWidget {
  const FecalysisListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<FecalysisListScreen> createState() => _FecalysisListScreenState();
}

class _FecalysisListScreenState extends ConsumerState<FecalysisListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadFecalysisDataIfNeeded();
    });
  }

  void _loadFecalysisDataIfNeeded() {
    final fecalysisState = ref.read(fecalysisLabTestViewModelProvider);
    final loginVM = ref.read(loginViewModelProvider.notifier);
    final token = loginVM.accessToken;
    
    print('Fecalysis List init - Access token: ${token != null ? 'Present' : 'Null'}');
    print('Fecalysis List init - Current state: ${fecalysisState.runtimeType}');
    
    if (token != null) {
      print('Fecalysis List: Fetching fecalysis tests...');
      ref.read(fecalysisLabTestViewModelProvider.notifier).fetchFecalysisLabTests(token);
    } else {
      print('Fecalysis List: No access token available');
    }
  }

  @override
  Widget build(BuildContext context) {
    final fecalysisState = ref.watch(fecalysisLabTestViewModelProvider);
    print('Fecalysis List build - State: ${fecalysisState.runtimeType}');
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fecalysis Tests'),
        backgroundColor: const Color(0xFF153846),
        foregroundColor: Colors.white,
      ),
      body: fecalysisState.when(
        data: (tests) => tests.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.visibility, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text('No fecalysis tests found', style: TextStyle(fontSize: 18)),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: tests.length,
                itemBuilder: (context, index) {
                  final test = tests[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: const Icon(Icons.visibility, color: Color(0xFF153846)),
                      title: Text('Fecalysis Test #${test.id}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date: ${test.dateAccepted}'),
                          Text('Status: ${test.status}'),
                          Text('Medtech: ${test.medtechName}'),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => FecalysisDetailScreen(test: test),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text('Error: $error'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final loginVM = ref.read(loginViewModelProvider.notifier);
                  final token = loginVM.accessToken;
                  if (token != null) {
                    ref.read(fecalysisLabTestViewModelProvider.notifier).refreshFecalysisLabTests(token);
                  }
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
