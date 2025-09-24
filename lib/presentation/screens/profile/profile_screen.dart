import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../providers/providers.dart';
import '../../../domain/entities/patient.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadPatientProfileIfNeeded();
    });
  }

  void _loadPatientProfileIfNeeded() {
    final patientState = ref.read(patientViewModelProvider);
    final loginVM = ref.read(loginViewModelProvider.notifier);
    final token = loginVM.accessToken;

    print('Profile Screen init - Access token: ${token != null ? 'Present' : 'Null'}');
    print('Profile Screen init - Current state: ${patientState.runtimeType}');
    print('Profile Screen init - Patient data: ${patientState.value}');

    // Always fetch if we have a token and no patient data
    if (token != null && patientState.value == null) {
      print('Profile Screen: Fetching patient profile...');
      ref.read(patientViewModelProvider.notifier).fetchPatientProfile(token);
    } else if (token == null) {
      print('Profile Screen: No access token available');
    } else {
      print('Profile Screen: Data already loaded, skipping fetch');
    }
  }

  @override
  Widget build(BuildContext context) {
    final patientState = ref.watch(patientViewModelProvider);
    print('Profile Screen build - State: ${patientState.runtimeType}');

    if (patientState.isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: const Color(0xFF153846),
          foregroundColor: Colors.white,
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16),
              Text('Loading profile...'),
            ],
          ),
        ),
      );
    }

    if (patientState.hasError) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: const Color(0xFF153846),
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              const Text('Failed to load profile'),
              const SizedBox(height: 8),
              Text('Error: ${patientState.error}'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final loginVM = ref.read(loginViewModelProvider.notifier);
                  final token = loginVM.accessToken;
                  if (token != null) {
                    ref.read(patientViewModelProvider.notifier).refreshPatientProfile(token);
                  }
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    final patient = patientState.value;
    if (patient == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          backgroundColor: const Color(0xFF153846),
          foregroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person_off, size: 48, color: Colors.grey),
              const SizedBox(height: 16),
              const Text('No profile data available'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final loginVM = ref.read(loginViewModelProvider.notifier);
                  final token = loginVM.accessToken;
                  if (token != null) {
                    print('Profile Screen: Debug fetch triggered');
                    ref.read(patientViewModelProvider.notifier).fetchPatientProfile(token);
                  }
                },
                child: const Text('Try Fetch Profile'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: const Color(0xFF153846),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              final loginVM = ref.read(loginViewModelProvider.notifier);
              final token = loginVM.accessToken;
              if (token != null) {
                print('Profile Screen: Manual refresh triggered');
                ref.read(patientViewModelProvider.notifier).fetchPatientProfile(token);
              } else {
                print('Profile Screen: No access token for refresh');
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Profile Picture
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: const Color(0xFF153846),
                      backgroundImage: patient.profilePictureUrl != null
                          ? CachedNetworkImageProvider(patient.profilePictureUrl!)
                          : null,
                      child: patient.profilePictureUrl == null
                          ? const Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.white,
                            )
                          : null,
                    ),
                    const SizedBox(height: 16),
                    
                    // Name
                    Text(
                      patient.fullName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF153846),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    
                    // Patient Account ID
                    Text(
                      'Patient ID: ${patient.patientAccountId}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    
                    // Affiliation
                    Text(
                      patient.affiliationDisplay,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Personal Information Section
            _buildSectionCard(
              title: 'Personal Information',
              icon: Icons.person,
              children: [
                _buildInfoRow('First Name', patient.firstName),
                _buildInfoRow('Middle Name', patient.middleName),
                _buildInfoRow('Last Name', patient.lastName),
                _buildInfoRow('Date of Birth', _formatDate(patient.dateOfBirth)),
                _buildInfoRow('Age', '${patient.age} years old'),
                _buildInfoRow('Gender', patient.gender),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Contact Information Section
            _buildSectionCard(
              title: 'Contact Information',
              icon: Icons.contact_phone,
              children: [
                _buildInfoRow('Email', patient.email),
                _buildInfoRow('Phone Number', patient.phoneNumber),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Military Information Section (if applicable)
            if (patient.militaryUnit.isNotEmpty || 
                patient.militaryRank.isNotEmpty || 
                patient.serialNumber.isNotEmpty)
              _buildSectionCard(
                title: 'Military Information',
                icon: Icons.military_tech,
                children: [
                  if (patient.militaryUnit.isNotEmpty)
                    _buildInfoRow('Military Unit', patient.militaryUnit),
                  if (patient.militaryRank.isNotEmpty)
                    _buildInfoRow('Military Rank', patient.militaryRank),
                  if (patient.serialNumber.isNotEmpty)
                    _buildInfoRow('Serial Number', patient.serialNumber),
                ],
              ),
            
            const SizedBox(height: 16),
            
            // Employment Information Section (if applicable)
            if (patient.department.isNotEmpty || patient.position.isNotEmpty)
              _buildSectionCard(
                title: 'Employment Information',
                icon: Icons.work,
                children: [
                  if (patient.department.isNotEmpty)
                    _buildInfoRow('Department', patient.department),
                  if (patient.position.isNotEmpty)
                    _buildInfoRow('Position', patient.position),
                ],
              ),
            
            const SizedBox(height: 16),
            
            // Account Information Section
            _buildSectionCard(
              title: 'Account Information',
              icon: Icons.account_circle,
              children: [
                _buildInfoRow('Account Created', _formatDate(patient.createdAt)),
                _buildInfoRow('Last Updated', _formatDate(patient.updatedAt)),
              ],
            ),
            
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: const Color(0xFF153846),
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF153846),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              '$label:',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
