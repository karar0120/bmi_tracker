import 'package:bmi_tracker/core/helper/spacing.dart';
import 'package:bmi_tracker/core/helper/strings_manger.dart';
import 'package:bmi_tracker/core/helper/values_manger.dart';
import 'package:bmi_tracker/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BmiHistoryCard extends StatelessWidget {
  const BmiHistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: const EdgeInsets.all(AppMargin.m8),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppPadding.p16.h, horizontal: AppPadding.p16.w),
        child: Row(
          children: [
            horizontalSpace(AppSize.s16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        AppString.date,
                        style: TextStyles.font16WhiteSemiBold,
                      ),
                      horizontalSpace(AppSize.s8),
                      Expanded(
                          child: Text(
                        '12/12/2022',
                        style: TextStyles.font14LightGrayRegular,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ))
                    ],
                  ),
                  verticalSpace(AppSize.s12),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              AppString.height,
                              style: TextStyles.font16WhiteSemiBold,
                            ),
                            horizontalSpace(AppSize.s8),
                            Expanded(
                                child: Text(
                              '170',
                              style: TextStyles.font14LightGrayRegular,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              AppString.weight,
                              style: TextStyles.font16WhiteSemiBold,
                            ),
                            horizontalSpace(AppSize.s8),
                            Expanded(
                                child: Text(
                              '80Kg',
                              style: TextStyles.font14LightGrayRegular,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(AppSize.s12),
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              AppString.gender,
                              style: TextStyles.font16WhiteSemiBold,
                            ),
                            horizontalSpace(AppSize.s8),
                            Expanded(
                                child: Text(
                              'male',
                              style: TextStyles.font14LightGrayRegular,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ))
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              AppString.age,
                              style: TextStyles.font16WhiteSemiBold,
                            ),
                            horizontalSpace(AppSize.s8),
                            Expanded(
                                child: Text(
                              '25',
                              style: TextStyles.font14LightGrayRegular,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(AppSize.s12),
                  Row(
                    children: [
                      Text(
                        AppString.bmi,
                        style: TextStyles.font16WhiteSemiBold,
                      ),
                      horizontalSpace(AppSize.s8),
                      Expanded(
                          child: Text(
                        '37.2',
                        style: TextStyles.font14LightGrayRegular,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
