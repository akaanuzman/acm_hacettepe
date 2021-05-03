part of 'task_service.dart';

enum _TaskServiceEndPoints { DOGS }

extension TaskServiceEndPointsExtension on _TaskServiceEndPoints {
  String get rawValue {
    switch (this) {
      case _TaskServiceEndPoints.DOGS:
        return '/dogs';
    }
  }
}
