import 'dart:io';

import 'package:flutter/material.dart';

class Global {
  static List<Map<String, dynamic>> contact = [
    {
      'conName': 'Chrishopher Campbell',
      'proImage': 'asset/image/christopher-campbell.jpg',
      'conNumber': '9099854567',
      'message':'Hello,how are you?',
      'time':'10 minutes ago',
      'readTime':'19:15',
      'archive':false,
      'pin':false,
    }, {
      'conName': 'Edward Cisneros',
      'proImage': 'asset/image/edward-cisneros.jpg',
      'conNumber': '9099854545',
      'message':'Hey,are you there?',
      'time':'5 minutes ago',
      'readTime':'09:05',
      'archive':false,
      'pin':false,
    }, {
      'conName': 'Gian Cescon',
      'proImage': 'asset/image/gian-cescon.jpg',
      'conNumber': '9095544567',
      'message':'Call me as soon as possible!!',
      'time':'2 hours ago',
      'readTime':'14:47',
      'archive':false,
      'pin':false,
    }, {
      'conName': 'Joseph Gonzalez',
      'proImage': 'asset/image/joseph-gonzalez.jpg',
      'conNumber': '9099124567',
      'message':"I am at your mummy's home come soon",
      'time':'yesterday',
      'readTime':'19:20',
      'archive':false,
      'pin':false,
    }, {
      'conName': 'Matheus Ferrero',
      'proImage': 'asset/image/matheus-ferrero.jpg',
      'conNumber': '8585544536',
      'message':'When you are getting free',
      'time':'45 minutes ago',
      'readTime':'11:20',
      'archive':false,
      'pin':false,
    }, {
      'conName': 'May Gauthier',
      'proImage': 'asset/image/may-gauthier.jpg',
      'conNumber': '9899854567',
      'message':'hye?',
      'time':'10 hours ago',
      'readTime':'01:15',
      'archive':false,
      'pin':false,
    }, {
      'conName': 'Zoe Fernandez',
      'proImage': 'asset/image/zoe-fernandez.jpg',
      'conNumber': '9449854567',
      'message':'can i call u later?',
      'time':'3 minutes ago',
      'readTime':'08:05',
      'archive':false,
      'pin':false,
    }, {
      'conName': 'Toa heftiba',
      'proImage': 'asset/image/toa-heftiba.jpg',
      'conNumber': '9098504478',
      'message':'hye,all good?',
      'time':'7 hours ago',
      'readTime':'03.15',
      'archive':false,
      'pin':false,
    }, {
      'conName': 'Vince Veras',
      'proImage': 'asset/image/vince-veras.jpg',
      'conNumber': '8883956475',
      'message':'I am busy now?',
      'time':'38 minutes ago',
      'readTime':'22.15',
      'archive':false,
      'pin':false,
    },
  ];
  static File? image, cameraImage;
}
