class Donor {
  final int? id;
  final String name;
  final String gender;
  final int age;
  final String bloodGroup;
  final String lastDonated;
  final String mobileNumber;

  Donor({
    this.id,
    required this.name,
    required this.gender,
    required this.age,
    required this.bloodGroup,
    required this.lastDonated,
    required this.mobileNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'age': age,
      'bloodGroup': bloodGroup,
      'lastDonated': lastDonated,
      'mobileNumber': mobileNumber,
    };
  }

  factory Donor.fromMap(Map<String, dynamic> map) {
    return Donor(
      id: map['id'],
      name: map['name'],
      gender: map['gender'],
      age: map['age'],
      bloodGroup: map['bloodGroup'],
      lastDonated: map['lastDonated'],
      mobileNumber: map['mobileNumber'],
    );
  }
}