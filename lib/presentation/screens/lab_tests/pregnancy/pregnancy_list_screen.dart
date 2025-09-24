import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/providers.dart';
import '../../../../domain/entities/pregnancy_lab_test.dart';
import 'pregnancy_detail_screen.dart';

class PregnancyListScreen extends ConsumerStatefulWidget {
  const PregnancyListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PregnancyListScreen> createState() => _PregnancyListScreenState();
}

class _PregnancyListScreenState extends ConsumerState<PregnancyListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadPregnancyDataIfNeeded();
    });
  }

  void _loadPregnancyDataIfNeeded() {
    final pregnancyState = ref.read(pregnancyLabTestViewModelProvider);
    final loginVM = ref.read(loginViewModelProvider.notifier);
    final token = loginVM.accessToken;
    
    print('Pregnancy List init - Access token: ${token != null ? 'Present' : 'Null'}');
    print('Pregnancy List init - Current state: ${pregnancyState.runtimeType}');
    
    if (token != null) {
      print('Pregnancy List: Fetching pregnancy tests...');
      ref.read(pregnancyLabTestViewModelProvider.notifier).fetchPregnancyLabTests(token);
    } else {
      print('Pregnancy List: No access token available');
    }
  }

  @override
  Widget build(BuildContext context) {
    final pregnancyState = ref.watch(pregnancyLabTestViewModelProvider);
    print('Pregnancy List build - State: ${pregnancyState.runtimeType}');
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pregnancy Tests'),
        backgroundColor: const Color(0xFF153846),
        foregroundColor: Colors.white,
      ),
      body: pregnancyState.when(
        data: (tests) => tests.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text('No pregnancy tests found', style: TextStyle(fontSize: 18)),
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
                      leading: const Icon(Icons.favorite, color: Color(0xFF153846)),
                      title: Text('Pregnancy Test #${test.id}'),
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
                            builder: (_) => PregnancyDetailScreen(test: test),
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
                    ref.read(pregnancyLabTestViewModelProvider.notifier).refreshPregnancyLabTests(token);
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
