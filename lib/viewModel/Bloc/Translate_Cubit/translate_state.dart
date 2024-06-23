part of 'translate_cubit.dart';

@immutable
abstract class TranslateState {}

class TranslateInitial extends TranslateState {}


// Translate State .....
class TranslateTextLoadingState extends TranslateState {}
class TranslateTextSuccessState extends TranslateState {}
class TranslateTextErrorState extends TranslateState {}



// Swap Text

class SwapTranslateTextState extends TranslateState {}

