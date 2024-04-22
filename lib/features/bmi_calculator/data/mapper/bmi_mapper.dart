// import 'package:bmi_tracker/core/helper/extensions.dart';
// import 'package:bmi_tracker/features/bmi_calculator/data/models/bmi_response.dart';
// import 'package:bmi_tracker/features/bmi_calculator/domain/entity/bmi.dart';

// extension BmiHistoryResponseMapper on BmiMeasuresResponse? {
//   BmiMeasures toDomain() {
//     return BmiMeasures(
//         bmiMeasures:
//             (this?.bmiMeasures?.map((bmiResponse) => bmiResponse.toDomain()) ??
//                     const Iterable.empty())
//                 .cast<Bmi>()
//                 .toList());
//   }
// }

// extension BmiResponseMapper on BmiResponse? {
//   BmiResponse toDomain() {
//     return BmiResponse(
//       id: this?.id.orZero() ?? 0,
//       age: this?.age.orZero() ?? 0,
//       gender: this?.gender.orEmpty() ?? '',
//       height: this?.height.orEmpty() ?? '',
//       wight: this?.wight.orEmpty() ?? '',
//       bmiStatus: this?.bmiStatus.orEmpty() ?? '',
//     );
//   }
// }
