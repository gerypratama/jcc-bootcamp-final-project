import '../services/fcats_service.dart';
import 'package:get/get.dart';
import '../model/fcats_model.dart';

class CatFactsController extends GetxController {
  final CatFact catFacts = CatFact();
  Services services = Services();
  var factloading = true.obs;

  @override
  void onInit() {
    generatefact();
    super.onInit();
  }

  generatefact() async {
    try {
      factloading.value = true;
      var result = await services.connectToAPI();
      if (result != null) {
        catFacts.fact = result.fact;
      } else {
        print('null');
      }
    } finally {
      factloading.value = false;
    }
    update();
  }
}
