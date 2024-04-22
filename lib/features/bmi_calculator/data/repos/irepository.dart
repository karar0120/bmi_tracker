import 'package:bmi_tracker/core/helper/shared_preferences.dart';
import 'package:bmi_tracker/core/networking/api_error_handler.dart';
import 'package:bmi_tracker/core/networking/api_result.dart';
import 'package:bmi_tracker/core/networking/netwotk_info.dart';
import 'package:bmi_tracker/features/bmi_calculator/data/models/bmi_request.dart';
import 'package:bmi_tracker/features/bmi_calculator/data/models/bmi_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BmiRepo {
  final AppPreferences _appPreferences;
  final NetworkInfo _networkInfo;
  final FirebaseFirestore _firestore;
  BmiRepo(
    this._appPreferences,
    this._networkInfo,
    this._firestore,
  );

  Future<ApiResult<List<BmiResponse>>> getBmiMeasures() async {
    if (await _networkInfo.isConnected) {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        String? uid = user?.uid;
        DocumentSnapshot documentSnapshot;
        final QuerySnapshot querySnapshot = await _firestore
            .collection('users/$uid/bmiDetails')
            .orderBy('date')
            .limit(100)
            .get();

        List<BmiResponse> bmiDetailsList = [];

        for (var doc in querySnapshot.docs) {
          bmiDetailsList
              .add(BmiResponse.fromJson(doc.data() as Map<String, dynamic>));
        }
        print(bmiDetailsList[0].age);
        return ApiResult.success(bmiDetailsList);
      } catch (error) {
        return ApiResult.failure(ErrorHandler.handle(error));
      }
    } else {
      return ApiResult.failure(
          ErrorHandler.handle(DataSource.INTERNAL_SERVER_ERROR.getFailure()));
    }
  }

  Future<ApiResult<void>> addBmiMeasures(BmiRequestBody bmiRequestBody) async {
    if (await _networkInfo.isConnected) {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        String? uid = user?.uid;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('bmiDetails')
            .add(bmiRequestBody.toJson());
        return const ApiResult.success(null);
      } catch (error) {
        return ApiResult.failure(ErrorHandler.handle(error));
      }
    } else {
      return ApiResult.failure(
          ErrorHandler.handle(DataSource.INTERNAL_SERVER_ERROR.getFailure()));
    }
  }
}
