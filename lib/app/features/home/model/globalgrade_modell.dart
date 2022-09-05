class GradeModel {
  String? value;
  String? childName;

  GradeModel(this.value, this.childName);
}

class GradeList {
  List<GradeModel>? _grade;

  GradeList() {
    _grade = [
      GradeModel("0", "LKG"),
      GradeModel("1", "1"),
      GradeModel("2", "2"),
      GradeModel("3", "3"),
      GradeModel("4", "4"),
      GradeModel("5", "5"),
      GradeModel("6", "6"),
      GradeModel("7", "7"),
      GradeModel("8", "8"),
    ];
  }

  List<GradeModel>? get gradeList => _grade;
}
