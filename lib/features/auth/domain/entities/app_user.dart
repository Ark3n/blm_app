class AppUser {
  final String uid;
  final String email;

  const AppUser({
    required this.uid,
    required this.email,
  });

  //* Convert app user -> to json
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
    };
  }

  //* Convert json -> AppUser
  factory AppUser.fromJson(Map<String, dynamic> jsonUser) {
    return AppUser(
      uid: jsonUser['uid'],
      email: jsonUser['email'],
    );
  }
}
