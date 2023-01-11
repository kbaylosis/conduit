// ignore_for_file: avoid_catching_errors

import 'package:conduit_core/conduit_core.dart';
import 'package:test/test.dart';

class InvalidTransientModel extends ManagedObject<_InvalidTransientModel>
    implements _InvalidTransientModel {
  @Serialize()
  Uri? uri;
}

class _InvalidTransientModel {
  @primaryKey
  int? id;
}

void main() {
  test("Model with unsupported transient property type fails on compilation",
      () {
    try {
      ManagedDataModel([InvalidTransientModel]);
      expect(true, false);
    } on ManagedDataModelError catch (e) {
      expect(e.message, contains("'InvalidTransientModel'"));
      expect(e.message, contains("'uri'"));
      expect(e.message, contains("unsupported type"));
    }
  });
}