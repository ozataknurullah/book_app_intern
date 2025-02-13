class BookCoverModel {
  final String fileName;

  BookCoverModel({required this.fileName});

  factory BookCoverModel.fromJson(Map<String, dynamic> json) {
    return BookCoverModel(fileName: json['fileName'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      "fileName": fileName,
    };
  }
}
