import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/providers.dart';
import '../../../../domain/entities/urinalysis_lab_test.dart';
import 'urinalysis_detail_screen.dart';

class UrinalysisListScreen extends ConsumerStatefulWidget {
  const UrinalysisListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<UrinalysisListScreen> createState() => _UrinalysisListScreenState();
}

class _UrinalysisListScreenState extends ConsumerState<UrinalysisListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUrinalysisDataIfNeeded();
    });
  }

  void _loadUrinalysisDataIfNeeded() {
    final urinalysisState = ref.read(urinalysisLabTestViewModelProvider);
    final loginVM = ref.read(loginViewModelProvider.notifier);
    final token = loginVM.accessToken;
    
    print('Urinalysis List init - Access token: ${token != null ? 'Present' : 'Null'}');
    print('Urinalysis List init - Current state: ${urinalysisState.runtimeType}');
    
    if (token != null) {
      print('Urinalysis List: Fetching urinalysis tests...');
      ref.read(urinalysisLabTestViewModelProvider.notifier).fetchUrinalysisLabTests(token);
    } else {
      print('Urinalysis List: No access token available');
    }
  }

  @override
  Widget build(BuildContext context) {
    final urinalysisState = ref.watch(urinalysisLabTestViewModelProvider);
    print('Urinalysis List build - State: ${urinalysisState.runtimeType}');
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Urinalysis Tests'),
        backgroundColor: const Color(0xFF153846),
        foregroundColor: Colors.white,
      ),
      body: urinalysisState.when(
        data: (tests) => tests.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.water_drop, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text('No urinalysis tests found', style: TextStyle(fontSize: 18)),
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
                      leading: const Icon(Icons.water_drop, color: Color(0xFF153846)),
                      title: Text('Urinalysis Test #${test.id}'),
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
                            builder: (_) => UrinalysisDetailScreen(test: test),
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
                    ref.read(urinalysisLabTestViewModelProvider.notifier).refreshUrinalysisLabTests(token);
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
