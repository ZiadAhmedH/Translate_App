
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial());
  static LanguageCubit get(context) => BlocProvider.of(context);


     String ?selectedLangToTrans = "English"  ;
     String ?selectedToTrans = "English" ;


     String from = "en";
     String to = "en";


  Map<String,String> languagesMap = {
  'English':'en',
  'Hindi':'hi',
  'Arabic	':'ar',
  'German':'de',
  'Russian':'ru',
  'Spanish':'es',
  'Urdu':'ur',
  'Japanese':'ja',
  'Italian':'it'
};

  void selectLanguage({required selectedLanguage}){
      selectedLangToTrans = selectedLanguage;
      from = languagesMap[selectedLanguage].toString();
      emit(LanguageSelectedState());
  }

  void selectLanguageToTrans({required selectedLanguage}){
    selectedToTrans = selectedLanguage;
    to = languagesMap[selectedLanguage].toString();
    emit(LanguageSelectedState());
  }


  void switchLanguages(){
    //Swap Selected Languages Text
    String languageHolder = selectedLangToTrans.toString() ;
    selectedLangToTrans = selectedToTrans;
    selectedToTrans = languageHolder;

    /// change from and to
    from = languagesMap[selectedLangToTrans].toString();
    to = languagesMap[selectedToTrans].toString();


    emit(SwapLanguageState());
  }

}
