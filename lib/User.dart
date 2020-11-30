import 'dart:async';
import 'dart:convert';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


User currentUser;

//List<User> _list = [user0, user1, user2, user3, user4];
User fromJason(String s) {
  final data = json.decode(s);
  return User.fromMap(data);
}
String toJason(User user) {
  final data = user.toMap();
  return json.encode(data);
}

class User {
  String code;
  String name;
  String image;
  String password;
  List<User> familyList;
  User({this.code, this.name, this.image, this.password});

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'image': image,
      'password': password,
    };
  }
  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      code: json['code'],
      name: json['name'],
      image: json['image'],
      password: json['password'],
    );
  }
}
class Provider {
  Provider._();
  static final Provider db = Provider._();

  static Database _database;

  Future<Database> get database async {
    if(_database != null)
      return _database;
    _database = await initDB();
    return _database;
  }
  initDB() async {
    String path = join(await getDatabasesPath(), 'user.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
        "CREATE TABLE users(code TEXT PRIMARY KEY, name TEXT, image TEXT, password TEXT)",
      );
    });
  }
  insertUser(User user) async {
    final Database db = await database;
    var res = await db.rawInsert("INSERT INTO users(code, name) "
        "VALUES (${user.code}, ${user.name}, ${user.image}, ${user.password})");
    return res;
  }
  login(String username, String password) async {
    final Database db = await database;
    var res = await db.query("users", where: "code = ? && password = ?", whereArgs: [username, password]);
    return res;
  }
  getUser(String c) async {
    final Database db = await database;
    var res = await db.query("users", where: "code = ?", whereArgs: [c]);
    return res.isNotEmpty ? User.fromMap(res.first) : null;
  }
  updateUserImage(User user, String image) async {
    final Database db = await database;
    User newUser = User(code: user.code, name: user.name, image: image, password: user.password);
    var res = await db.update('users', newUser.toMap(), where: "code = ?", whereArgs: [user.code]);
    return res;
  }
  updateUserName(User user, String name) async {
    final Database db = await database;
    User newUser = User(code: user.code, name: name, image: user.image, password: user.password);
    var res = await db.update('users', newUser.toMap(), where: "code = ?", whereArgs: [user.code]);
    return res;
  }
}
List<User> demo = [
  User(code: 'chi_481', name: 'Chihiro', image: 'assets/images/profile.jpeg', password: 'c12345'),
  User(code: 'emily001', name: 'Emily', image: 'assets/images/profile.jpeg', password: 'emily12'),
  User(code: 'james002', name: 'James', image: null, password: 'james34'),
  User(code: 'rachel003', name: 'Rachel', image: null, password: 'rachel56'),
  User(code: 'bobby004', name: 'Bobby', image: null, password: 'bobby78' ),
];
