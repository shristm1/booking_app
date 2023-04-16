import 'package:booking_app/data/controllers/featured_hotel_controller.dart';
import 'package:booking_app/data/repository/featured_hotel_repo.dart';
import 'package:get/get.dart';
import '../data/api/api_client.dart';

Future<void> init() async{
  //Api Client
  // Get.lazyPut(()=>ApiClient(appBaseUrl: "http://192.168.1.66/bookatt/"));
  //
  // //Repositories
  // Get.lazyPut(()=>FeaturedHotelRepo(apiClient: Get.find()));
  //
  // //Controllers
  // Get.lazyPut(()=>FeaturedHotelController(featuredHotelRepo: Get.find()));
}