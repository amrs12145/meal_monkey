
class User
{
  final String name;
  final String email;
  final String? mobile;
  final String? address;
  final String password;

  User({required this.name, required this.email, this.mobile, this.address, required this.password});

  factory User.fromJson( Map<String,dynamic> json )
  {
    return User(
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      address: json['address'],
      password: json['password']
    );
  }

  Map<String,dynamic > toJson()
  {
    return {
      'name':     name,
      'email':    email,
      'mobile':   mobile,
      'address':  address,
      'password': password
    };
  }
  
}