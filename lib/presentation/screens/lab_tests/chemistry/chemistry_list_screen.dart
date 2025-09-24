import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/providers.dart';
import '../../../../domain/entities/chemistry_lab_test.dart';
import 'chemistry_detail_screen.dart';

class ChemistryListScreen extends ConsumerStatefulWidget {
  const ChemistryListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ChemistryListScreen> createState() => _ChemistryListScreenState();
}

class _ChemistryListScreenState extends ConsumerState<ChemistryListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadChemistryDataIfNeeded();
    });
  }

  void _loadChemistryDataIfNeeded() {
    final chemistryState = ref.read(chemistryLabTestViewModelProvider);
    final loginVM = ref.read(loginViewModelProvider.notifier);
    final token = loginVM.accessToken;
    
    print('Chemistry List init - Access token: ${token != null ? 'Present' : 'Null'}');
    print('Chemistry List init - Current state: ${chemistryState.runtimeType}');
    
    if (token != null) {
      print('Chemistry List: Fetching chemistry tests...');
      ref.read(chemistryLabTestViewModelProvider.notifier).fetchChemistryLabTests(token);
    } else {
      print('Chemistry List: No access token available');
    }
  }

  @override
  Widget build(BuildContext context) {
    final chemistryState = ref.watch(chemistryLabTestViewModelProvider);
    print('Chemistry List build - State: ${chemistryState.runtimeType}');
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chemistry Tests'),
        backgroundColor: const Color(0xFF153846),
        foregroundColor: Colors.white,
      ),
      body: chemistryState.when(
        data: (tests) => tests.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.biotech, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text('No chemistry tests found', style: TextStyle(fontSize: 18)),
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
                      leading: const Icon(Icons.biotech, color: Color(0xFF153846)),
                      title: Text('Chemistry Test #${test.id}'),
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
                            builder: (_) => ChemistryDetailScreen(test: test),
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
                    ref.read(chemistryLabTestViewModelProvider.notifier).refreshChemistryLabTests(token);
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
