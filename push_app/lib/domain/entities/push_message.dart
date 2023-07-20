class PushMessage {
  final String messageId;
  final String body;
  final String title;
  final DateTime sentDate;
  final Map<String, dynamic>? data;
  final String? imageUrl;
  PushMessage(
      {required this.messageId,
      required this.body,
      required this.title,
      required this.sentDate,
      this.data,
      this.imageUrl});

  @override
  String toString() {
    return '''
PushMessage:-
messageId: $messageId
title: $title
sentDate: $sentDate
data: $data
imageUrl: $imageUrl
''';
  }
}
