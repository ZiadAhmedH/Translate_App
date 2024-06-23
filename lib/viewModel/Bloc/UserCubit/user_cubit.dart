
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:translator_app/Model/models/savedTransModel.dart';

import '../../../../utils/Collection.dart';
import '../../Data/Local/SharedKeys.dart';
import '../../Data/Local/SharedPrefrence.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of(context);


  List<SavedTModel> translationHistory = [];


  Future<void> saveTranslatedToFire(
      {required String from, required to, required text, required translatedText}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference usersCollection = firestore.collection(Collection.users);

    DocumentReference userDoc = usersCollection.doc(LocalData.getData(key: SharedKey.token));
    DocumentReference newDocRef = userDoc.collection('History').doc();

    await newDocRef.set({
      'uiTrans': newDocRef.id,
      'from': from,
      'to': to,
      'textBefore': text,
      'textAfter': translatedText,
    });
    print(LocalData.getData(key: SharedKey.token));
    emit(StoreTranslationState());
  }


  Future<void> getUserShippingInfo() async {
    emit(LoadingHistoryTransState());
    await FirebaseFirestore.instance.collection(Collection.users).doc(
        LocalData.getData(key: SharedKey.token))
        .collection(Collection.history)
        .snapshots()
        .listen((value) {
      translationHistory.clear();
      for (var doc in value.docs) {
        translationHistory.add(SavedTModel.fromJason(doc.data()));
      }
      emit(SuccessHistoryTransState());
    });
    print(translationHistory);
  }


  Future<void> deleteTranslatedTextFromFire({required uidTrans})async{
    emit(LoadingDeleteTransState());

    try {
      await FirebaseFirestore.instance
          .collection(Collection.users)
          .doc(LocalData.getData(key: SharedKey.token))
          .collection(Collection.history)
          .doc(uidTrans)
          .delete();

      print("Translated Text Deleted");
      print(uidTrans);
      emit(SuccessDeletedTransState());
    } catch (error) {
      print("Failed to delete translated text: $error");
      emit(ErrorDeletedTransState());
    }

  }










}
