import 'package:bloc/bloc.dart';
import 'package:cardtrick/models/deck21.dart';
import 'package:equatable/equatable.dart';
import 'package:playing_cards/playing_cards.dart';

part 'current21_deck_state.dart';

class Current21DeckCubit extends Cubit<Current21DeckState> {
  Current21DeckCubit() : super(Current21DeckState.initial());

  emitNewDeck21(List<PlayingCard> newList) {
    emit(state.copyWith(list: newList));
  }

  shuffleDeck21() {
    state.list.shuffle();
    emit(state.copyWith(list: state.list));
  }

  leftButtonPressed() {
    List<PlayingCard> newList = [
      state.list.elementAt(19),
      state.list.elementAt(16),
      state.list.elementAt(13),
      state.list.elementAt(10),
      state.list.elementAt(7),
      state.list.elementAt(4),
      state.list.elementAt(1),
      state.list.elementAt(18),
      state.list.elementAt(15),
      state.list.elementAt(12),
      state.list.elementAt(9),
      state.list.elementAt(6),
      state.list.elementAt(3),
      state.list.elementAt(0),
      state.list.elementAt(20),
      state.list.elementAt(17),
      state.list.elementAt(14),
      state.list.elementAt(11),
      state.list.elementAt(8),
      state.list.elementAt(5),
      state.list.elementAt(2),
    ];
    emit(state.copyWith(list: newList));
  }

  middleButtonPressed() {
    List<PlayingCard> newList = [
      state.list.elementAt(18),
      state.list.elementAt(15),
      state.list.elementAt(12),
      state.list.elementAt(9),
      state.list.elementAt(6),
      state.list.elementAt(3),
      state.list.elementAt(0),
      state.list.elementAt(19),
      state.list.elementAt(16),
      state.list.elementAt(13),
      state.list.elementAt(10),
      state.list.elementAt(7),
      state.list.elementAt(4),
      state.list.elementAt(1),
      state.list.elementAt(20),
      state.list.elementAt(17),
      state.list.elementAt(14),
      state.list.elementAt(11),
      state.list.elementAt(8),
      state.list.elementAt(5),
      state.list.elementAt(2),
    ];
    emit(state.copyWith(list: newList));
  }

  rightButtonPressed() {
    List<PlayingCard> newList = [
      state.list.elementAt(19),
      state.list.elementAt(16),
      state.list.elementAt(13),
      state.list.elementAt(10),
      state.list.elementAt(7),
      state.list.elementAt(4),
      state.list.elementAt(1),
      state.list.elementAt(20),
      state.list.elementAt(17),
      state.list.elementAt(14),
      state.list.elementAt(11),
      state.list.elementAt(8),
      state.list.elementAt(5),
      state.list.elementAt(2),
      state.list.elementAt(18),
      state.list.elementAt(15),
      state.list.elementAt(12),
      state.list.elementAt(9),
      state.list.elementAt(6),
      state.list.elementAt(3),
      state.list.elementAt(0),
    ];
    emit(state.copyWith(list: newList));
  }
}
