part of 'current21_deck_cubit.dart';

class Current21DeckState extends Equatable {
  final List<PlayingCard> list;

  Current21DeckState({required this.list});

  factory Current21DeckState.initial() {
    List<PlayingCard> list = getDeck21(standardFiftyTwoCardDeck());
    return Current21DeckState(list: list);
  }

  @override
  List<Object> get props => [list];

  Current21DeckState copyWith({
    List<PlayingCard>? list,
  }) {
    return Current21DeckState(
      list: list ?? this.list,
    );
  }

  @override
  bool get stringify => true;
}
