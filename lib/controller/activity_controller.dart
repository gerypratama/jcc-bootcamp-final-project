import 'package:get/get.dart';
import '../model/activity_model.dart';
import '../services/activity_service.dart';

class ActivityController extends GetxController {
  ActivityIdea activityIdea = ActivityIdea();
  Services services = Services();
  var idealoading = true.obs;

  @override
  void onInit() {
    generateidea();
    super.onInit();
  }

  generateidea() async {
    try {
      idealoading.value = true;
      var result = await services.connectToAPI();
      if (result != null) {
        activityIdea = result;
      } else {
        print('null');
      }
    } finally {
      idealoading.value = false;
    }
    update();
  }
}
