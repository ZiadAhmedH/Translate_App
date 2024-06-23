import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit() : super(InternetInitial());
  StreamSubscription? _subscription;

  static InternetCubit get(context) => BlocProvider.of(context);

  bool isConnected = false;

  void checkConnection(){
     _subscription = Connectivity().onConnectivityChanged.listen((result) {
       if(result[0] ==  ConnectivityResult.wifi){
         print(result.toString());
         isConnected = true;
         print(isConnected);
         emit(ConnectionIsONState());
       }
       else{
         print(result.toString());
         isConnected = false;
         print(isConnected);
         emit(ConnectionIsOFFState());
       }
    });
  }



}
