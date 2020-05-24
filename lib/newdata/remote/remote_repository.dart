import 'dart:developer';
import 'package:serviceapp/data/model/appointment.dart';
import 'package:serviceapp/data/model/business.dart';
import 'package:serviceapp/data/model/service.dart';
import 'package:serviceapp/data/model/employee.dart';
import 'package:serviceapp/data/model/my_appointment.dart';
import 'package:serviceapp/data/model/schedule.dart';
import 'package:serviceapp/data/model/user.dart';

abstract class RemoteRepository {

  Future <List<String>> getBusiness();

  Future<Map<String, List<Business>>> getAllBusiness(String business);

  Future<List<Service>> getAllServices(String uid, String typeBusiness);

  Future<List<Employee>> getAllEmployes(String uid, String typeBusiness);

  Future<User> getUser(String uid);

  Future<String> getOneImage(String businessUid, String employeeName, String directory);

  Future<List<String>> getAllImages(Business business);

  Future<bool> insertAppointment(Appointment appointment,String uid);

  Future<List<MyAppointment>> getUserAppointments(String uid);

  Future<User> getUserByPhoneNumber(String phoneNumber);

  Future<User> insertAnonymousUser(User user);

  Future<Schedule> getRange(String day, String name, String businessUid, String typeBusiness);

  Future<bool> removeRange(DateTime day, String name, String businessUid, String typeBusiness, Map ranges);

  Future<bool> removeAppointment(MyAppointment appointment, int index);

  Future<bool> getUserPenalize(String uid);
}
