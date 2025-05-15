import 'package:dartz/dartz.dart';
import 'package:quran/core/errors/failure/failure.dart';
import 'package:quran/features/prayer_time/domain/entity/prayer_time_entity.dart';
import 'package:quran/features/prayer_time/domain/repo/prayer_time_repo.dart';

class GetPrayerTimeUseCase{
  final PrayerTimeRepo prayerTimeRepo;

  GetPrayerTimeUseCase({required this.prayerTimeRepo});

  Future<Either<Failure,PrayerTimeEntity>>call()async{
    return await prayerTimeRepo.getPrayerTime();
  }
}