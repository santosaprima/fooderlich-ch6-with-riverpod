import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/grocery_tile.dart';
import '../models/grocery_notifier.dart';
import 'grocery_item_screen.dart';

class GroceryListScreen extends ConsumerWidget {
  const GroceryListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groceryNotifier = ref.watch(GroceryNotifier.provider.notifier);
    final groceryItems = ref.watch(GroceryNotifier.provider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
        itemBuilder: (context, index) {
          final item = groceryItems[index];
          return Dismissible(
            key: Key(item.id),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.delete_forever,
                color: Colors.white,
                size: 50.0,
              ),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                groceryNotifier.delete(item);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${item.name} dismissed'),
                  ),
                );
              }
            },
            child: InkWell(
              child: GroceryTile(
                key: Key(item.id),
                item: item,
                onComplete: (isComplete) {
                  if (isComplete != null) {
                    final updatedItem = item.copyWith(isComplete: isComplete);
                    groceryNotifier.update(updatedItem);
                  }
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GroceryItemScreen(
                      originalItem: item,
                      onCreate: (item) {},
                      onUpdate: (item) {
                        groceryNotifier.update(item);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16.0);
        },
        itemCount: groceryItems.length,
      ),
    );
  }
}
