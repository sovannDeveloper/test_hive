import 'dart:io';

import 'package:device_policy_manager/device_policy_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_hive/context.dart';
import 'package:test_hive/hive/message.dart';
import 'package:test_hive/hive/person.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart' as lock;
import 'package:kiosk_mode/kiosk_mode.dart';

import 'person_screen.dart';

const darkModeBox = 'darkModeTutorial';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(darkModeBox);
  Hive.registerAdapter(PersonAdapter());
  Hive.registerAdapter(MessageAdapter());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Hive.box(darkModeBox).listenable(),
        builder: (_, b, w) {
          var darkMode = b.get('darkMode', defaultValue: false);

          return MaterialApp(
            themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData.dark(),
            title: 'Flutter Demo',
            theme: ThemeData(useMaterial3: false),
            home: const MyHomePage(title: 'Flutter Demo Home Page'),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('------------------- $state');
    if (state == AppLifecycleState.paused) {
      // DevicePolicyManager.lockNow();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final result = await getKioskMode();

        if (result == KioskMode.enabled) {
          lock.screenLock(
            context: context,
            correctString: '1234',
            canCancel: true,
            onUnlocked: () async {
              await stopKioskMode();
              exit(0);
            },
          );

          return false;
        }

        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            ValueListenableBuilder(
              valueListenable: Hive.box(darkModeBox).listenable(),
              builder: (context, box, widget) {
                var darkMode = box.get('darkMode', defaultValue: false);
                return Center(
                  child: Switch(
                    value: darkMode,
                    onChanged: (val) {
                      box.put('darkMode', !darkMode);
                    },
                  ),
                );
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              ElevatedButton(
                onPressed: () {
                  context.to(const PersonScreen());
                },
                child: const Text('Go to test hive'),
              ),
              ElevatedButton(
                onPressed: () {
                  startKioskMode();
                },
                child: const Text('Start kioks mode'),
              ),
              ElevatedButton(
                onPressed: () {
                  stopKioskMode();
                },
                child: const Text('Stop kioks mode'),
              ),
              ElevatedButton(
                onPressed: () async {
                  // lock.screenLock(
                  //   context: context,
                  //   correctString: '1234',
                  //   canCancel: false,
                  // );
                  await DevicePolicyManager.lockNow();
                },
                child: const Text('Lock Screen'),
              ),
              ElevatedButton(
                onPressed: () async {
                  KioskMode.enabled;
                },
                child: const Text('Request admin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
