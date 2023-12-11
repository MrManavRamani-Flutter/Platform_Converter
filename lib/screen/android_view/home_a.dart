import 'package:contact_diary_ios_android/component/android_comp/calls.dart';
import 'package:contact_diary_ios_android/component/android_comp/chats.dart';
import 'package:contact_diary_ios_android/component/android_comp/settings.dart';
import 'package:contact_diary_ios_android/provider/theme/theme_chenge_app_provider.dart';
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
                onPressed: () {},
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
