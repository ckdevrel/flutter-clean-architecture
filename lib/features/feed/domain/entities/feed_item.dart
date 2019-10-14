import 'package:meta/meta.dart';

class FeedItem  {
  final int id;
  final String name;
  final String imageUrl;
  final String profileImageUrl;
  final String description;

  FeedItem({
    @required this.id,
    @required this.name,
    @required this.imageUrl,
    @required this.profileImageUrl,
    @required this.description,
  });
}
