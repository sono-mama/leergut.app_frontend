// To parse this JSON data, do
//
//     final news = newsFromJson(jsonString);

import 'dart:convert';


import 'package:equatable/equatable.dart';


News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News extends Equatable{

  const News({
    required this.content,
    required this.pageable,
    required this.totalPages,
    required this.totalElements,
    required this.last,
    required this.size,
    required this.number,
    required this.sort,
    required this.numberOfElements, // how many news
    required this.first,
    required this.empty,
  });

  final List<Content> content;
  final Pageable pageable;
  final int totalPages;
  final int totalElements;
  final bool last;
  final int size;
  final int number;
  final Sort sort;
  final int numberOfElements;
  final bool first;
  final bool empty;

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

  @override
  List<Object?> get props => [content, pageable, totalPages, totalElements,
    last, size, number, sort, numberOfElements, first, empty];
}


class Content extends Equatable {
  const Content({
    required this.id,
    required this.heading,
    required this.subHeading,
    required this.content,
    required this.image,
    required this.author,
    required this.insertDate,
  });

  final int id;
  final String heading;
  final String subHeading;
  final String content;
  final String image;
  final String author;
  final DateTime insertDate;

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

  @override
  List<Object?> get props => [id, heading, subHeading, content, image, author, insertDate];
}

class Pageable extends Equatable {
  const Pageable({
    required this.sort,
    required this.offset,
    required this.pageNumber,
    required this.pageSize,
    required this.paged,
    required this.unpaged,
  });

  final Sort sort;
  final int offset;
  final int pageNumber;
  final int pageSize;
  final bool paged;
  final bool unpaged;

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

  @override
  List<Object?> get props => [sort, offset, pageNumber, pageSize, paged, unpaged];
}

class Sort extends Equatable{
  const Sort({
    required this.empty,
    required this.unsorted,
    required this.sorted,
  });

  final bool empty;
  final bool unsorted;
  final bool sorted;

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

  @override
  List<Object?> get props => [empty, unsorted, sorted];

}
