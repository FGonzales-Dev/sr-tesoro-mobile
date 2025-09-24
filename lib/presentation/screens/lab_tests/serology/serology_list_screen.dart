import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/providers.dart';
import '../../../../domain/entities/serology_lab_test.dart';
import 'serology_detail_screen.dart';

class SerologyListScreen extends ConsumerStatefulWidget {
  const SerologyListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SerologyListScreen> createState() => _SerologyListScreenState();
}

class _SerologyListScreenState extends ConsumerState<SerologyListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadSerologyDataIfNeeded();
    });
  }

  void _loadSerologyDataIfNeeded() {
    final serologyState = ref.read(serologyLabTestViewModelProvider);
    final loginVM = ref.read(loginViewModelProvider.notifier);
    final token = loginVM.accessToken;
    
    print('Serology List init - Access token: ${token != null ? 'Present' : 'Null'}');
    print('Serology List init - Current state: ${serologyState.runtimeType}');
    
    if (token != null) {
      print('Serology List: Fetching serology tests...');
      ref.read(serologyLabTestViewModelProvider.notifier).fetchSerologyLabTests(token);
    } else {
      print('Serology List: No access token available');
    }
  }

  @override
  Widget build(BuildContext context) {
    final serologyState = ref.watch(serologyLabTestViewModelProvider);
    print('Serology List build - State: ${serologyState.runtimeType}');
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serology Tests'),
        backgroundColor: const Color(0xFF153846),
        foregroundColor: Colors.white,
      ),
      body: serologyState.when(
        data: (tests) => tests.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.science, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text('No serology tests found', style: TextStyle(fontSize: 18)),
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
                      leading: const Icon(Icons.science, color: Color(0xFF153846)),
                      title: Text('Serology Test #${test.id}'),
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
                            builder: (_) => SerologyDetailScreen(test: test),
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
                    ref.read(serologyLabTestViewModelProvider.notifier).refreshSerologyLabTests(token);
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
