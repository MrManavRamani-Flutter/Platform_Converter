import 'dart:io';

import 'package:contact_diary_ios_android/component/android_comp/calls.dart';
import 'package:contact_diary_ios_android/component/android_comp/chats.dart';
import 'package:contact_diary_ios_android/component/android_comp/settings.dart';
import 'package:contact_diary_ios_android/provider/contact_provider.dart';
import 'package:contact_diary_ios_android/provider/theme_chenge_app_provider.dart';
import 'package:contact_diary_ios_android/screen/android_view/sidebar_a.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeA extends StatefulWidget {
  const HomeA({super.key});
  @override
  State<HomeA> createState() => _HomeAState();
}

class _HomeAState extends State<HomeA> with SingleTickerProviderStateMixin {
  late TabController tabController;
  PageController pageController = PageController();

  String platform = '';

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: allComponants.length, vsync: this);
  }

  List<Widget> allComponants = [
    const ChatDesign(),
    const CallDesign(),
    const SettingsDesign(),
  ];
  bool isNotSettings = false;
  @override
  Widget build(BuildContext context) {
    var themePro = Provider.of<ThemeChangeAppProvider>(context);
    var themeProFalse =
        Provider.of<ThemeChangeAppProvider>(context, listen: false);
    return DefaultTabController(
      length: allComponants.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Platform Convertor',
          ),
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Switch(
                inactiveTrackColor: Colors.white54,
                thumbIcon: const MaterialStatePropertyAll(
                  Icon(
                    Icons.android_rounded,
                    color: Colors.green,
                  ),
                ),
                value: !themePro.isAndroid,
                onChanged: (value) {
                  themeProFalse.platFromCheck();
                },
              ),
            ),
          ],
          bottom: TabBar(
              onTap: (val) {
                if (val == 2) {
                  isNotSettings = true;
                  setState(() {});
                } else {
                  isNotSettings = false;
                  setState(() {});
                }
                pageController.animateToPage(
                  val,
                  duration: const Duration(microseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              controller: tabController,
              tabs: const <Tab>[
                Tab(
                  text: 'Chat',
                ),
                Tab(
                  text: 'Calls',
                ),
                Tab(
                  text: 'Settings',
                ),
              ]),
        ),

        floatingActionButton: (!isNotSettings)
            ? FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const Alert();
                    },
                  );
                },
                child: const Icon(
                  Icons.add,
                  size: 35,
                ),
              )
            : Container(),
        // Drawer Side bar ............
        drawer: const Navbar(),
        // Body ...................
        body: Container(
          alignment: Alignment.center,
          child: PageView(
            onPageChanged: (val) {
              tabController.animateTo(val);
            },
            controller: pageController,
            children: allComponants,
          ),
        ),
      ),
    );
  }
}

class Alert extends StatefulWidget {
  const Alert({super.key});

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
    var addDataP = Provider.of<ContactProvider>(context);
    return AlertDialog(
      title: const Text(
        'Add Contact',
      ),
      content: SizedBox(
        height: 455,
        width: 400,
        child: Stepper(
          controlsBuilder: (context, details) {
            if (addDataP.cs.currentStep == 0) {
              return Row(
                children: [
                  FilledButton(
                    onPressed: () {
                      addDataP.checkContinueState();
                    },
                    child: const Text('Continue'),
                  ),
                ],
              );
            } else if (addDataP.cs.currentStep == 3) {
              return Row(
                children: [
                  FilledButton(
                    onPressed: () {
                      addDataP.checkFillData();
                      addDataP.checkContinueState();
                      Navigator.pop(context);
                      addDataP.cs.currentStep = 0;
                    },
                    child: const Text('Finish'),
                  ),
                  TextButton(
                    onPressed: () {
                      addDataP.checkCancelState();
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              );
            } else {
              return Row(
                children: [
                  FilledButton(
                    onPressed: () {
                      addDataP.checkContinueState();
                    },
                    child: const Text('Continue'),
                  ),
                  TextButton(
                    onPressed: () {
                      addDataP.checkCancelState();
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              );
            }
          },
          currentStep: addDataP.cs.currentStep,
          steps: <Step>[
            Step(
              state: (addDataP.cs.currentStep == 0)
                  ? StepState.editing
                  : (addDataP.convar.nameC.text.isEmpty)
                      ? StepState.error
                      : StepState.complete,
              title: const Text('Name'),
              content: TextField(
                controller: addDataP.convar.nameC,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(hintText: 'Enter your name'),
              ),
            ),
            Step(
              state: (addDataP.cs.currentStep < 1)
                  ? StepState.indexed
                  : (addDataP.cs.currentStep == 1)
                      ? StepState.editing
                      : (addDataP.convar.emailC.text.isEmpty)
                          ? StepState.error
                          : StepState.complete,
              title: const Text('Email'),
              content: TextField(
                controller: addDataP.convar.emailC,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: 'Enter your Email'),
              ),
            ),
            Step(
              state: (addDataP.cs.currentStep < 2)
                  ? StepState.indexed
                  : (addDataP.cs.currentStep == 2)
                      ? StepState.editing
                      : (addDataP.convar.contactC.text.isEmpty)
                          ? StepState.error
                          : StepState.complete,
              title: const Text('Contact'),
              content: TextField(
                onSubmitted: (val) {
                  addDataP.convar.contactC.text = val;
                },
                keyboardType: TextInputType.phone,
                controller: addDataP.convar.contactC,
                maxLength: 10,
                decoration:
                    const InputDecoration(hintText: 'Enter your Contact'),
              ),
            ),
            Step(
              state: (addDataP.cs.currentStep < 3)
                  ? StepState.indexed
                  : (addDataP.cs.currentStep == 3)
                      ? StepState.editing
                      : (addDataP.convar.contactC.text.isEmpty)
                          ? StepState.error
                          : StepState.complete,
              title: const Text('Profile Pic'),
              content: Row(
                children: [
                  (addDataP.pickImage != null)
                      ? CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey,
                          backgroundImage: FileImage(File(addDataP.pickImage!)),
                        )
                      : const CircleAvatar(
                          radius: 40,
                          child: FlutterLogo(),
                        ),
                  IconButton(
                      onPressed: () {
                        addDataP.imagePic();
                      },
                      icon: const Icon(Icons.photo)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
