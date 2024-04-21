import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());

  String gender = "MALE";
  int weight = 50;
  int age = 25;
  double height = 100.0;
  String bmi = "";
  double tempBMI = 0.0;
  String bmiStatus = "";
  Color colorStattus = const Color(0xff246AFE);

  void changeGender(String value) {
    gender = value;
    emit(BmiChangeGender());
  }

  void incWeight() {
    ++weight;
    emit(BmiIncWight());
  }

  void deceWeight() {
    weight--;
    emit(BmiDecWight());
  }

  void changeHeight(dynamic value) {
    height = value;
    emit(BmiChangeHeight());
  }

  void decAge() {
    age--;
    emit(BmiDecAge());
  }

  void incAge() {
    age++;
    emit(BmiIncAge());
  }

  void calculatBMI() {
    var heightMeter = height / 100;
    tempBMI = weight / (heightMeter * heightMeter);
    bmi = tempBMI.toStringAsFixed(1);
    tempBMI = double.parse(bmi);
    findStatus();
    addBmiDetailsToFirestore();
    print(bmi);
  }

  void findStatus() {
    if (tempBMI < 18.5) {
      bmiStatus = "UnderWeight";
      colorStattus = const Color(0xffFFB800);
    }
    if (tempBMI > 18.5 && tempBMI < 24.9) {
      bmiStatus = "Normal";
      colorStattus = const Color(0xff00CA39);
    }
    if (tempBMI > 25.0 && tempBMI < 29.9) {
      bmiStatus = "OverWeight";
      colorStattus = const Color(0xffFF5858);
    }
    if (tempBMI > 30.0 && tempBMI < 34.9) {
      bmiStatus = "OBESE";
      colorStattus = const Color(0xffFF0000);
    }
    if (tempBMI > 35.0) {
      bmiStatus = "Extremely OBESE";

      colorStattus = const Color(0xff000000);
    }
  }

  void addBmiDetailsToFirestore() async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        // Handle if the user is not signed in
        return;
      }

      // Get the user's UID
      String uid = user.uid;

      // Create a map containing BMI details
      Map<String, dynamic> bmiDetails = {
        'height': height,
        'weight': weight,
        'date': DateTime.now(),
        'age': age,
        'gender': gender,
      };

      // Add BMI details to Firestore
      await FirebaseFirestore.instance
          .collection('users') // Collection name
          .doc(uid) // Document ID is the user's UID
          .collection('bmiDetails') // Subcollection for BMI details
          .add(bmiDetails); // Add BMI details to Firestore
    } catch (e) {
      print('Error adding BMI details: $e');
      // Handle any errors that occur during the process
    }
  }

  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<List<Map<String, dynamic>>> getAllBMIDetails() async {
  //   try {
  //     final QuerySnapshot querySnapshot = await _firestore
  //         .collection('users/q4otwQrEJmeKWBOri639EAu2Upf1/bmiDetails')
  //         .orderBy('date')
  //         .limit(2)
  //         .get();

  //     List<Map<String, dynamic>> bmiDetailsList = [];

  //     for (var doc in querySnapshot.docs) {
  //       bmiDetailsList.add(doc.data() as Map<String, dynamic>);
  //     }
  //     print(bmiDetailsList);
  //     return bmiDetailsList;
  //   } catch (e) {
  //     print('Error retrieving BMI details: $e');
  //     rethrow; // Handle the error as per your app's requirements
  //   }
  // }
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getPaginatedBMIDetails(int pageSize,
      {DocumentSnapshot? startAfterDoc}) async {
    try {
      User user = FirebaseAuth.instance.currentUser!;

      // Get the user's UID
      String uid = user.uid;
      Query query =
          _firestore.collection('users/$uid/bmiDetails').limit(pageSize);

      if (startAfterDoc != null) {
        query = query.startAfterDocument(startAfterDoc);
      }

      QuerySnapshot querySnapshot = await query.get();

      List<Map<String, dynamic>> bmiDetailsList = [];

      print(bmiDetailsList);

      for (var doc in querySnapshot.docs) {
        bmiDetailsList.add(doc.data() as Map<String, dynamic>);
      }

      return bmiDetailsList;
    } catch (e) {
      print('Error retrieving paginated BMI details: $e');
      rethrow; // Handle the error as per your app's requirements
    }
  }
}
