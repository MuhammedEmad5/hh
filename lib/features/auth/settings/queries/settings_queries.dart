class SettingsQueries {
  static const getAllDb =
      "SELECT name FROM sys.databases WHERE name!='master' and CASE WHEN state_desc = 'ONLINE' THEN OBJECT_ID(QUOTENAME(name) + '.[dbo].[ClientVendor]', 'U')END IS NOT NULL";

}