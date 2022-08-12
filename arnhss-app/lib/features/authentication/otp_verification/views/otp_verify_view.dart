import 'package:arnhss/common/constants/color_constants.dart';
import 'package:arnhss/common/constants/image_constant.dart';
import 'package:arnhss/common/theme/text_theme.dart';
import 'package:arnhss/features/authentication/view_model/country_view_model.dart';
import 'package:arnhss/features/authentication/view_model/verify_otp_view_model.dart';
import 'package:arnhss/features/widgets/custom_app_bar.dart';
import 'package:arnhss/features/widgets/custom_button.dart';
import 'package:arnhss/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpVerificationView extends StatelessWidget {
  const OtpVerificationView({Key? key}) : super(key: key);
  static const routeName = "/verifyOtp";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: "Verification"),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            Image.asset(
              Images.otp_image,
            ),
            Text(
              "Check Your Message",
              style: CustomTextTheme(context: context).headLine(),
              textAlign: TextAlign.center,
            ),
            context.spacing(height: 2),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "We've sent 6 digit code to ",
                      style: CustomTextTheme(context: context).paragraph()),
                  TextSpan(
                    text:
                        " ${context.read<CountryViewModel>().selectedCountry.dialCode}9947018118 ",
                    style:
                        CustomTextTheme(context: context).paragraph().copyWith(
                              color: CustomColors.dark,
                              fontWeight: FontWeight.w500,
                            ),
                  ),
                  TextSpan(
                      text: "for verify your mobile number ",
                      style: CustomTextTheme(context: context).paragraph()),
                ],
              ),
            ),
            context.spacing(height: 4),
            OtpTextField(
              focusedBorderColor: CustomColors.dark,
              keyboardType: TextInputType.number,
              numberOfFields: 5,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              // margin: const EdgeInsets.only(right: 15),
              autoFocus: false,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  },
                );
              }, // end onSubmit
            ),
            context.spacing(height: 10),
            Text(
              "I Didn't receive the code! resend after 0:59 s",
              textAlign: TextAlign.center,
              style: CustomTextTheme(context: context).paragraph(),
            ),
            context.spacing(height: .8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.getWidth(25)),
              child: CustomButton(
                onTap: context.read<VerifyOtpViewModel>().resendTimer,
                label: "resend",
                color: Colors.transparent,
                textColor: CustomColors.dark,
                // width: 20,
                fontWeight: FontWeight.bold,
                height: 3,
              ),
            ),
            context.spacing(height: 2),
            CustomButton(
              label: "Verify OTP",
              onTap: () {
                int a = 10;
              },
            ),
          ],
        ),
      ),
    );
  }
}
