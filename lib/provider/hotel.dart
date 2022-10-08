import 'package:flutter/material.dart';

import '../Http/category.dart';
import '../Http/dblocation.dart';
import '../Http/hotel.dart';
import '../Http/offer_banner.dart';
import '../Http/profile.dart';
import '../Http/restorent.dart';
import '../Model/category.dart';
import '../Model/dblocation.dart';
import '../Model/hotelroom.dart';
import '../Model/hotels.dart';
import '../Model/hotelsearchmoel.dart';
import '../Model/offerbanner.dart';
import '../Model/profiledata.dart';
import '../Model/restorentmodel.dart';

class Hotelprovider extends ChangeNotifier {
  Category? category;

  // Future getcategory() async {
  //   category = await HttpCategory().getcategory();
  //   notifyListeners();
  // }

  // offer banner

  Offerbanner? offerbanner;

  Future getofferbanner() async {
    offerbanner = await HttpOfferBanner().getofferbanner();
    notifyListeners();
  }

  // hotels

  Hotels? hotels;

  Future gethotels() async {
    hotels = await Httphotel().gethotel();
    notifyListeners();
  }

  // db location

  DbLocation? dbLocation;

  Future getdblocation() async {
    dbLocation = await HttpDblocation().getdblocation();
    notifyListeners();
  }

  // hotel search

  bool searchloading = false;
  HotelsearchModel? hotelsearchModel;

  Future hotelsearch({String? area}) async {
    searchloading = true;
    hotelsearchModel = await Httphotel().searchhotel(area: area);
    searchloading = false;
    notifyListeners();
  }

  // restorent

  RestorentModel? restorent;

  Future getrestorent() async {
    restorent = await Httprestorent().getrestorent();
    notifyListeners();
  }

  //  hotel room

  HotelRoom? hotelRoom;

  Future gethotelroom({hotelid}) async {
    hotelRoom = await Httphotel().gethotelroom(hotelid: hotelid);
    notifyListeners();
  }

  // profile

  ProfileData? profileData;

  Future getprofile() async {
    profileData = await Httpprofile().getprofile();
    notifyListeners();
  }
}
