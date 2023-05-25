import 'package:hive/hive.dart';

part 'todo_type.g.dart';

@HiveType(typeId: 0)
class ListElement {
  @HiveField(0)
  String title;

  @HiveField(1)
  DateTime deadline;

  @HiveField(2)
  int durationMinutes;

  @HiveField(3)
  late int timeLeftMinutes;

  ListElement({
    required this.title,
    required this.deadline,
    required this.durationMinutes,
  }) {
    timeLeftMinutes = deadline.difference(DateTime.now().toUtc()).inMinutes;
  }

  int calculatePriority() {
    return durationMinutes * timeLeftMinutes * timeLeftMinutes;
  }

  void updateTimeLeft() {
    timeLeftMinutes = deadline.difference(DateTime.now().toUtc()).inMinutes;
  }

  int comepareTo(ListElement other) {
    if (calculatePriority() < other.calculatePriority()) {
      return -1;
    } else if (calculatePriority() > other.calculatePriority()) {
      return 1;
    } else {
      return 0;
    }
  }

  String deadlineToString() {
    String year = deadline.year.toString();
    String month = deadline.month.toString().padLeft(2, '0');
    String day = deadline.day.toString().padLeft(2, '0');
    String hour = deadline.hour.toString().padLeft(2, '0');
    String minute = deadline.minute.toString().padLeft(2, '0');

    return "$year-$month-$day $hour:$minute";
  }

  String durationToString() {
    String hour = (durationMinutes ~/ 60).toString().padLeft(2, '0');
    String minute = (durationMinutes % 60).toString().padLeft(2, '0');

    return "$hour:$minute";
  }

  static int durationStringToInt(String durationString) {
    int hour = int.parse(durationString.split(":")[0]);
    int minute = int.parse(durationString.split(":")[1]);

    return hour * 60 + minute;
  }
}
