//t2 Core Packages Imports
//t2 Dependencies Imports
//t3 Services
//t3 Models
//t1 Exports
import '../../core/Providers/FB Firestore/fbfirestore_repo.dart';
import '../Model/report.dart';

class ReportRepo extends FirestoreRepo<Report> {
  ReportRepo()
      : super(
          'Reports',
        );

  @override
  Report? toModel(Map<String, dynamic>? item) => Report.fromMap(item ?? {});

  @override
  Map<String, dynamic>? fromModel(Report? item) => item?.toMap() ?? {};
}
