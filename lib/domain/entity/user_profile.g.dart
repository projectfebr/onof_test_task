// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      status: json['status'] as int,
      response:
          ResponseProfile.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'status': instance.status,
      'response': instance.response.toJson(),
    };

ResponseProfile _$ResponseProfileFromJson(Map<String, dynamic> json) =>
    ResponseProfile(
      userName: json['userName'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      avatarMedium: json['avatarMedium'] as String,
      avatar: json['avatar'] as String,
      avatarSmall: json['avatarSmall'] as String,
    );

Map<String, dynamic> _$ResponseProfileToJson(ResponseProfile instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'avatarMedium': instance.avatarMedium,
      'avatar': instance.avatar,
      'avatarSmall': instance.avatarSmall,
    };

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      type: json['type'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'type': instance.type,
      'value': instance.value,
    };

Group _$GroupFromJson(Map<String, dynamic> json) => Group(
      id: json['id'] as String,
      name: json['name'] as String,
      manager: json['manager'] as String,
    );

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'manager': instance.manager,
    };
