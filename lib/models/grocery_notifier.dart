import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'grocery_item.dart';

class GroceryNotifier extends StateNotifier<List<GroceryItem>> {
  GroceryNotifier() : super([]);

  static final provider =
      StateNotifierProvider<GroceryNotifier, List<GroceryItem>>(
          (ref) => GroceryNotifier());

  void delete(GroceryItem item) =>
      state = state.where((e) => e != item).toList();

  void add(GroceryItem item) => state = [...state, item];

  void update(GroceryItem item) =>
      state = state.map((e) => e.id == item.id ? item : e).toList();
}
