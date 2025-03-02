import 'package:arnhss/helpers/dailog_helper.dart';
import 'package:arnhss/services/base/exception/app_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HandleException {
  void handleException(error, {bool top = false}) {
    // print(error);
    if (error is BadRequestException) {
      var message = error.message;

      // print(error);
      DialogHelper.showErrorDialog(description: message, top: top);
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message, top: top);
    } else if (error is ApiNotRespondingException) {
      // var message = error.message;
      DialogHelper.showErrorDialog(
          description: "It took longer to respond.", top: top);
    } else if (error is FirebaseAuthException) {
      DialogHelper.showErrorDialog(
          description: error.code, title: "Oops 🥸", top: top);
    } else if (error is InvalidException) {
      DialogHelper.showErrorDialog(
          description: error.message, title: "Oops 🥸", top: top);
    } else {
      DialogHelper.showErrorDialog(
          description: "Something went wrong!", title: "Oops 🥸", top: top);
    }
  }
}
