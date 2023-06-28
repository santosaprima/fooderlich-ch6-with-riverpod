import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';

class EmptyGroceryScreen extends ConsumerWidget {
  const EmptyGroceryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset(
                  'assets/fooderlich_assets/empty_list.png',
                ),
              ),
            ),
            Text(
              'No Groceries',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 16.0,
            ),
            const Text(
              'Shopping for ingredient?\nTap the + button to write them down!',
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.green,
              child: const Text(
                'Browse Recipes',
              ),
              onPressed: () {
                ref.read(TabNotifier.provider.notifier).goToRecipes();
              },
            ),
          ],
        ),
      ),
    );
  }
}
