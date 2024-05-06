import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'mapper.auto_mappr.dart';



void main() {

  final mapper = Mappr();
  WholeUser wholeUser = mapper.convert(PartUser(name: "shehab", id: 20));
  print(wholeUser.tnull);

}

@AutoMappr([MapType<PartUser, WholeUser>(

  fields: [
    Field('name2', from: 'name'),
  ]
)])
class Mappr extends $Mappr {




}



class PartUser {
  final String name;
  final int id;

  PartUser({required this.name, required this.id});
}

@JsonSerializable()
class WholeUser {

  final String name2;
  final int id;
   final int salary;

   final String? tnull;


  WholeUser({
    required this.name2,
    required this.id,
      this.salary = 10,
    this.tnull

  });


}



