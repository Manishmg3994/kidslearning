import 'package:get_storage/get_storage.dart';

class GradeSelected {
  final _box = GetStorage();
  final _key = "selectedGrade";

  String? get selectedGrade => _selectedGrade;
  
  set selectedGrade(String? value) {
    if (_selectedGrade == value) {
      return;
    }
    _selectedGrade = value;
    saveGrade(_selectedGrade);
  }

  String? _selectedGrade = GetStorage().read("selectedGrade");
  void saveGrade(String? grade) => _box.write(_key, grade);
}
