part of 'user_cubit.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}



// Store translation State
class StoreTranslationState extends UserState{}


// History of Translated Text
class LoadingHistoryTransState extends UserState{}
class SuccessHistoryTransState extends UserState{}
class ErrorHistoryTransState extends UserState{}



// History of Translated Text
class LoadingDeleteTransState extends UserState{}
class SuccessDeletedTransState extends UserState{}
class ErrorDeletedTransState extends UserState{}





