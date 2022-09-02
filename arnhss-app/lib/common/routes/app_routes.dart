import 'package:arnhss/features/authentication/account/view/select_account.dart';
import 'package:arnhss/features/authentication/login/view/login.dart';
import 'package:arnhss/features/authentication/login/widgets/country_select.dart';
import 'package:arnhss/features/authentication/otp_verification/view/otp_verify_view.dart';
import 'package:arnhss/features/authentication/user_role/views/user_role.dart';
import 'package:arnhss/features/home/model/notice_model.dart';
import 'package:arnhss/features/home/view/home_view.dart';
import 'package:arnhss/features/home/view/notice_veiw.dart';
import 'package:arnhss/features/onboarding/view/onboarding_view.dart';
import 'package:arnhss/features/splash/views/splash_view.dart';
import 'package:arnhss/features/users/students/authentication/view/student_authentication.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case OnboardingView.routeName:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case SplashView.routeName:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case LoginView.routeName:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case OtpVerificationView.routeName:
        return MaterialPageRoute(builder: (_) => const OtpVerificationView());
      case CountrySelect.routeName:
        return MaterialPageRoute(builder: (_) => CountrySelect());
      case UserRole.routeName:
        return MaterialPageRoute(builder: (_) => const UserRole());
      case StudentAuthentication.routeName:
        return MaterialPageRoute(builder: (_) => const StudentAuthentication());
      case SelectAccount.routeName:
        return MaterialPageRoute(builder: (_) => const SelectAccount());
      case HomeView.routeName:
        return MaterialPageRoute(builder: (_) => HomeView());
      case NoticeView.routeName:
        final NoticeModel args = settings.arguments as NoticeModel;
        return MaterialPageRoute(
          builder: (_) => NoticeView(
            notice: args,
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
