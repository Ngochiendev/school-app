import 'package:arnhss/common/constants/app_sizes.dart';
import 'package:arnhss/common/constants/image_constant.dart';
import 'package:arnhss/common/theme/text_theme.dart';
import 'package:arnhss/features/authentication/login/view/index.dart';
import 'package:arnhss/features/authentication/otp_verification/widgets/user_card_rule.dart';
import 'package:arnhss/features/users/students/authentication/view/student_authentication.dart';

class UserCardList extends StatelessWidget {
  const UserCardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.defualt_padding + 2),
      height: context.getHeight(40),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 5),
          Text(
            "Select Your Account",
            style: CustomTextTheme(context: context)
                .headLine()
                .copyWith(fontSize: 20),
          ),
          context.spacing(height: 3),
          UserRuleCard(
            title: "Student",
            icon: Images.studentRoleIcon,
            onTap: () => Navigator.pushNamed(
              context,
              StudentAuthentication.routeName,
            ),
          ),
          const UserRuleCard(title: "Teacher", icon: Images.teacherRoleIcon),
          const UserRuleCard(title: "parent", icon: Images.parentRoleIcon),
        ],
      ),
    );
  }
}
