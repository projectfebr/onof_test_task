import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable(explicitToJson: true)
class UserProfile {
  final int status;
  final ResponseProfile response;
  UserProfile({
    required this.status,
    required this.response,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}

@JsonSerializable()
class ResponseProfile {
  // final String id;
  final String userName;
  // final bool isVisitor;
  final String firstName;
  final String lastName;
  final String email;
  // final DateTime? birthday;
  // final String sex;
  // final int status;
  // final int activationStatus;
  // final String? terminated;
  // final String department;
  // final DateTime workFrom;
  // final String location;
  // final String notes;
  // final String? displayName;
  // final String title;
  // final List<Contact> contacts;
  // final List<Group> groups;
  final String avatarMedium;
  final String avatar;
  // final bool isAdmin;
  // final bool isLDAP;
  // final List<String> listAdminModules;
  // final bool isOwner;
  // final String cultureName;
  // final bool isSSO;
  final String avatarSmall;
  // final String profileUrl;
  ResponseProfile({
    // required this.id,
    required this.userName,
    // required this.isVisitor,
    required this.firstName,
    required this.lastName,
    required this.email,
    // required this.birthday,
    // required this.sex,
    // required this.status,
    // required this.activationStatus,
    // this.terminated,
    // required this.department,
    // required this.workFrom,
    // required this.location,
    // required this.notes,
    // this.displayName,
    // required this.title,
    // required this.contacts,
    // required this.groups,
    required this.avatarMedium,
    required this.avatar,
    // required this.isAdmin,
    // required this.isLDAP,
    // required this.listAdminModules,
    // required this.isOwner,
    // required this.cultureName,
    // required this.isSSO,
    required this.avatarSmall,
    // required this.profileUrl,
  });

  factory ResponseProfile.fromJson(Map<String, dynamic> json) =>
      _$ResponseProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseProfileToJson(this);
}

@JsonSerializable()
class Contact {
  final String type;
  final String value;
  Contact({
    required this.type,
    required this.value,
  });

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}

@JsonSerializable()
class Group {
  final String id;
  final String name;
  final String manager;
  Group({
    required this.id,
    required this.name,
    required this.manager,
  });

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
