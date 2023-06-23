import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;
  final List<Machine> machines;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.address,
    required this.type,
    required this.token,
    required this.machines,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
      'machines': machines.map((machine) => machine.toMap()).toList(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      address: map['address'] ?? '',
      type: map['type'] ?? '',
      token: map['token'] ?? '',
      machines: List<Machine>.from(
        map['machines']?.map((machine) => Machine.fromMap(machine)) ?? [],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}

class Machine {
  final String name;
  final String location;

  Machine({
    required this.name,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'location': location,
    };
  }

  factory Machine.fromMap(Map<String, dynamic> map) {
    return Machine(
      name: map['name'] ?? '',
      location: map['location'] ?? '',
    );
  }
}
