import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/failure/failure.dart';
import 'package:quran/features/prayer_time/domain/entity/prayer_time_entity.dart';

abstract class PrayerTimeRepo {
  Future<Either<Failure,PrayerTimeEntity>>getPrayerTime();
}