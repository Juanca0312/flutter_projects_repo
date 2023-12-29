enum FromWho { me, hers }

class Message {
  final String text;
  final String? messageUrl;
  final FromWho fromWho;

  Message({
    required this.text,
    this.messageUrl,
    required this.fromWho,
  });
}
