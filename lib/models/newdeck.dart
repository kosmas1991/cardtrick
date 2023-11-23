class NewDeck {
  bool? success;
  String? deckId;
  int? remaining;
  bool? shuffled;

  NewDeck({this.success, this.deckId, this.remaining, this.shuffled});

  NewDeck.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    deckId = json['deck_id'];
    remaining = json['remaining'];
    shuffled = json['shuffled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['deck_id'] = this.deckId;
    data['remaining'] = this.remaining;
    data['shuffled'] = this.shuffled;
    return data;
  }
}
