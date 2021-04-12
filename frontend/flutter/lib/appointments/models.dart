class Appointment {
  int id;
  String lastName;
  String firstName;
  DateTime? dob;
  String mrn;
  DateTime? date;
  String clinician;
  DateTime? lastSaved;
  List<Medication> medications;

  Appointment({
    required this.id,
    required this.lastName,
    required this.firstName,
    required this.dob,
    required this.mrn,
    required this.date,
    required this.clinician,
    required this.lastSaved,
    required this.medications,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    var meds = json['medications'] as List;
    List<Medication> medications =
        meds.map((i) => Medication.fromJson(i)).toList();

    return Appointment(
      id: json['id'] as int,
      lastName: json['lastName'] as String,
      firstName: json['firstName'] as String,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob']),
      mrn: json['mrn'] as String,
      date: json['date'] == null ? null : DateTime.parse(json['date']),
      clinician: json['clinician'] as String,
      lastSaved:
          json['lastSaved'] == null ? null : DateTime.parse(json['lastSaved']),
      medications: medications,
    );
  }
}

class Medication {
  int id;
  String name;
  DateTime? firstFill;
  double copay;
  int days;

  Medication({
    required this.id,
    required this.name,
    required this.firstFill,
    required this.copay,
    required this.days,
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      id: json['id'] as int,
      name: json['name'] as String,
      firstFill:
          json['firstFill'] == null ? null : DateTime.parse(json['firstFill']),
      copay: json['copay'] as double,
      days: json['daysSupply'] as int,
    );
  }
}
