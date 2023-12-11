// Call Design : ................
import 'package:contact_diary_ios_android/provider/contact_provider.dart';
import 'package:flutter/material.dart';
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
        return InkWell(
          onTap: () {},
          child: ListTile(
            leading: CircleAvatar(
              radius: 27,
              foregroundImage: AssetImage(e.pic),
            ),
            title: Text(e.name),
            trailing: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.call,
                color: Colors.green,
                size: 30,
              ),
            ),
            subtitle: Text(
              e.time,
              style: const TextStyle(color: Colors.grey),
            ),
          ),
        );
      }).toList(),
    );
  }
}
