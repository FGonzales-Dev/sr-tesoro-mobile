import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stmdc_patient_app/providers/viewmodel_providers.dart';

class ConsultationTab extends ConsumerStatefulWidget {
  const ConsultationTab({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsultationTab> createState() => _ConsultationTabState();
}

class _ConsultationTabState extends ConsumerState<ConsultationTab> {
  @override
  void initState() {
    super.initState();
    final loginVM = ref.read(loginViewModelProvider.notifier);
    final token = loginVM.accessToken;
    if (token != null) {
      ref.read(consultationViewModelProvider.notifier).fetchConsultations(token);
    }
  }

  @override
  Widget build(BuildContext context) {
    final consultationsState = ref.watch(consultationViewModelProvider);
    if (consultationsState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (consultationsState.hasError) {
      return const Center(child: Text('Failed to load consultations'));
    }
    final consultations = consultationsState.value ?? [];
    if (consultations.isEmpty) {
      return const Center(child: Text('No consultations found'));
    }
    return ListView.builder(
      itemCount: consultations.length,
      itemBuilder: (context, index) {
        final c = consultations[index];
        return Card(
          margin: const EdgeInsets.all(8),
          child: ListTile(
            title: Text(c.doctorName),
            subtitle: Text('Date: ${c.consultationDate}\nChief Complaint: ${c.chiefComplaint}'),
            isThreeLine: true,
          ),
        );
      },
    );
  }
}

