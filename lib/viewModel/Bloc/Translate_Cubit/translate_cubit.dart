import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:translator/translator.dart';

part 'translate_state.dart';

class TranslateCubit extends Cubit<TranslateState> {
  TranslateCubit() : super(TranslateInitial());

  static TranslateCubit get(context) => BlocProvider.of(context);


  TextEditingController textWantToTrans = TextEditingController(text: "Enter Text?");

  String translatedText = "";

  GoogleTranslator translator = GoogleTranslator();

  Future<void>translateText({ required String from , required String toText })async{
      emit(TranslateTextLoadingState());
      String wantToTranslate = textWantToTrans.text;
      print("from : $from ..... to : $toText");
     await translator.translate( wantToTranslate , from: from , to: toText ).then((value){
         print(value);
         translatedText = value.toString();
         emit(TranslateTextSuccessState());
     }).catchError((error){
       emit(TranslateTextErrorState());
     });
  }


  void swapTranslatedText(){
    TextEditingController controllerHolder = TextEditingController(text: translatedText.toString());
    translatedText = textWantToTrans.text.toString();
    textWantToTrans.value = controllerHolder.value;
    emit(SwapTranslateTextState());
  }






}
