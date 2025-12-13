import 'dart:convert';

import 'package:get/get.dart';
import 'package:practice/data/api_service/post_data_api_service.dart';
import 'package:practice/data/models/post%20model.dart';

class GetPostDataController extends GetxController {

  bool getDataInProgress = false;
  List<PostModel> postModel = [];

  Future<void> getPostData() async {
    getDataInProgress = true;
    update();
    try {
      final response = await PostDataApiService.postDataApiRequest(
        "https://jsonplaceholder.typicode.com/posts",
      );
      getDataInProgress = false;
      if (response.statusCode == 200) {
        final List deCodedResponse = jsonDecode(response.body);
        postModel = deCodedResponse.map((e) => PostModel.fromJson(e)).toList();
        update();
      } else {
        Get.snackbar('Failed', "${response.body}");
        update();
      }
    } catch (e) {
      Get.snackbar('Error', 'error is $e');
      getDataInProgress = false;
      update();
    }
  }
  @override
  void onInit() {
    getPostData();
    super.onInit();
  }
}
