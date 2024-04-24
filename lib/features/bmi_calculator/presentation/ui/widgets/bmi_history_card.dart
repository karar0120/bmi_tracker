import 'package:bmi_tracker/core/helper/spacing.dart';
import 'package:bmi_tracker/core/helper/strings_manger.dart';
import 'package:bmi_tracker/core/helper/values_manger.dart';
import 'package:bmi_tracker/core/theming/styles.dart';
import 'package:bmi_tracker/features/bmi_calculator/data/models/bmi_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BmiHistoryCard extends StatelessWidget {
  final BmiResponse bmiResponse;
  const BmiHistoryCard({super.key, required this.bmiResponse});

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
                              "${bmiResponse.height!.toStringAsFixed(1)}/cm",
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
                              '${bmiResponse.weight}/kg',
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
                              bmiResponse.gender ?? 'male',
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
                              '${bmiResponse.age}',
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
                        bmiResponse.bmiStatus ?? '',
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
