import 'package:playing_cards/playing_cards.dart';

List<PlayingCard> getDeck21(List<PlayingCard> deck) {
  deck.shuffle();
  List<PlayingCard> deck21 = [...deck.take(21)];
  return deck21;
}
