import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../providers/providers.dart';
import '../../../../domain/entities/xray.dart';
import 'xray_detail_screen.dart';

class XrayListScreen extends ConsumerStatefulWidget {
  const XrayListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<XrayListScreen> createState() => _XrayListScreenState();
}

class _XrayListScreenState extends ConsumerState<XrayListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadXrayDataIfNeeded();
    });
  }

  void _loadXrayDataIfNeeded() {
    final xrayState = ref.read(xrayViewModelProvider);
    final loginVM = ref.read(loginViewModelProvider.notifier);
    final token = loginVM.accessToken;
    
    print('Xray List init - Access token: ${token != null ? 'Present' : 'Null'}');
    print('Xray List init - Current state: ${xrayState.runtimeType}');
    
    if (token != null) {
      print('Xray List: Fetching X-rays...');
      ref.read(xrayViewModelProvider.notifier).fetchXrays(token);
    } else {
      print('Xray List: No access token available');
    }
  }

  @override
  Widget build(BuildContext context) {
    final xrayState = ref.watch(xrayViewModelProvider);
    print('Xray List build - State: ${xrayState.runtimeType}');
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF153846),
        foregroundColor: Colors.white,
      ),
      body: xrayState.when(
        data: (xrays) => xrays.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.medical_services, size: 64, color: Colors.grey),
                    SizedBox(height: 16),
                    Text('No X-ray records found', style: TextStyle(fontSize: 18)),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: xrays.length,
                itemBuilder: (context, index) {
                  final xray = xrays[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: const Icon(Icons.medical_services, color: Color(0xFF153846)),
                      title: Text('X-ray #${xray.xrayNumber}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Type: ${xray.xrayTypeName}'),
                          Text('Doctor: ${xray.doctorName}'),
                          Text('Status: ${xray.status}'),
                          Text('Date: ${xray.createdAt.split('T')[0]}'),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => XrayDetailScreen(xray: xray),
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
                    ref.read(xrayViewModelProvider.notifier).refreshXrays(token);
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
