class SqlQueries {
  static const getAllDb =
      "SELECT name FROM sys.databases WHERE name!='master' and CASE WHEN state_desc = 'ONLINE' THEN OBJECT_ID(QUOTENAME(name) + '.[dbo].[ClientVendor]', 'U')END IS NOT NULL";

  static String login(String email, String pass) {
    //todo fix locale password1 and password2
    return "SELECT * FROM Person WHERE logger = '$email'";
  }
}
