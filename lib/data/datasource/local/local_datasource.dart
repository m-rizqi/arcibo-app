import 'package:arcibo/data/service/base_hive_service.dart';

class LocalDataSource {
  const LocalDataSource({
    required this.hiveService,
  });

  final BaseHiveService hiveService;
}