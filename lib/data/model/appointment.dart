import 'dart:developer';
import 'package:serviceapp/data/model/user.dart';
import 'business.dart';
import 'employee.dart';
import 'service.dart';

class Appointment {
  User user;
  Employee employee;
  Service service;
  DateTime checkIn;
  DateTime checkOut;
  Business business;
  DateTime day;
  String table;
}
