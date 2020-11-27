import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


User currentUser = User(0, 'Chihiro N', null, 'c12345', 'chihiro@gmail.com');

List<User> _list = [];
int index;
bool flag;

class User {
  final int id;
  String name;
  String image;
  String password;
  String email;
  User(this.id, this.name, this.image, this.password, this.email);


  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'image': image, 'password': password, 'email': email};
  }
}

getDatabase() async {
  var database = openDatabase(
    join(await getDatabasesPath(), 'User_database.db'),
    onCreate: (db, version){
      return db.execute(
          "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT, image TEXT, password TEXT, email TEXT);"
      );
    },
    version: 1,
  );
  return database;
}

Future<void> insertUser(User user) async {
  var flag = await checkUser(user.email);
  if(flag == false)
    {
      final Database db = await getDatabase();
      await db.insert('users', user.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
      _list.add(user);
    }
}
Future<void> updateUser(User user) async {
  final db = await getDatabase();
  await db.update('users', user.toMap(), where: "id = ?", whereArgs: [user.id]);
}
Future<void> deleteUser(int id) async {
  final db = await getDatabase();
  await db.delete('users', where: "id = ?", whereArgs: [id]);
}
Future<bool> checkUser(String email) async {
  final db = await getDatabase();
  var result = await db.rawQuery("SELECT * FROM users WHERE email = $email");
  if(result.length > 0)
    {
      return true;
    }
  return false;
}
Future<User> login(String email, String password) async {
  final db = await getDatabase();
  var result = await db.rawQuery("SELECT * FROM users WHERE email = $email AND password = $password");
  if(result.length > 0)
  {
    return result.first;
  }
  return null;
}
Future<int> getIndex() async {
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> maps = await db.query('users');
  var num = maps.length;
  if(num > 0){
    index += 1;
  }
  else{
    index = 0;
  }
  return index;
}
Future<List<User>> getUsers() async{
  final Database db = await getDatabase();
  final List<Map<String, dynamic>> maps = await db.query('users');
  return List.generate(maps.length, (index){
    return User(maps[index]['id'],  maps[index]['name'], maps[index]['image'], maps[index]['password'], maps[index]['email']);
  });
}


