import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/data/controller/get_post_data_controller.dart';

class PostData extends StatelessWidget {
   PostData({super.key});
 final controller= Get.put(GetPostDataController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            GetBuilder<GetPostDataController>(
             // init: GetPostDataController(),
              builder: (getController) {
                if (getController.getDataInProgress) {
                  return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
                }
                if (getController.postModel.isEmpty) {
                  return SliverToBoxAdapter(child: Center(child: Text('No data')));
                }
                return SliverList(
                  delegate: SliverChildBuilderDelegate((
                    BuildContext context,
                    int index,
                  ) {
                    final data = getController.postModel[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("user Id :${data.userId}",style: TextStyle(fontSize: 18),),
                              Text("Id :${data.id}",style: TextStyle(fontSize: 18),),
                              Text("title:${data.title} ",style: TextStyle(fontSize: 18),),
                              Text("body :${data.body}",style: TextStyle(fontSize: 18),),
                            ],
                          ),
                        ),
                      ),
                    );
                  }, childCount: getController.postModel.length),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
