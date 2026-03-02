import 'package:get/get.dart';

class TrainingController extends GetxController {

  final RxInt selectedCategoryIndex = 0.obs;


  final List<String> eventCategories = [
    'Upcoming',
    'Completed',
    'Mandatory',
  ];



  void selectEventCategory(int index) {
    selectedCategoryIndex.value = index;
    print('Selected category: ${eventCategories[index]}');
  }

}