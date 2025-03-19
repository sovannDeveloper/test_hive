import 'package:objectbox/objectbox.dart';

@Entity()
class Announcement {
  @Id()
  int id;

  String? db;
  String? type;
  String? title;
  String? titleEnglish;
  String? description;
  String? descriptionEnglish;
  String? thumbNail;
  int? onTop;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;
  String? updateOrCreateDate;
  int? recordCount;
  int? seenCount;

  @Backlink('announcement')
  final images = ToMany<AnnouncementImage>();

  Announcement({
    this.id = 0,
    this.db,
    this.type,
    this.title,
    this.titleEnglish,
    this.description,
    this.descriptionEnglish,
    this.thumbNail,
    this.onTop,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
    this.updateOrCreateDate,
    this.recordCount,
    this.seenCount,
  });

  // Helper method to create an Announcement from JSON
  factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
        id: json['Id'] as int? ?? 0,
        db: json['Db'] as String?,
        type: json['Type'] as String?,
        title: json['Title'] as String?,
        titleEnglish: json['TitleEnglish'] as String?,
        description: json['Description'] as String?,
        descriptionEnglish: json['DescriptionEnglish'] as String?,
        thumbNail: json['ThumbNail'] as String?,
        onTop: json['OnTop'] as int?,
        createdBy: json['CreatedBy'] as String?,
        createdDate: json['CreatedDate'] as String?,
        updatedBy: json['UpdatedBy'] as String?,
        updatedDate: json['UpdatedDate'] as String?,
        updateOrCreateDate: json['UpdateOrCreateDate'] as String?,
        recordCount: json['RecordCount'] as int?,
        seenCount: json['SeenCount'] as int?,
      );
}

@Entity()
class AnnouncementImage {
  @Id()
  int id = 0;

  String? announcementId;
  String? path;
  String? createdBy;
  String? createdDate;
  String? updatedBy;
  String? updatedDate;

  final announcement = ToOne<Announcement>();

  AnnouncementImage({
    this.id = 0,
    this.announcementId,
    this.path,
    this.createdBy,
    this.createdDate,
    this.updatedBy,
    this.updatedDate,
  });

  // Helper method to create an AnnouncementImage from JSON
  factory AnnouncementImage.fromJson(Map<String, dynamic> json) => AnnouncementImage(
        id: json['Id'] as int? ?? 0,
        announcementId: json['AnnouncementId'] as String?,
        path: json['Path'] as String?,
        createdBy: json['CreatedBy'] as String?,
        createdDate: json['CreatedDate'] as String?,
        updatedBy: json['UpdatedBy'] as String?,
        updatedDate: json['UpdatedDate'] as String?,
      );
}
