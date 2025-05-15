import 'package:quran/core/errors/error_strings/error_string.dart';

import 'failure/failure.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure():
      return ErrorString.serverFailure;
    case OfflineFailure():
      return ErrorString.offline;
    case LocationDisabledFailure():
      return ErrorString.pleaseEnableLoCation;
    case ApiPredictionFailure():
      return ErrorString.apiError;
    default:
      return "Unexpected Error , Please try again later .";
  }
}