import 'package:json_annotation/json_annotation.dart';
part 'documents_list_response.g.dart';

@JsonSerializable(explicitToJson: true)
class DocumentsList {
  final int status;
  final DocumentsListResponse response;
  DocumentsList({
    required this.status,
    required this.response,
  });

  factory DocumentsList.fromJson(Map<String, dynamic> json) =>
      _$DocumentsListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$DocumentsListResponseToJson(this);
}

@JsonSerializable()
class DocumentsListResponse {
  final List<DocumentOnlyOffice> files;
  final List<FolderOnlyOffice> folders;
  final Current current;
  // final PathParts pathParts;
  final int startIndex;
  final int count;
  final int total;
  DocumentsListResponse({
    required this.files,
    required this.folders,
    required this.current,
    // required this.pathParts,
    required this.startIndex,
    required this.count,
    required this.total,
  });

  factory DocumentsListResponse.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable()
class DocumentOnlyOffice {
  final int folderId;
  final int version;
  final int versionGroup;
  final String contentLength;
  final int pureContentLength;
  final int fileStatus;
  final String viewUrl;
  final int fileType;
  final String fileExst;
  final String? comment;
  final int id;
  final String title;
  final int access;
  final bool shared;
  final int rootFolderType;
  final UpdatedBy updatedBy;
  final DateTime created;
  final CreatedBy createdBy;
  final DateTime updated;
  DocumentOnlyOffice({
    required this.folderId,
    required this.version,
    required this.versionGroup,
    required this.contentLength,
    required this.pureContentLength,
    required this.fileStatus,
    required this.viewUrl,
    required this.fileType,
    required this.fileExst,
    this.comment,
    required this.id,
    required this.title,
    required this.access,
    required this.shared,
    required this.rootFolderType,
    required this.updatedBy,
    required this.created,
    required this.createdBy,
    required this.updated,
  });

  factory DocumentOnlyOffice.fromJson(Map<String, dynamic> json) =>
      _$FileFromJson(json);
  Map<String, dynamic> toJson() => _$FileToJson(this);
}

@JsonSerializable()
class UpdatedBy {
  final String id;
  final String displayName;
  final String? title;
  final String avatarSmall;
  final String profileUrl;
  UpdatedBy({
    required this.id,
    required this.displayName,
    this.title,
    required this.avatarSmall,
    required this.profileUrl,
  });

  factory UpdatedBy.fromJson(Map<String, dynamic> json) =>
      _$UpdatedByFromJson(json);
  Map<String, dynamic> toJson() => _$UpdatedByToJson(this);
}

@JsonSerializable()
class CreatedBy {
  final String id;
  final String displayName;
  final String? title;
  final String avatarSmall;
  final String profileUrl;
  CreatedBy({
    required this.id,
    required this.displayName,
    this.title,
    required this.avatarSmall,
    required this.profileUrl,
  });
  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);
  Map<String, dynamic> toJson() => _$CreatedByToJson(this);
}

@JsonSerializable()
class FolderOnlyOffice {
  final int parentId;
  final int filesCount;
  final int foldersCount;
  final int id;
  final String title;
  final int access;
  final bool shared;
  final int rootFolderType;
  final UpdatedBy updatedBy;
  final DateTime created;
  final CreatedBy createdBy;
  final DateTime updated;
  FolderOnlyOffice({
    required this.parentId,
    required this.filesCount,
    required this.foldersCount,
    required this.id,
    required this.title,
    required this.access,
    required this.shared,
    required this.rootFolderType,
    required this.updatedBy,
    required this.created,
    required this.createdBy,
    required this.updated,
  });

  factory FolderOnlyOffice.fromJson(Map<String, dynamic> json) =>
      _$FolderFromJson(json);
  Map<String, dynamic> toJson() => _$FolderToJson(this);
}

@JsonSerializable()
class Current {
  final int parentId;
  final int filesCount;
  final int foldersCount;
  final int id;
  final String title;
  final int access;
  final bool shared;
  final int rootFolderType;
  final UpdatedBy updatedBy;
  final DateTime created;
  final CreatedBy createdBy;
  final DateTime updated;
  Current({
    required this.parentId,
    required this.filesCount,
    required this.foldersCount,
    required this.id,
    required this.title,
    required this.access,
    required this.shared,
    required this.rootFolderType,
    required this.updatedBy,
    required this.created,
    required this.createdBy,
    required this.updated,
  });

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

// @JsonSerializable()
// class PathParts {
//   final String key;
//   final String path;
//   PathParts({
//     required this.key,
//     required this.path,
//   });

//   factory PathParts.fromJson(Map<String, dynamic> json) =>
//       _$PathPartsFromJson(json);

//   Map<String, dynamic> toJson() => _$PathPartsToJson(this);
// }
