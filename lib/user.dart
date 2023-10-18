import 'package:json_annotation/json_annotation.dart';
    part 'user.g.dart';

@JsonSerializable()
class User{
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name:'name')
  String? name;

  @JsonKey(name:'email')
  String? email; 

  @JsonKey(name: 'gender')
  String? gender;

  @JsonKey(name: 'status')
  String? status;

  User({this.id, this.name, this.email, this.gender, this.status});
factory User.fromJson(Map<String,dynamic> json)=>_$UserFromJson(json);
Map<String,dynamic> toJson()=>_$UserToJson(this);

}