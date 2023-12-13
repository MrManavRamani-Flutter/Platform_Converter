import 'package:contact_diary_ios_android/model/contact_controller.dart';
import 'package:contact_diary_ios_android/model/contact_model.dart';
import 'package:contact_diary_ios_android/model/current_step.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> contactList = [
    Contact(
      name: 'Tony Stack',
      contact: '98765 43210',
      email: 'tony.123@gmail.com',
      assetPic: 'assets/img/tony.jpg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Ben 10',
      contact: '78965 43210',
      email: 'ben.10@gmail.com',
      assetPic: 'assets/img/ben.jpg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Gwen 10',
      contact: '78965 43210',
      email: 'ben.10@gmail.com',
      assetPic: 'assets/img/gwen10.jpg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Doremon',
      contact: '78965 43210',
      email: 'ben.10@gmail.com',
      assetPic: 'assets/img/doremon.jpg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Nobita',
      contact: '78965 43210',
      email: 'ben.10@gmail.com',
      assetPic: 'assets/img/nobi.jpg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Hathori',
      contact: '78965 43210',
      email: 'ben.10@gmail.com',
      assetPic: 'assets/img/hathori.jpg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Oggy',
      contact: '78965 43210',
      email: 'ben.10@gmail.com',
      assetPic: 'assets/img/oggy.jpg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Spider Man',
      contact: '78965 43210',
      email: 'ben.10@gmail.com',
      assetPic: 'assets/img/spider.jpg',
      time: 'Yesterday,9:40 PM',
    ),
    Contact(
      name: 'Thor',
      contact: '78965 43210',
      email: 'ben.10@gmail.com',
      assetPic: 'assets/img/thor.jpg',
      time: 'Yesterday,9:40 PM',
    ),
  ];
  // List<CallsData> callList = [
  //   CallsData(
  //     name: 'Tony Stack',
  //     contact: '98765 43210',
  //     time: 'Yesterday,9:40 PM',
  //     pic: 'assets/img/tony.jpg',
  //   ),
  //   CallsData(
  //     name: 'Ben 10',
  //     contact: '78965 43210',
  //     time: 'Yesterday,9:40 PM',
  //     pic: 'assets/img/ben.jpg',
  //   ),
  //   CallsData(
  //     name: 'Gwen 10',
  //     contact: '78965 43210',
  //     time: 'Yesterday,9:40 PM',
  //     pic: 'assets/img/gwen10.jpg',
  //   ),
  //   CallsData(
  //     name: 'Doremon',
  //     contact: '78965 43210',
  //     time: 'Yesterday,9:40 PM',
  //     pic: 'assets/img/doremon.jpg',
  //   ),
  //   CallsData(
  //     name: 'Nobita',
  //     contact: '78965 43210',
  //     time: 'Yesterday,9:40 PM',
  //     pic: 'assets/img/nobi.jpg',
  //   ),
  //   CallsData(
  //     name: 'Hathori',
  //     contact: '78965 43210',
  //     time: 'Yesterday,9:40 PM',
  //     pic: 'assets/img/hathori.jpg',
  //   ),
  //   CallsData(
  //     name: 'Oggy',
  //     contact: '78965 43210',
  //     time: 'Yesterday,9:40 PM',
  //     pic: 'assets/img/oggy.jpg',
  //   ),
  //   CallsData(
  //     name: 'Spider Man',
  //     contact: '78965 43210',
  //     time: 'Yesterday,9:40 PM',
  //     pic: 'assets/img/spider.jpg',
  //   ),
  //   CallsData(
  //     name: 'Thor',
  //     contact: '78965 43210',
  //     time: 'Yesterday,9:40 PM',
  //     pic: 'assets/img/thor.jpg',
  //   ),
  // ];

  // Add Data Provider ....
  CurrentStep cs = CurrentStep(currentStep: 0);

  // TextEditing Controller Obj.................
  ControllerVar convar = ControllerVar(
      nameC: TextEditingController(text: ''),
      emailC: TextEditingController(text: ''),
      contactC: TextEditingController(text: ''));

  // Add Contact Data..........
  void addContact(String name, String contact, String email) {
    Contact data = Contact(
      name: name,
      contact: contact,
      email: email,
      pic: pickImage!,
      time: 'Just Now',
    );
    contactList.add(data);
    notifyListeners();
  }

  void addData(String name, String contact, String email) {
    Contact data = Contact(
      pic: pickImage!,
      name: name,
      contact: contact,
      email: email,
      time: 'Just Now',
    );
    contactList.add(data);
    notifyListeners();
  }

  // Gallery Pic :-------
  String? pickImage;
  imagePic() async {
    final ImagePicker picker = ImagePicker();

    XFile? res = await picker.pickImage(source: ImageSource.gallery);
    String path = res!.path;
    pickImage = path;
    notifyListeners();
  }

  // Check Fill Data Or Not ...................
  checkFillData() {
    if (convar.nameC.text.isNotEmpty &&
        convar.emailC.text.isNotEmpty &&
        convar.contactC.text.isNotEmpty) {
      addData(
        convar.nameC.text,
        convar.contactC.text,
        convar.emailC.text,
      );
      convar.contactC.clear();
      convar.nameC.clear();
      convar.emailC.clear();
    } else if (convar.nameC.text.isNotEmpty &&
        convar.emailC.text.isNotEmpty &&
        convar.contactC.text.isNotEmpty) {
      addContact(convar.nameC.text, convar.contactC.text, convar.emailC.text);

      convar.contactC.clear();
      convar.nameC.clear();
      convar.emailC.clear();
    }
    notifyListeners();
  }

  checkContinueState() {
    if (cs.currentStep < 3) {
      cs.currentStep++;
    }
    notifyListeners();
  }

  checkCancelState() {
    if (cs.currentStep > 0) {
      cs.currentStep--;
    }
    notifyListeners();
  }
}
