import 'package:bmi_tracker/core/helper/extensions.dart';
import 'package:bmi_tracker/core/helper/spacing.dart';
import 'package:bmi_tracker/core/helper/strings_manger.dart';
import 'package:bmi_tracker/core/helper/values_manger.dart';
import 'package:bmi_tracker/core/routing/routes.dart';
import 'package:bmi_tracker/core/theming/styles.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  Widget buildDrawer(context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
              AppPadding.p70, AppPadding.p10, AppPadding.p70, AppPadding.p10),
          decoration:
              BoxDecoration(shape: BoxShape.rectangle, color: Colors.blue[100]),
          child: Image.asset(
            'assets/images/bmi.webp',
            fit: BoxFit.cover,
          ),
        ),
        Text('Bmi Calculator', style: TextStyles.font14GrayRegular),
        verticalSpace(AppSize.s3)
      ],
    );
  }

  Widget buildDrawerListItem({
    Color? color,
    required IconData leadingIcon,
    required String title,
    Widget? trailing,
    Function()? onTap,
  }) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        color: color ?? Colors.blue,
      ),
      title: Text(title),
      trailing: trailing ??= const Icon(
        Icons.arrow_right,
        color: Colors.blue,
      ),
      onTap: onTap,
    );
  }

  Widget buildDrawerListItemsDivider() {
    return const Divider(
      height: AppSize.s0,
      thickness: AppSize.s1,
      indent: AppSize.s18,
      endIndent: AppSize.s24,
    );
  }

  Widget buildIcon(
    IconData icon,
  ) {
    return Icon(
      icon,
      color: Colors.blue,
      size: AppSize.s35,
    );
  }

  Widget buildLogoutBlocProvider(context) {
    return buildDrawerListItem(
        color: Colors.red,
        trailing: const SizedBox(),
        leadingIcon: Icons.logout,
        title: AppString.logOut,
        onTap: () async {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: AppSize.s280,
          child: DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue[100]),
            child: buildDrawer(context),
          ),
        ),
        buildDrawerListItem(
            leadingIcon: Icons.history,
            title: AppString.bmiHistory,
            onTap: () {
              context.pop();
              context.pushNamed(Routes.historyBmi);
            }),
        buildDrawerListItemsDivider(),
        buildDrawerListItem(
            leadingIcon: Icons.settings,
            title: AppString.settings,
            onTap: () {}),
        buildDrawerListItemsDivider(),
        buildDrawerListItem(
            leadingIcon: Icons.help, title: AppString.help, onTap: () {}),
        buildLogoutBlocProvider(context),
      ],
    ));
  }
}
