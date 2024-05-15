abstract class IUserOptionsRepo{

  void insertStartPageThemes(int startPageTheme ,String key);
  void insertStartListThemes( int startListTheme,String key);
   Future<int?> getStartPageThemes(String key);
   Future<int?> getStartListThemes( String key);


}