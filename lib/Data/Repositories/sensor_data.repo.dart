//t2 Core Packages Imports
//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports
import '../../core/Providers/FB RTDB/fbrtdb_repo.dart';
import '../Model/sensor_data.dart';

class SensorDataRepo extends RTDBRepo<SensorData> {
  SensorDataRepo()
      : super(
          path: "Devices",
          discardKey: false,
        );

  @override
  SensorData? toModel(Object? data) {
    return SensorData.fromMap((data as Map<Object?, Object?>?)
            ?.map((key, value) => MapEntry(key.toString(), value)) ??
        {});
  }

  @override
  Map<String, dynamic>? fromModel(SensorData? item) => item?.toMap() ?? {};
}
