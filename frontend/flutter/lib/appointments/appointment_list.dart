import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_poc/helpers/view_helpers.dart';
import 'package:http/http.dart' as http;

import 'models.dart';

class AppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(children: [
        createAppointmentTitleRow(),
        AppointmentList(),
      ])),
    );
  }
}

class AppointmentList extends StatefulWidget {
  const AppointmentList({Key? key}) : super(key: key);

  @override
  _AppointmentListState createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  late Future<List<Appointment>> _futureAppointments;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return FutureBuilder<List<Appointment>>(
        future: _futureAppointments,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _appointmentPanelList(snapshot.data!);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  ExpansionPanelList _appointmentPanelList(List<Appointment> appointments) {
    return ExpansionPanelList.radio(
      expansionCallback: (int index, bool isExpanded) {},
      children: appointments.map<ExpansionPanelRadio>((Appointment appt) {
        return ExpansionPanelRadio(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return Row(children: <Widget>[
              centeredNormalText(appt.lastName),
              centeredNormalText(appt.firstName),
              centeredNormalText(formatDate(appt.dob)),
              centeredNormalText(appt.mrn),
              centeredNormalText(formatDateTime(appt.date)),
              centeredNormalText(appt.clinician),
              centeredNormalText(formatDateTime(appt.lastSaved)),
            ]);
          },
          body: _buildMedications(appointments, appt),
          canTapOnHeader: true,
          value: appt.id,
        );
      }).toList(),
    );
  }

  Widget _buildMedications(List<Appointment> appts, Appointment appt) {
    ListTile removeAppt = ListTile(
        title: Text('Delete this appointment.'),
        trailing: Icon(Icons.delete),
        onTap: () {
          setState(() {
            appts.removeWhere((Appointment currentAppt) => appt == currentAppt);
          });
        });

    List<Row> medications = appt.medications.map<Row>((Medication med) {
      return Row(children: <Widget>[
        centeredNormalText(med.name),
        centeredNormalText(formatDate(med.firstFill)),
        centeredNormalText(med.copay.toString()),
        centeredNormalText(med.days.toString()),
      ]);
    }).toList();

    List<Widget> content = [createMedicationTitleRow()];
    content.addAll(medications);
    content.add(removeAppt);

    return Column(
      children: content,
    );
  }

  @override
  void initState() {
    super.initState();
    _futureAppointments = _fetchAppointments();
  }

  Future<List<Appointment>> _fetchAppointments() async {
    http.Response response =
        await http.get(Uri.http('localhost:8080', 'appointments'));

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((appt) => Appointment.fromJson(appt))
          .toList();
    } else {
      throw Exception('Failed to load appointments');
    }
  }
}
