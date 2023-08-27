
import 'package:atc/database/db_controller.dart';
import 'package:atc/modle/process_response.dart';
import 'package:atc/modle/user.dart';
import 'package:atc/shared_pref/shared.dart';
import 'package:sqflite/sqflite.dart';

class UserDbController {
  final Database _database = DbController().database;

  Future<ProcessResponse> login(
      {required String email,  String? password}) async {
    List<Map<String, dynamic>> rowMap = await _database.rawQuery(
        'SELECT * FROM users WHERE email = ? AND password = ?',
        [email, password]);

    if (rowMap.isNotEmpty) {
      Users users = Users.fromMap(rowMap.first);
      await SharedPrefController().sava(user: users);
      return ProcessResponse(message: 'Logged in successfully', success: true);
    }
    return ProcessResponse(
        message: 'Loging failed, check credentials', success: false);
  }

  Future<ProcessResponse> register({required Users user}) async {
    if (await _isUnique(email: user.email)) {
      int newRowId = await _database.rawInsert(
        'INSERT INTO users (name, email, phone, password, confirmPassword) VALUES (?, ?, ?, ?, ?)',
        [user.name, user.email, user.phone, user.password, user.confirmPassword],
      );
      return ProcessResponse(
          message: newRowId != 0
              ? 'Registered successfully'
              : 'Registration failed!',
          success: newRowId != 0);
    }
    return ProcessResponse(
      message: 'Email exists, use another!',
      success: false,
    );
  }

  Future<bool> _isUnique({required String email}) async {
    List<Map<String, dynamic>> rowMap = await _database
        .rawQuery('SELECT * FROM users WHERE email = ?', [email]);
    return rowMap.isEmpty;
  }
}
