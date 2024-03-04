class UserInfo {
  static UserInfo obj = UserInfo();
  static UserInfo getObject() {
    return obj;
  }

  Map<String, Map<String, String>> userInfo = {
    'prasadzadokar': {'password': '2525', 'contact': '8956652382'},
    'amit': {'password': '2004', 'contact': '1478523698'},
  };

  String? getPassword({required String username}) {
    print(obj.userInfo[username]!['password']);
    return obj.userInfo[username]!['password'];
  }

  bool isUserpresent({required String username}) {
    if (obj.userInfo.containsKey(username)) {
      return true;
    }
    return false;
  }

  bool addUser({
    required String username,
    required String password,
    required String contact,
  }) {
    if (!obj.isUserpresent(username: username)) {
      obj.userInfo.addAll({
        username: {'password': password, 'contact': contact}
      });
      return true;
    } else {
      return false;
    }
  }
}
