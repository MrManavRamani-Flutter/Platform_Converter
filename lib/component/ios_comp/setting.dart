// Settings : ...........
import 'package:flutter/cupertino.dart';

class SettingsDesign extends StatefulWidget {
  const SettingsDesign({super.key});

  @override
  State<SettingsDesign> createState() => _SettingsDesignState();
}

class _SettingsDesignState extends State<SettingsDesign> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Date',
                      style: TextStyle(fontSize: 18),
                    ),
                    Spacer(),
                    Text(
                      '20, April 2022',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  height: 55,
                  width: double.infinity,
                  color: CupertinoColors.activeBlue,
                  child: CupertinoButton(
                    onPressed: () {},
                    child: const Text(
                      'Change Date',
                      style:
                          TextStyle(color: CupertinoColors.white, fontSize: 23),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Time',
                    style: TextStyle(fontSize: 18),
                  ),
                  Spacer(),
                  Text(
                    '9:45:08 AM',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                height: 55,
                width: double.infinity,
                color: CupertinoColors.activeBlue,
                child: CupertinoButton(
                  onPressed: () {},
                  child: const Text(
                    'Change Time',
                    style:
                        TextStyle(color: CupertinoColors.white, fontSize: 23),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
