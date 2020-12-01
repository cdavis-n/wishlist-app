

User currentUser;

List<User> database = [
  User(code: 'cs_481', name: 'Demo', image: 'assets/images/profile.jpeg', password: '12345'),
  User(code: 'emily001', name: 'Emily', image: 'assets/images/profile.jpeg', password: 'emily12'),
  User(code: 'james002', name: 'James', image: null, password: 'james34'),
  User(code: 'rachel003', name: 'Rachel', image: null, password: 'rachel56'),
  User(code: 'bobby004', name: 'Bobby', image: null, password: 'bobby78' ),
];
List<User> familyList = [
  User(code: 'emily001', name: 'Emily', image: 'assets/images/profile.jpeg', password: 'emily12'),
  User(code: 'james002', name: 'James', image: null, password: 'james34'),
  User(code: 'rachel003', name: 'Rachel', image: null, password: 'rachel56'),
  User(code: 'bobby004', name: 'Bobby', image: null, password: 'bobby78' ),
];

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
  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      code: data['code'],
      name: data['name'],
      image: data['image'],
      password: data['password'],
    );
  }
}
User login(String username, String password) {
  database.forEach((e) => username == e.code && password == e.password ? currentUser = e : null);
  return currentUser;
}
bool checkUsername(String username) {
  bool flag = true;
  if (database.isNotEmpty) {
    database.forEach((e) => (username == e.code) ? flag = false : true);
  }
  return flag;
}
void insertUser(User user) {
  database.add(user);
}





