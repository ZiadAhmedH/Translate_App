class SavedTModel{
  String? from;
  String? to;
  String?text;
  String?translatedText;
  String?uidTarns;

  SavedTModel.fromJason(Map<String,dynamic>json){
    from = json["from"];
    to = json["to"];
    text = json["textBefore"];
    translatedText = json["textAfter"];
    uidTarns = json["uiTrans"];
  }

}