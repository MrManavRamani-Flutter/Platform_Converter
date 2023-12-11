import 'package:contact_diary_ios_android/model/calls_model.dart';
import 'package:contact_diary_ios_android/model/contact_model.dart';
import 'package:flutter/material.dart';

class ContactProvider extends ChangeNotifier {
  List<Contact> contactList = [
    Contact(
      name: 'Tony Stack',
      contact: '98765 43210',
      email: 'tony.123@gmail.com',
      pic: 'assets/img/tony.jpg',
    ),
    Contact(
      name: 'Ben 10',
      contact: '78965 43210',
      email: 'ben.10@gmail.com',
      pic: 'assets/img/ben.jpg',
    ),
    Contact(
      name: 'Gwen 10',
      contact: '78965 43210',
      email: 'ben.10@gmail.com',
      pic: 'assets/img/gwen10.jpg',
    ),
    Contact(
      name: 'Doremon',
      contact: '78965 43210',
      email: 'ben.10@gmail.com',
      pic: 'assets/img/doremon.jpg',
    ),
    Contact(
      name: 'Nobita',
      contact: '78965 43210',
      email: 'ben.10@gmail.com',
      pic: 'assets/img/nobi.jpg',
    ),
    Contact(
      name: 'Hathori',
      contact: '78965 43210',
      email: 'ben.10@gmail.com',
      pic: 'assets/img/hathori.jpg',
    ),
    Contact(
      name: 'Oggy',
      contact: '78965 43210',
      email: 'ben.10@gmail.com',
      pic: 'assets/img/oggy.jpg',
    ),
    Contact(
      name: 'Spider Man',
      contact: '78965 43210',
      email: 'ben.10@gmail.com',
      pic: 'assets/img/spider.jpg',
    ),
    Contact(
      name: 'Thor',
      contact: '78965 43210',
      email: 'ben.10@gmail.com',
      pic: 'assets/img/thor.jpg',
    ),
  ];
  List<CallsData> callList = [
    CallsData(
      name: 'Tony Stack',
      contact: '98765 43210',
      time: 'Yesterday,9:40 PM',
      pic: 'assets/img/tony.jpg',
    ),
    CallsData(
      name: 'Ben 10',
      contact: '78965 43210',
      time: 'Yesterday,9:40 PM',
      pic: 'assets/img/ben.jpg',
    ),
    CallsData(
      name: 'Gwen 10',
      contact: '78965 43210',
      time: 'Yesterday,9:40 PM',
      pic: 'assets/img/gwen10.jpg',
    ),
    CallsData(
      name: 'Doremon',
      contact: '78965 43210',
      time: 'Yesterday,9:40 PM',
      pic: 'assets/img/doremon.jpg',
    ),
    CallsData(
      name: 'Nobita',
      contact: '78965 43210',
      time: 'Yesterday,9:40 PM',
      pic: 'assets/img/nobi.jpg',
    ),
    CallsData(
      name: 'Hathori',
      contact: '78965 43210',
      time: 'Yesterday,9:40 PM',
      pic: 'assets/img/hathori.jpg',
    ),
    CallsData(
      name: 'Oggy',
      contact: '78965 43210',
      time: 'Yesterday,9:40 PM',
      pic: 'assets/img/oggy.jpg',
    ),
    CallsData(
      name: 'Spider Man',
      contact: '78965 43210',
      time: 'Yesterday,9:40 PM',
      pic: 'assets/img/spider.jpg',
    ),
    CallsData(
      name: 'Thor',
      contact: '78965 43210',
      time: 'Yesterday,9:40 PM',
      pic: 'assets/img/thor.jpg',
    ),
  ];
}
