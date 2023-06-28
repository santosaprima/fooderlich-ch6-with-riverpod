import 'package:flutter_riverpod/flutter_riverpod.dart';

class TabNotifier extends StateNotifier<int> {
  TabNotifier() : super(0);

  static final provider =
      StateNotifierProvider<TabNotifier, int>((ref) => TabNotifier());

  void goToTab(index) => state = index;

  void goToRecipes() => state = 1;
}
