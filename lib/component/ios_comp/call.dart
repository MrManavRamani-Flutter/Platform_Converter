// Call Design : ................
import 'package:contact_diary_ios_android/provider/theme/contact_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class CallDesign extends StatefulWidget {
  const CallDesign({super.key});

  @override
  State<CallDesign> createState() => _CallDesignState();
}

class _CallDesignState extends State<CallDesign> {
  @override
  Widget build(BuildContext context) {
    var contactProvider = Provider.of<ContactProvider>(context);
    return ListView(
      children: contactProvider.callList.map((e) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
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
            title: Text(e.name),
            trailing: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                CupertinoIcons.phone_fill,
                size: 30,
                color: CupertinoColors.activeGreen,
              ),
            ),
            subtitle: Text(
              e.time,
              style: const TextStyle(color: CupertinoColors.inactiveGray),
            ),
          ),
        );
      }).toList(),
    );
  }
}
