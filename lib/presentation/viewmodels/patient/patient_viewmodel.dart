import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/patient.dart';
import '../../../domain/usecases/get_patient_profile_usecase.dart';

class PatientViewModel extends StateNotifier<AsyncValue<Patient?>> {
  final GetPatientProfileUseCase useCase;

  PatientViewModel(this.useCase) : super(const AsyncValue.data(null));

  Future<void> fetchPatientProfile(String accessToken) async {
    print('PatientViewModel: fetchPatientProfile called with token: ${accessToken.substring(0, 10)}...');
    state = const AsyncValue.loading();
    try {
      final patient = await useCase.call(accessToken);
      print('PatientViewModel: Patient profile loaded successfully: ${patient.fullName}');
      print('PatientViewModel: Patient ID: ${patient.patientAccountId}');
      state = AsyncValue.data(patient);
    } catch (e, st) {
      print('PatientViewModel: Error fetching patient profile: $e');
      print('PatientViewModel: Stack trace: $st');
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refreshPatientProfile(String accessToken) async {
    state = const AsyncValue.loading();
    try {
      final patient = await useCase.call(accessToken);
      state = AsyncValue.data(patient);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
