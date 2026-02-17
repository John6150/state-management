import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:state_management/main.dart';

class NewRoute extends StatefulWidget {
  const NewRoute({super.key});
  @override
  State<NewRoute> createState() => _NewRouteState();
}

class _NewRouteState extends State<NewRoute> {
  @override
  Widget build(BuildContext context) {
    print(x);

    // ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('New Route'),
      ),
      body: Consumer(
        builder: (context, ref, child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Welcome to the new route'),
              Text(
                ref.watch(x).toString(),
                // '${ref.watch(counterProvider)}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Consumer(
        builder: (context, ref, child) => FloatingActionButton(
          onPressed: () {
            ref.watch(profileVMProvider).checkState;
            ref.read(profileVMProvider).setState = 'Hello Lagos';
            ref.watch(profileVMProvider).checkState;

            // ref.read(x.notifier).state++;
            // setState(() {
            //   // x += 1;
            // });
            // ref.read(counterProvider.notifier).state += 45;
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class ProfileNotifier extends StateNotifier<String> {
  ProfileNotifier() : super('Hello world');

  void get checkState => print(state);
  set setState(String text) => state = text;
}

final profileVMProvider = Provider<ProfileNotifier>((ref) {
  return ProfileNotifier();
});
