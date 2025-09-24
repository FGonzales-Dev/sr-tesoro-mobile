import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/providers.dart';
import '../../../../domain/entities/ogtt_lab_test.dart';
import 'ogtt_detail_screen.dart';

class OgttListScreen extends ConsumerStatefulWidget {
  const OgttListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<OgttListScreen> createState() => _OgttListScreenState();
}

class _OgttListScreenState extends ConsumerState<OgttListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadOgttDataIfNeeded();
    });
  }

  void _loadOgttDataIfNeeded() {
    final ogttState = ref.read(ogttLabTestViewModelProvider);
    final loginVM = ref.read(loginViewModelProvider.notifier);
    final token = loginVM.accessToken;
    
    print('OGTT List init - Access token: ${token != null ? 'Present' : 'Null'}');
    print('OGTT List init - Current state: ${ogttState.runtimeType}');
    
    if (token != null) {
      print('OGTT List: Fetching OGTT tests...');
      ref.read(ogttLabTestViewModelProvider.notifier).fetchOgttLabTests(token);
    } else {
      print('OGTT List: No access token available');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ogttState = ref.watch(ogttLabTestViewModelProvider);
    print('OGTT List build - State: ${ogttState.runtimeType}');
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('OGTT Tests'),
        backgroundColor: const Color(0xFF153846),
        foregroundColor: Colors.white,
      ),
      body: ogttState.when(
        data: (tests) => tests.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_drink, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text('No OGTT tests found', style: TextStyle(fontSize: 18)),
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
                      leading: const Icon(Icons.local_drink, color: Color(0xFF153846)),
                      title: Text('OGTT Test #${test.id}'),
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
                            builder: (_) => OgttDetailScreen(test: test),
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
                    ref.read(ogttLabTestViewModelProvider.notifier).refreshOgttLabTests(token);
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
