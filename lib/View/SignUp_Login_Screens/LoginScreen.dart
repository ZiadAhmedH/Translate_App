import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:translator_app/Model/Custom/TextFormFeildC.dart';
import 'package:translator_app/View/HomeScreen/HomeScreen.dart';
import 'package:translator_app/View/SignUp_Login_Screens/Sections/addAccountSection.dart';
import 'package:translator_app/utils/AppColors.dart';
import 'package:translator_app/utils/Constant.dart';
import '../../Model/Custom/Custom_Btn.dart';
import '../../viewModel/Bloc/AuthCubit/auth_cubit.dart';
import '../../viewModel/Bloc/InternetCheck/internet_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var authCubit = AuthCubit.get(context);
    var interCubit = InternetCubit.get(context);
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ListView(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 9,
            ),
            Form(
              key: authCubit.loginKey,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    SizedBox(
                        width: double.infinity,
                        child: SvgPicture.asset(
                          Constant.googleTrans_icon,
                          height: MediaQuery.of(context).size.height / 8,
                        )),
                    SizedBox(
                      height: 30.h,
                    ),

                    //email feild
                    CustomTextFieldC(
                      hintText: "Email",
                      controller: authCubit.loginEmail,
                      borderColor: AppColor.lightBlue,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        String emailPattern =
                            r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$';
                        RegExp regex = RegExp(emailPattern);
                        if (!regex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    //password Feild
                    CustomTextFieldC(
                      hintText: "Password",
                      obscureText: authCubit.isVisible,
                      controller: authCubit.loginPassword,
                      suffixIcon: IconButton(
                        icon: FaIcon(
                          authCubit.isVisible
                              ? FontAwesomeIcons.eyeLowVision
                              : FontAwesomeIcons.solidEye,
                          color: AppColor.grey,
                        ),
                        onPressed: () => authCubit.showPassword(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 8) {
                          return 'Password must have at least 8 characters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    // login Button
                    CustomButton(
                      onTap: () {
                        if (authCubit.loginKey.currentState!.validate() &&
                            interCubit.isConnected) {
                          authCubit.loginWithFirebase().then((value) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ));
                          }).catchError((error) {
                            Fluttertoast.showToast(
                                msg: "Invalid Password Or Email",
                                backgroundColor: AppColor.Red);
                          });
                        }
                      },
                      text: "Login",
                      color: AppColor.lightBlue,
                      btnHeight: MediaQuery.of(context).size.height / 11,
                      textColor: AppColor.lightBlack,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const AddAccountSection()
                  ],
                ),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
