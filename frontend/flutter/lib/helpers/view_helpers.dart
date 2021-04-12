import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

IgnorePointer createAppointmentTitleRow() {
  return IgnorePointer(
      child: ExpansionTile(
          tilePadding: const EdgeInsets.only(right: 20.0),
          title: Row(
            children: <Widget>[
              centeredBoldText('Last Name'),
              centeredBoldText('First Name'),
              centeredBoldText('DOB'),
              centeredBoldText('MRN'),
              centeredBoldText('Date'),
              centeredBoldText('Clinician'),
              centeredBoldText('Last Saved'),
            ],
          ),
          trailing: SizedBox.shrink()));
}

Row createMedicationTitleRow() {
  return Row(
    children: <Widget>[
      centeredBoldText('Name'),
      centeredBoldText('First Fill'),
      centeredBoldText('Copay'),
      centeredBoldText('Days Supply'),
    ],
  );
}

Expanded centeredBoldText(String text) {
  return centeredText(text, TextStyle(fontWeight: FontWeight.bold));
}

Expanded centeredNormalText(String text) {
  return centeredText(text, null);
}

Expanded centeredText(String text, TextStyle? _style) {
  return Expanded(
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: _style,
    ),
  );
}

String formatDate(DateTime? date) {
  String result = "";
  if (date != null) {
    result = DateFormat.yMd().format(date);
  }
  return result;
}

String formatDateTime(DateTime? date) {
  String result = "";
  if (date != null) {
    result = DateFormat.yMd().add_jm().format(date);
  }
  return result;
}
