import 'package:arcibo/data/datasource/remote/base_api_client.dart';

class RemoteDataSource {
  const RemoteDataSource({
    required this.apiClient,
  });

  final BaseApiClient apiClient;
}