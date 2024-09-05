import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// import '../../../models/currentBookingList.dart';
import '../../../models/currentBookingList.dart' as bookingModel;
import '../../../models/packagesList.dart' as packageModel;
import '../../../services/api.dart';

class HomePageController extends GetxController {
  var isLoading = true.obs;
  var bookingList = <bookingModel.Response>[].obs;
    var packagesList = <packageModel.Response>[].obs;
     var drawerList = <Map<String, String>>[
    {"title": "Home"},
    {"title": "Book A Nanny"},
    {"title": "How It Works"},
    {"title": "Why Nanny Vanny"},
    {"title": "My Bookings"},
    {"title": "My Profile"},
    {"title": "Support"}
  ];


  @override
  void onInit() {
    super.onInit();
    fetchCurrentBookingList();
        fetchPackagesList();

  }

  void fetchCurrentBookingList() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(Api.currentListBooking));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var currentBookingList = bookingModel.CurrentBookingList.fromJson(data);
        if (currentBookingList.response != null) {
          bookingList.value = currentBookingList.response ?? [];
          print(bookingList);
        }
      } else {
        Get.snackbar('Error', 'Failed to load data');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading(false);
    }
  }

   void fetchPackagesList() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse(Api.packagesList));
      if (response.statusCode == 200) {
        var jsonString = json.decode(response.body);
        var packages = packageModel.PackagesList.fromJson(jsonString);
        packagesList.value = packages.response ?? [];
      } else {
        print('Failed to load packages list');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
