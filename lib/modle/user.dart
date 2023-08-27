class Users{
  late int id;
  late String name;
  late String email;
  late String password;
  late String confirmPassword;
  late int phone;

  static const String tableName ='users';
  Users();


  //Read: Convert row map to user object
  Users.fromMap(Map<String , dynamic> rowMap){
    id = rowMap['id'];
    name = rowMap['name'];
    email = rowMap['email'];
    password = rowMap['password'];
    password = rowMap['confirmPassword'];
    password = rowMap['phone'];
  }

  //Store: convert object to map
  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = <String, dynamic>{};
    map['name']=name;
    map['email']=email;
    map['password']=password;
    map['confirmPassword']=confirmPassword;
    map['phone']=phone;
    return map ;

  }
}