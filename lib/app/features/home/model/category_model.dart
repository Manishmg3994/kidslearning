// class Grade {
//   static final all = [
//     "0",
//     "1",
//     "2",
//     "3",
//     "4",
//     "5",
//     "6",
//     "7",
//     "8",
//     "9",
//     "10",
//     "11",
//     "12"
//   ]; //TODO Change the Grade 0 to lkg ukg or that you want
// }
class Service {
  String name;
  String? imageURL;
  int? indx; //array for shorting todo

  Service({
    required this.name,
    this.imageURL,
    this.indx,
  });

  Service.fromJson(Map<String, dynamic> json)
      : this(
            name: json['name']! as String,
            imageURL: json['imageURL']! as String,
            indx: json["indx"]! as int);
  Map<String, dynamic> toJson() =>
      {'name': name, 'imageURL': imageURL, "indx": indx};
}
