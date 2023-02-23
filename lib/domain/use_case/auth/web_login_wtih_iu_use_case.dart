import 'dart:async';

import 'package:get/get.dart';
import '../../../common/constants.dart';
import '../../../model/models/resource.dart';
import '../../../model/models/tokens.dart';
import 'dart:html' as html;
import '../../../model/repository/auth_repository.dart';

class WebLoginWithIUUseCase {
  const WebLoginWithIUUseCase._();

  static Future<Resource<Token>> invoke() async {
    html.WindowBase? popupWin;
    AuthRepository authRepo = Get.find();
    Completer<Resource<Token>> completer = Completer();

    popupWin = html.window.open(
      authorizationUri,
      "Innopolis University",
      "width=800, height=900, scrollbars=yes",
    );

    void login(String data) async {
      /// Parse data into an Uri to extract the token easily.
      final responseUrl = Uri.parse(data);
      var code = responseUrl.queryParameters["code"];

      var result = await authRepo.loginWithIU(code: code!);

      /// Close the popup window
      if (popupWin != null) {
        popupWin.close();
      }

      if (result is Success) {
        completer.complete(Success(successData: result.data!));
      }

      completer.complete(
        Fail(errorMessage: "Could not login with UI. back-end error"),
      );
    }

    html.window.onMessage.listen((event) async {
      if (event.data.toString().contains('code=')) {
        login(event.data);
      } else {
        completer.complete(Fail(errorMessage: "Did not receive code from UI"));
      }
    });

    return completer.future;
  }
}
