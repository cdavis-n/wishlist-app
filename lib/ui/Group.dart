import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';

class Group {
  final int groupId;
  final String groupImage;
  final String groupName;
  final List<User> list;
  Group(this.groupId, this.groupImage, this.groupName, this.list);
}

class User {
  final int userId;
  final String userImage;
  final String userName;
  User(this.userId, this.userImage, this.userName);
  Map<String, dynamic> toMap() {
    return {'userId': userId, 'userImage': userImage, 'userName': userName};
  }
  @override
  String toString() {
    return 'User{userId: $userId, userImage: $userImage, userName: $userName}';
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'User_database.db'),
    onCreate: (db, version){
      return db.execute(
        "CREATE TABLE users(userId INTEGER PRIMARY KEY, userImage VARBINARY, userName TEXT"
      );
    },
    version: 1,
  );
  void insertUser(User user) async {
    final Database db = await database;

    await db.insert('users', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }
  Future<List<User>> users() async{
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (index){
      return User(maps[index]['userId'], maps[index]['userImage'], maps[index]['userName']);
    });
  }
  void updateUser(User user) async {
    final db = await database;
    
    await db.update('users', user.toMap(), where: "userId = ?", whereArgs: [user.userId]);
  }
  void deleteUser(int userId) async {
    final db = await database;

    await db.delete('users', where: "userId = ?", whereArgs: [userId]);
  }
}
