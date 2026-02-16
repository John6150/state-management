import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:state_management/new_route.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Reference denoted as ref is used to read and watch providers. It is available in the build method of ConsumerWidget and ConsumerStatefulWidget.`
    // providers are used to manage state in a Flutter application. They allow you to create and manage state that can be shared across different parts of your app. Providers can be used to manage simple state, such as a counter, or more complex state, such as user authentication or data fetching.
    // watch is used to listen to changes in a provider and rebuild the widget when the provider's state changes. It is typically used in the build method of a widget to ensure that the widget updates when the provider's state changes.
    // read is used to access the current value of a provider without listening for changes. It is typically used in event handlers or other places where you want to access the provider's state without triggering a rebuild of the widget.
    // Consumer

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {'/newRoute': (context) => NewRoute()},
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

// int x = 0;

StateProvider<int> x = StateProvider<int>((ref) => 0);

class _MyHomePageState extends ConsumerState<MyHomePage> {
  // String? name;
  @override
  void initState() {
    // TODO: implement initState
    // ref.read

    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   setState(() {
    //     x = 1;
    //   });
    // });

    Future.delayed(Duration.zero, () async {
      // ref.watch(counterProvider);
      // ref.read(x.notifier).state = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Rebuilding from here 002');
    // final username = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: AppSizes.maxHeight(context: context),
          // width: double.infinity * 0.5,
          width: MediaQuery.of(context).size.width / 1 / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Text('You have pushed the button this many times:'),
              Text(
                ref.watch(x).toString(),
                // '${ref.watch(counterProvider)}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              GestureDetector(
                onTap: () async {
                  // final name = await ref.watch(nameProvider);
                  // print(name);
                  Navigator.pushNamed(context, '/newRoute');
                },
                child: Text('Go to New Route'),
              ),

              // Consumer(builder: (context, ref, child) {

              //   return Text(x);
              // }),

              //
              // Container(
              //   child: username.when(
              //     data: (data) {
              //       return Text(data ?? 'No record');
              //     },
              //     error: (error, st) => Text('An error occurred'),
              //     loading: () => Text('Please wait...'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ref.read(counterProvider.notifier).state += 45;
          // setState(() {
          // x += 1;
          ref.read(x.notifier).state += 1;
          print(x);
          // });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

Future<String?> username() async {
  Future.delayed(Duration(seconds: 2), () {
    return 'John';
  });
  return 'Mohammed';
}

final nameProvider = FutureProvider<String?>((ref) {
  // Future.delayed(Duration(seconds: 5), () {
  //   return 'John';
  // });
  return username();
});

final getNameProvider = FutureProvider<String?>((ref) async {
  return username();
});

StateProvider<int> counterProvider = StateProvider<int>((ref) => 0);

// final counterProviders = Provider<int>((ref) {
//   return 0;
// });

class AppSizes {
  static double maxHeight({required BuildContext context}) {
    return MediaQuery.of(context).size.height;
  }

  static double maxWidth({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }
}

class MyWidget extends ConsumerStatefulWidget {
  const MyWidget({super.key});

  @override
  ConsumerState<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


// class  extends ConsumerWidget {
//   const ({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container();
//   }
// }