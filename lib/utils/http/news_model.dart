// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';


News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
  News({
    required this.content,
    required this.pageable,
    required this.totalPages,
    required this.totalElements,
    required this.last,
    required this.size,
    required this.number,
    required this.sort,
    required this.numberOfElements,
    required this.first,
    required this.empty,
  });

  List<Content> content;
  Pageable pageable;
  int totalPages;
  int totalElements;
  bool last;
  int size;
  int number;
  Sort sort;
  int numberOfElements;
  bool first;
  bool empty;

  factory News.fromJson(Map<String, dynamic> json) => News(
    content: List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
    pageable: Pageable.fromJson(json["pageable"]),
    totalPages: json["totalPages"],
    totalElements: json["totalElements"],
    last: json["last"],
    size: json["size"],
    number: json["number"],
    sort: Sort.fromJson(json["sort"]),
    numberOfElements: json["numberOfElements"],
    first: json["first"],
    empty: json["empty"],
  );

  Map<String, dynamic> toJson() => {
    "content": List<dynamic>.from(content.map((x) => x.toJson())),
    "pageable": pageable.toJson(),
    "totalPages": totalPages,
    "totalElements": totalElements,
    "last": last,
    "size": size,
    "number": number,
    "sort": sort.toJson(),
    "numberOfElements": numberOfElements,
    "first": first,
    "empty": empty,
  };
}

class Content {
  Content({
    required this.id,
    required this.heading,
    required this.subHeading,
    required this.content,
    required this.image,
    required this.author,
    required this.insertDate,
  });

  int id;
  String heading;
  String subHeading;
  String content;
  String image;
  String author;
  DateTime insertDate;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
    id: json["id"],
    heading: json["heading"],
    subHeading: json["subHeading"],
    content: json["content"],
    image: json["image"],
    author: json["author"],
    insertDate: DateTime.parse(json["insertDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "heading": heading,
    "subHeading": subHeading,
    "content": content,
    "image": image,
    "author": author,
    "insertDate": insertDate.toIso8601String(),
  };
}

class Pageable {
  Pageable({
    required this.sort,
    required this.offset,
    required this.pageNumber,
    required this.pageSize,
    required this.paged,
    required this.unpaged,
  });

  Sort sort;
  int offset;
  int pageNumber;
  int pageSize;
  bool paged;
  bool unpaged;

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
    sort: Sort.fromJson(json["sort"]),
    offset: json["offset"],
    pageNumber: json["pageNumber"],
    pageSize: json["pageSize"],
    paged: json["paged"],
    unpaged: json["unpaged"],
  );

  Map<String, dynamic> toJson() => {
    "sort": sort.toJson(),
    "offset": offset,
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "paged": paged,
    "unpaged": unpaged,
  };
}

class Sort {
  Sort({
    required this.empty,
    required this.unsorted,
    required this.sorted,
  });

  bool empty;
  bool unsorted;
  bool sorted;

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
    empty: json["empty"],
    unsorted: json["unsorted"],
    sorted: json["sorted"],
  );

  Map<String, dynamic> toJson() => {
    "empty": empty,
    "unsorted": unsorted,
    "sorted": sorted,
  };

}
