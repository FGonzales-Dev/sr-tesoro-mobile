import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/providers.dart';
import '../../../../domain/entities/cbc_lab_test.dart';
import 'cbc_detail_screen.dart';

class CbcListScreen extends ConsumerStatefulWidget {
  const CbcListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<CbcListScreen> createState() => _CbcListScreenState();
}

class _CbcListScreenState extends ConsumerState<CbcListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadCbcDataIfNeeded();
    });
  }

  void _loadCbcDataIfNeeded() {
    final cbcState = ref.read(cbcLabTestViewModelProvider);
    final loginVM = ref.read(loginViewModelProvider.notifier);
    final token = loginVM.accessToken;
    
    print('CBC List init - Access token: ${token != null ? 'Present' : 'Null'}');
    print('CBC List init - Current state: ${cbcState.runtimeType}');
    
    if (token != null) {
      print('CBC List: Fetching CBC tests...');
      ref.read(cbcLabTestViewModelProvider.notifier).fetchCbcLabTests(token);
    } else {
      print('CBC List: No access token available');
    }
  }

  @override
  Widget build(BuildContext context) {
    final cbcState = ref.watch(cbcLabTestViewModelProvider);
    print('CBC List build - State: ${cbcState.runtimeType}');
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('CBC Tests'),
        backgroundColor: const Color(0xFF153846),
        foregroundColor: Colors.white,
      ),
      body: cbcState.when(
        data: (tests) => tests.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.analytics, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text('No CBC tests found', style: TextStyle(fontSize: 18)),
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
                      leading: const Icon(Icons.analytics, color: Color(0xFF153846)),
                      title: Text('CBC Test #${test.id}'),
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
                            builder: (_) => CbcDetailScreen(test: test),
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
                    ref.read(cbcLabTestViewModelProvider.notifier).refreshCbcLabTests(token);
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
