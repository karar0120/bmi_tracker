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

  Future<ApiResult<List<BmiResponse>>> getBmiMeasures(int page) async {
    if (await _networkInfo.isConnected) {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        String? uid = user?.uid;
        DocumentSnapshot? documentSnapshot;
        QuerySnapshot querySnapshot;
        if (page == 1) {
          querySnapshot = await _firestore
              .collection('users/$uid/bmiDetails')
              .orderBy('dateTime')
              .limit(10)
              .get();

          documentSnapshot =
              querySnapshot.docs.isNotEmpty ? querySnapshot.docs.last : null;
        } else {
          querySnapshot = await _firestore
              .collection('users/$uid/bmiDetails')
              .orderBy('dateTime')
              .startAfterDocument(documentSnapshot!)
              .limit(10)
              .get();
        }
        documentSnapshot =
            querySnapshot.docs.isNotEmpty ? querySnapshot.docs.last : null;

        List<BmiResponse> bmiDetailsList = [];

        for (var doc in querySnapshot.docs) {
          bmiDetailsList.add(
              BmiResponse.fromJson(doc.data() as Map<String, dynamic>, doc.id));
        }
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

  Future<ApiResult<void>> deleteBmiMeasures(String id) async {
    if (await _networkInfo.isConnected) {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        String? uid = user?.uid;
        DocumentReference documentReference = FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('bmiDetails')
            .doc(id);

        await documentReference.delete();
        return const ApiResult.success(null);
      } catch (error) {
        return ApiResult.failure(ErrorHandler.handle(error));
      }
    } else {
      return ApiResult.failure(
          ErrorHandler.handle(DataSource.INTERNAL_SERVER_ERROR.getFailure()));
    }
  }

  Future<ApiResult<void>> updateBmiMeasures(
      String id, BmiRequestBody bmiRequestBody) async {
    if (await _networkInfo.isConnected) {
      try {
        User? user = FirebaseAuth.instance.currentUser;
        String? uid = user?.uid;
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .collection('bmiDetails')
            .doc(id)
            .update(bmiRequestBody.toJson());
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
