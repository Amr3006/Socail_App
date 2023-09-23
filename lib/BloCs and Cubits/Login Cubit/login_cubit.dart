// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/Models/User%20Model.dart';
import 'package:social_app/Screens/homeLayout.dart';
import 'package:social_app/Shared/CacheHelper.dart';
import 'package:social_app/Shared/Components.dart';
import 'package:social_app/Shared/Variables%20and%20Constants.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(BuildContext context) => BlocProvider.of(context);

  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;

  bool obscurity=true;

  void changeObscurity() {
    obscurity=!obscurity;
    emit(changeObscurityState());
  }

  User? getUser()=>firebaseAuth.currentUser;

  void Login({
    required String email,
    required String password,
    required BuildContext context
}) {
    emit(loadingLoginState());
    firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((
        value) {
      emit(successLoginState());
      uId=value.user!.uid;
      cacheHelper.saveData(key: "uId",value: value.user!.uid).then((value) {
      navigateToAndErase(context: context, destination: const HomeLayout());
      });
    }).catchError((e) {
      emit(failedLoginState(e.toString()));
    });

  }


  void Register({
    required String email,
    required String password,
    required String phone,
    required String name,
    required BuildContext context
  }) {
    emit(loadingRegisterState());
    firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((
        value) {
          createUser(name: name, phone: phone, temp_uId: value.user!.uid, email: email, context: context);
    }).catchError((e) {
      emit(failedRegisterState(e.toString()));
    });

  }

  void createUser({
    required String name,
    required String phone,
    required String temp_uId,
    required String email,
    String bio="bio...",
    String profilePicture="https://t3.ftcdn.net/jpg/05/49/28/46/240_F_549284605_9OAjYHwTzGIV3NWXOPFHdsarQ99JEbOB.jpg",
    String coverPicture="https://t4.ftcdn.net/jpg/05/62/02/41/360_F_562024161_tGM4lFlnO0OczLYHFFuNNdMUTG9ekHxb.jpg",
    required BuildContext context
  }) {
    UserModel model = UserModel(name: name,email: email,phone: phone,uId: temp_uId,bio: bio,coverPicture: coverPicture,profilePicture: profilePicture);
     FirebaseFirestore
     .instance
     .collection("Users")
     .doc(temp_uId)
     .set(model.toJson())
     .then((value) {
      emit(successRegisterState());
      uId=temp_uId;
      cacheHelper.saveData(key: "uId",value: temp_uId).then((value) {
      navigateToAndErase(context: context, destination: const HomeLayout());
      });
     }).catchError((error) {
      emit(failedCreateUserState(error));
     });
  }
}
