import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/providers.dart';
import '../../../domain/entities/ecg_record.dart';
import 'ecg_card.dart';

class EcgTab extends ConsumerStatefulWidget {
  const EcgTab({Key? key}) : super(key: key);

  @override
  ConsumerState<EcgTab> createState() => _EcgTabState();
}

class _EcgTabState extends ConsumerState<EcgTab> {
  @override
  void initState() {
    super.initState();
    // Only fetch data if not already loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadEcgDataIfNeeded();
    });
  }

  void _loadEcgDataIfNeeded() {
    final ecgState = ref.read(ecgViewModelProvider);
    final loginVM = ref.read(loginViewModelProvider.notifier);
    final token = loginVM.accessToken;
    
    print('ECG Tab init - Access token: ${token != null ? 'Present' : 'Null'}');
    print('ECG Tab init - Current state: ${ecgState.runtimeType}');
    
    // Only fetch if we don't have data and we have a token
    if (token != null && !ecgState.hasValue) {
      print('ECG Tab: Fetching ECG records...');
      ref.read(ecgViewModelProvider.notifier).fetchEcgRecords(token);
    } else if (token == null) {
      print('ECG Tab: No access token available');
    } else {
      print('ECG Tab: Data already loaded, skipping fetch');
    }
  }

  @override
  Widget build(BuildContext context) {
    final ecgState = ref.watch(ecgViewModelProvider);
    print('ECG Tab build - State: ${ecgState.runtimeType}');
    
    if (ecgState.isLoading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading ECG records...'),
          ],
        ),
      );
    }
    
    if (ecgState.hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 48, color: Colors.red),
            const SizedBox(height: 16),
            Text('Failed to load ECG records'),
            const SizedBox(height: 8),
            Text('Error: ${ecgState.error}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final loginVM = ref.read(loginViewModelProvider.notifier);
                final token = loginVM.accessToken;
                if (token != null) {
                  ref.read(ecgViewModelProvider.notifier).refreshEcgRecords(token);
                }
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }
    
    final records = ecgState.value ?? [];
    if (records.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 48, color: Colors.grey),
            SizedBox(height: 16),
            Text('No ECG records found'),
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: records.length,
      itemBuilder: (context, index) {
        final r = records[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: EcgCard(record: r),
        );
      },
    );
  }
}

