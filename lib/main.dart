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
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:local_auth/local_auth.dart';

import 'mail.dart';
import 'object_box/ob.dart';
import 'person_screen.dart';

const darkModeBox = 'darkModeTutorial';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(darkModeBox);
  await OCBox.init();
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
            debugShowCheckedModeBanner: false,
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
            title: Column(
              children: [
                Text('Please enter your passcode'),
                Text('Your can send pass code to your email if you forgot it.'),
              ],
            ),
            footer: Text('Forgot passcode?'),
            screenLockConfig: lock.ScreenLockConfig(
              backgroundColor: Colors.transparent,
              textStyle: TextStyle(fontSize: 12),
              titleTextStyle: TextStyle(fontSize: 16),
            ),
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
              ElevatedButton(
                  onPressed: () async {
                    final LocalAuthentication auth = LocalAuthentication();
                    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
                    final bool canAuthenticate =
                        canAuthenticateWithBiometrics || await auth.isDeviceSupported();

                    if (canAuthenticate) {
                      try {
                        final bool didAuthenticate = await auth.authenticate(
                            localizedReason: 'Please authenticate to show account balance');
                        print('Success $didAuthenticate');
                      } on PlatformException catch (e) {
                        print('Error $e');
                      }
                    }
                  },
                  child: const Text('Test Fingure')),
              ElevatedButton(
                  onPressed: () async {
                    const url =
                        "market://com.domain.acledabankqr/app?partner_id=ACD&payment_data=6eW69zewz5CmhRpgG99cXI9CMcWacledabankSecurityTCKHGgVpwq6+wjBqyd2t5Z8auEsgflwRnQ4vXUKaeqJhKYJ5JEjJNNNBzGTmYtaJqAbYv+eJTwfsrah9Ux+u0fO2OXXD2oHxYdFpFIiiV+tTQ89O9z6e1HucUqW771NKb0H1z242L5C7ap+X1eNOPotLiEAq3acledabankSecurityTCjxGJzd1TuTwQiRlkbtjRtMtslirdtQIgZFX4oJgtXBbLoTJwFX+xkxrMHZDtVmFL7uNgX2VQwBDFF7eif1ZSha3NgAvnvyQPacledabankSecurityTCPnHY0aeK+iz9YaQ2PZE9XaMhtz8nfLCzHMS2Ajkp0XgbDILVGIz+6EN0P1IkbqCkULpPgIlFF3+acledabankSecurityTCKdDBhytxh6PyacledabankSecurityTCacledabankSecurityTCZB6cUSjJ9Vxa5NyKRSN0Du6wVwmJYugpfSC8vk+cWAOgGja3p34Y14w00ftLacledabankSecurityTCrOoF18dWSHBACjUzHmhMF8e07jX8GVu2sIpTQ2iLI6LPYuSNDc4uqL1Iwn3GvdgS6vWUuudo8YuK9fJi6zJ0yIK12VDYyzQaT9sceTWwQ+zHwdACnhIMI1bXa9D6YLWCRQgt4QhtWMVLI3NX8ghoB+tF1A907DAjlnc0LcjKxwpuXdcWTbRt4ReofNeDfsOVOrbls+bW+LOdGlDCmNhJCbY9jbihihjVWjErESltxObfTqmzeeqO4uFCWb4ktC1Ikn2dbmq5hRdpKjPgnMlpvPpeitRmSk6Sdx8NYBCzGf+fIbVcTzYXBVlvKkvVjoNWcIwPncZM6xyMcbfl";

                    final abc =
                        await launchUrlString(url, mode: LaunchMode.externalNonBrowserApplication);
                    print(abc);
                  },
                  child: Text('Open Deeplink Acd')),
              ElevatedButton(
                onPressed: () async {
                  final emailService = EmailService();

                  await emailService.sendEmail(
                      toEmail: 'choubsovann@gmail.com',
                      subject: 'Welcome to Our App',
                      body: 'Thank you for joining our platform!');
                },
                child: const Text('Send mail'),
              ),
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
