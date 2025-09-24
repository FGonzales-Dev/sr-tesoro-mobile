import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/providers.dart';
import '../../../../domain/entities/abo_blood_typing_lab_test.dart';
import 'abo_blood_typing_detail_screen.dart';

class AboBloodTypingListScreen extends ConsumerStatefulWidget {
  const AboBloodTypingListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AboBloodTypingListScreen> createState() => _AboBloodTypingListScreenState();
}

class _AboBloodTypingListScreenState extends ConsumerState<AboBloodTypingListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadAboBloodTypingDataIfNeeded();
    });
  }

  void _loadAboBloodTypingDataIfNeeded() {
    final aboBloodTypingState = ref.read(aboBloodTypingLabTestViewModelProvider);
    final loginVM = ref.read(loginViewModelProvider.notifier);
    final token = loginVM.accessToken;
    
    print('ABO Blood Typing List init - Access token: ${token != null ? 'Present' : 'Null'}');
    print('ABO Blood Typing List init - Current state: ${aboBloodTypingState.runtimeType}');
    
    if (token != null) {
      print('ABO Blood Typing List: Fetching ABO blood typing tests...');
      ref.read(aboBloodTypingLabTestViewModelProvider.notifier).fetchAboBloodTypingLabTests(token);
    } else {
      print('ABO Blood Typing List: No access token available');
    }
  }

  @override
  Widget build(BuildContext context) {
    final aboBloodTypingState = ref.watch(aboBloodTypingLabTestViewModelProvider);
    print('ABO Blood Typing List build - State: ${aboBloodTypingState.runtimeType}');
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('ABO Blood Typing Tests'),
        backgroundColor: const Color(0xFF153846),
        foregroundColor: Colors.white,
      ),
      body: aboBloodTypingState.when(
        data: (tests) => tests.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.bloodtype, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text('No ABO blood typing tests found', style: TextStyle(fontSize: 18)),
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
                      leading: const Icon(Icons.bloodtype, color: Color(0xFF153846)),
                      title: Text('ABO Blood Typing Test #${test.id}'),
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
                            builder: (_) => AboBloodTypingDetailScreen(test: test),
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
                    ref.read(aboBloodTypingLabTestViewModelProvider.notifier).refreshAboBloodTypingLabTests(token);
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
