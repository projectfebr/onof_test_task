// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocumentsList _$DocumentsListResponseFromJson(Map<String, dynamic> json) =>
    DocumentsList(
      status: json['status'] as int,
      response: DocumentsListResponse.fromJson(
          json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DocumentsListResponseToJson(DocumentsList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'response': instance.response.toJson(),
    };

DocumentsListResponse _$ResponseFromJson(Map<String, dynamic> json) =>
    DocumentsListResponse(
      files: (json['files'] as List<dynamic>)
          .map((e) => DocumentOnlyOffice.fromJson(e as Map<String, dynamic>))
          .toList(),
      folders: (json['folders'] as List<dynamic>)
          .map((e) => FolderOnlyOffice.fromJson(e as Map<String, dynamic>))
          .toList(),
      current: Current.fromJson(json['current'] as Map<String, dynamic>),
      startIndex: json['startIndex'] as int,
      count: json['count'] as int,
      total: json['total'] as int,
    );

Map<String, dynamic> _$ResponseToJson(DocumentsListResponse instance) =>
    <String, dynamic>{
      'files': instance.files,
      'folders': instance.folders,
      'current': instance.current,
      'startIndex': instance.startIndex,
      'count': instance.count,
      'total': instance.total,
    };

DocumentOnlyOffice _$FileFromJson(Map<String, dynamic> json) =>
    DocumentOnlyOffice(
      folderId: json['folderId'] as int,
      version: json['version'] as int,
      versionGroup: json['versionGroup'] as int,
      contentLength: json['contentLength'] as String,
      pureContentLength: json['pureContentLength'] as int,
      fileStatus: json['fileStatus'] as int,
      viewUrl: json['viewUrl'] as String,
      fileType: json['fileType'] as int,
      fileExst: json['fileExst'] as String,
      comment: json['comment'] as String?,
      id: json['id'] as int,
      title: json['title'] as String,
      access: json['access'] as int,
      shared: json['shared'] as bool,
      rootFolderType: json['rootFolderType'] as int,
      updatedBy: UpdatedBy.fromJson(json['updatedBy'] as Map<String, dynamic>),
      created: DateTime.parse(json['created'] as String),
      createdBy: CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
      updated: DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$FileToJson(DocumentOnlyOffice instance) =>
    <String, dynamic>{
      'folderId': instance.folderId,
      'version': instance.version,
      'versionGroup': instance.versionGroup,
      'contentLength': instance.contentLength,
      'pureContentLength': instance.pureContentLength,
      'fileStatus': instance.fileStatus,
      'viewUrl': instance.viewUrl,
      'fileType': instance.fileType,
      'fileExst': instance.fileExst,
      'comment': instance.comment,
      'id': instance.id,
      'title': instance.title,
      'access': instance.access,
      'shared': instance.shared,
      'rootFolderType': instance.rootFolderType,
      'updatedBy': instance.updatedBy,
      'created': instance.created.toIso8601String(),
      'createdBy': instance.createdBy,
      'updated': instance.updated.toIso8601String(),
    };

UpdatedBy _$UpdatedByFromJson(Map<String, dynamic> json) => UpdatedBy(
      id: json['id'] as String,
      displayName: json['displayName'] as String,
      title: json['title'] as String?,
      avatarSmall: json['avatarSmall'] as String,
      profileUrl: json['profileUrl'] as String,
    );

Map<String, dynamic> _$UpdatedByToJson(UpdatedBy instance) => <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'title': instance.title,
      'avatarSmall': instance.avatarSmall,
      'profileUrl': instance.profileUrl,
    };

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) => CreatedBy(
      id: json['id'] as String,
      displayName: json['displayName'] as String,
      title: json['title'] as String?,
      avatarSmall: json['avatarSmall'] as String,
      profileUrl: json['profileUrl'] as String,
    );

Map<String, dynamic> _$CreatedByToJson(CreatedBy instance) => <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'title': instance.title,
      'avatarSmall': instance.avatarSmall,
      'profileUrl': instance.profileUrl,
    };

FolderOnlyOffice _$FolderFromJson(Map<String, dynamic> json) =>
    FolderOnlyOffice(
      parentId: json['parentId'] as int,
      filesCount: json['filesCount'] as int,
      foldersCount: json['foldersCount'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      access: json['access'] as int,
      shared: json['shared'] as bool,
      rootFolderType: json['rootFolderType'] as int,
      updatedBy: UpdatedBy.fromJson(json['updatedBy'] as Map<String, dynamic>),
      created: DateTime.parse(json['created'] as String),
      createdBy: CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
      updated: DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$FolderToJson(FolderOnlyOffice instance) =>
    <String, dynamic>{
      'parentId': instance.parentId,
      'filesCount': instance.filesCount,
      'foldersCount': instance.foldersCount,
      'id': instance.id,
      'title': instance.title,
      'access': instance.access,
      'shared': instance.shared,
      'rootFolderType': instance.rootFolderType,
      'updatedBy': instance.updatedBy,
      'created': instance.created.toIso8601String(),
      'createdBy': instance.createdBy,
      'updated': instance.updated.toIso8601String(),
    };

Current _$CurrentFromJson(Map<String, dynamic> json) => Current(
      parentId: json['parentId'] as int,
      filesCount: json['filesCount'] as int,
      foldersCount: json['foldersCount'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      access: json['access'] as int,
      shared: json['shared'] as bool,
      rootFolderType: json['rootFolderType'] as int,
      updatedBy: UpdatedBy.fromJson(json['updatedBy'] as Map<String, dynamic>),
      created: DateTime.parse(json['created'] as String),
      createdBy: CreatedBy.fromJson(json['createdBy'] as Map<String, dynamic>),
      updated: DateTime.parse(json['updated'] as String),
    );

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'parentId': instance.parentId,
      'filesCount': instance.filesCount,
      'foldersCount': instance.foldersCount,
      'id': instance.id,
      'title': instance.title,
      'access': instance.access,
      'shared': instance.shared,
      'rootFolderType': instance.rootFolderType,
      'updatedBy': instance.updatedBy,
      'created': instance.created.toIso8601String(),
      'createdBy': instance.createdBy,
      'updated': instance.updated.toIso8601String(),
    };
