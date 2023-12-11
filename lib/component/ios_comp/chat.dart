// Chat Design : ...........
import 'package:contact_diary_ios_android/provider/theme/contact_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ChatDesign extends StatefulWidget {
  const ChatDesign({super.key});

  @override
  State<ChatDesign> createState() => _ChatDesignState();
}

class _ChatDesignState extends State<ChatDesign> {
  @override
  Widget build(BuildContext context) {
    var contactProvider = Provider.of<ContactProvider>(context);
    return ListView(
      children: contactProvider.contactList.map((e) {
        return CupertinoButton(
          onPressed: () {
            showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) => CupertinoActionSheet(
                title: Container(
                  alignment: Alignment.center,
                  height: 80,
                  width: 80,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CupertinoColors.white
                          .withOpacity(double.minPositive)),
                  child: Image.asset(
                    e.pic,
                    fit: BoxFit.fill,
                  ),
                ),
                message: const Text('Send]['),
                actions: <CupertinoActionSheetAction>[
                  CupertinoActionSheetAction(
                    /// This parameter indicates the action would be a default
                    /// default behavior, turns the action's text to bold text.
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Default Action'),
                  ),
                  CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Action'),
                  ),
                  CupertinoActionSheetAction(
                    /// This parameter indicates the action would perform
                    /// a destructive action such as delete or exit and turns
                    /// the action's text color to red.
                    isDestructiveAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Destructive Action'),
                  ),
                ],
              ),
            );
          },
          child: CupertinoListTile(
            leadingSize: 60,
            leading: Container(
              height: 60,
              width: 60,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: CupertinoColors.black,
              ),
              child: Image(
                image: AssetImage(e.pic),
                fit: BoxFit.fill,
              ),
            ),
            title: Text(
              e.name,
              style: const TextStyle(color: CupertinoColors.darkBackgroundGray),
            ),
            trailing: const Text(
              '12:28 pm',
              style: TextStyle(color: CupertinoColors.inactiveGray),
            ),
            subtitle: const Text(
              'Flutter is Great',
              style: TextStyle(color: CupertinoColors.inactiveGray),
            ),
          ),
        );
      }).toList(),
    );
  }
}
