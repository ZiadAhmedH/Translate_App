import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:translator_app/View/DonatorScreen/DonatorScreen.dart';
import 'package:translator_app/viewModel/Bloc/AuthCubit/auth_cubit.dart';
import 'package:translator_app/viewModel/Bloc/BlocObserver.dart';
import 'package:translator_app/viewModel/Bloc/DonatorCubit/donator_cubit.dart';
import 'package:translator_app/viewModel/Bloc/InternetCheck/internet_cubit.dart';
import 'package:translator_app/viewModel/Bloc/LanguageCubit/language_cubit.dart';
import 'package:translator_app/viewModel/Bloc/Translate_Cubit/translate_cubit.dart';
import 'package:translator_app/viewModel/Bloc/UserCubit/user_cubit.dart';
import 'package:translator_app/viewModel/Data/Local/SharedKeys.dart';
import 'package:translator_app/viewModel/Data/Local/SharedPrefrence.dart';
import 'View/SplashScreen.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
   LocalData.init();
  print( LocalData.getData(key: SharedKey.userName));
   //LocalData.clearData();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => TranslateCubit(),),
            BlocProvider(create: (context) => LanguageCubit(),),
            BlocProvider(create: (context) => InternetCubit()..checkConnection(),),
            BlocProvider(create: (context) => AuthCubit(),),
            BlocProvider(create: (context) => UserCubit(),),
            BlocProvider(create: (context) => DonatorCubit(),),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            ),
            home: child,
          ),
        );
      },
      child: const DonatorScreen(),
    );
  }
}
