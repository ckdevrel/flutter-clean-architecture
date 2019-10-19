import 'package:flutter_clean_architecture/features/feed/domain/entities/feed_item.dart';

abstract class FeedsState {}

class FeedsInitial extends FeedsState {}

class FeedsLoading extends FeedsState {}

class FeedsLoaded extends FeedsState {
  final List<FeedItem> feedItems;
  FeedsLoaded(this.feedItems);
}

class FeedsError extends FeedsState {
  final String message;
  FeedsError(this.message);
}
