import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meta/meta.dart';
import '../../../../utils/AppColors.dart';
import '../../../../utils/Collection.dart';
import '../../Data/Local/SharedKeys.dart';
import '../../Data/Local/SharedPrefrence.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  // Login Controllers
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPassword = TextEditingController();


  // Register Controllers
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  // isVisible
  bool isVisible = false;

  Future<void> loginWithFirebase()async{
    emit(LoadingLoginState());
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: loginEmail.text, password: loginPassword.text).then((value){
      print(value.user?.email);
      storeDataFirebase(value);
      Fluttertoast.showToast(
          msg: "Login Successfully", backgroundColor: AppColor.green);
      emit(SuccessLoginState());
      clearLoginControllerAndData();
    }).catchError((error){
      Fluttertoast.showToast(
          msg: error, backgroundColor: AppColor.Red);
      emit(ErrorLoginState());
    });


  }
  Future<void> registerWithFirebase()async{
    emit(LoadingSignUpState());
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text).then((value){
      value.user?.updateDisplayName(userName.text);
      addUserToFireStore(value);
      Fluttertoast.showToast(
          msg: "SignUp Successfully", backgroundColor: AppColor.green);
      emit(SuccessSignUpState());
      clearRegisterControllers();
    }).catchError((error){
      Fluttertoast.showToast(
          msg: error.toString(), backgroundColor: AppColor.Red);
      emit(ErrorLSignUpState());
    });
  }


  Future<void> signOut()async {
    emit(LoadingLoginState());
    await FirebaseAuth.instance.signOut().then((value){
       Fluttertoast.showToast(msg: "Sign Out Successfully" , backgroundColor: AppColor.green);
    });
  }


  void storeDataFirebase(UserCredential value) {
    print("Using StoreDataFirebase");
    LocalData.setData(key: SharedKey.token, value: value.user?.uid);
    LocalData.setData(key: SharedKey.email, value: value.user?.email);
    LocalData.setData(key: SharedKey.userName, value: value.user?.displayName);



    print(LocalData.getData(key: SharedKey.token));
    print(LocalData.getData(key: SharedKey.userName));
  }



  Future<void> addUserToFireStore(UserCredential userCredential) async {
    await FirebaseFirestore.instance.collection(Collection.users).doc(
        userCredential.user?.uid).set({
      "email": email.text,
      "name": userName.text,
      "uid": userCredential.user?.uid
    });
  }



  void showPassword(){
      isVisible = !isVisible;
      emit(ShowPasswordState());
  }



  void clearLoginControllerAndData() {
    loginEmail.clear();
    loginPassword.clear();
  }
  void clearRegisterControllers() {
    userName.clear();
    password.clear();
    email.clear();
  }



}




