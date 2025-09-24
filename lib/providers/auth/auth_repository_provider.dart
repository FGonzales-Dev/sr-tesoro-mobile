import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories_impl/auth_repository_impl.dart';
import 'auth_data_source_provider.dart';

final authRepositoryProvider = Provider<AuthRepositoryImpl>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remoteDataSource);
});
