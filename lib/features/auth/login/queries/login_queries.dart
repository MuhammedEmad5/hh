class LoginQueries {
  static String login(String email, String pass) {
    //todo fix locale password1 and password2
    return "SELECT * FROM Person WHERE logger = '$email'";
  }
}