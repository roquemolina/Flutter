// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

//import 'dart:convert';

//YesNoModel yesNoModelFromJson(String str) => YesNoModel.fromJson(json.decode(str));

//String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson());

import '../../domain/entities/message.dart';

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Map<String, dynamic> toJsonMap() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

    Message toMessageEntity() {
      return Message(
        text: answer == 'yes' ? 'yes!' : 'no :P',
        imageUrl: image,
        fromWho: FromWho.hers,
      );

    }
}