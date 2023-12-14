class DataModel {
  final String? id;
  final String? firstName;
  final String? lastName;

  DataModel({
    required this.id,
    required this.firstName,
    required this.lastName,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
    );
  }
}
