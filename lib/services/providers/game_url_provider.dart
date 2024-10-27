import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameUrlNotifier extends StateNotifier<String> {
  GameUrlNotifier() : super("");

  void updateString(String newString) {
    state = newString;
  }
}

final gameUrlNotifierProvider =
    StateNotifierProvider<GameUrlNotifier, String>((ref) {
  return GameUrlNotifier();
});
