import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/activity_controller.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ActivityController());
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Activity Idea Generator',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFF44B872)),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('What do you want\nto do today?',
                  style:
                      TextStyle(color: const Color(0xFF44B872), fontSize: 32)),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: MediaQuery.of(context).size.height / 3.5,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => controller.idealoading.value
                          ? CircularProgressIndicator(
                              color: const Color(0xFF44B872))
                          : Center(
                              child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 30),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text('Well, you may want to...',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color:
                                                    const Color(0xFF8E8E8E))),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 20),
                                        child: Text(
                                          controller.activityIdea.activity!,
                                          style: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFF8E8E8E)),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.people_outlined,
                                              color: const Color(0xFF44B872)),
                                          Text(
                                              'For up to ' +
                                                  controller
                                                      .activityIdea.participants
                                                      .toString() +
                                                  ' participants',
                                              style: TextStyle(
                                                  color:
                                                      const Color(0xFF44B872)))
                                        ],
                                      ),
                                      Text(
                                        '#' + controller.activityIdea.type!,
                                        style: TextStyle(
                                            color: const Color(0xFF44B872)),
                                      ),
                                    ],
                                  )),
                            ))
                    ]),
              ),
              ElevatedButton(
                  child: Text(
                    'Other Idea?',
                    style: TextStyle(color: const Color(0xFFE2FFEE)),
                  ),
                  onPressed: () {
                    controller.generateidea();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF44B872)),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
