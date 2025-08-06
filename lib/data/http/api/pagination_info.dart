import 'package:equatable/equatable.dart';

class PaginationInfo extends Equatable {
  final bool canLoadMore;
  final int lastLoadedPage;

  const PaginationInfo({
    required this.canLoadMore,
    required this.lastLoadedPage,
  });

  factory PaginationInfo.initial() =>
      const PaginationInfo(canLoadMore: true, lastLoadedPage: 0);

  PaginationInfo copyWith({bool? canLoadMore, int? lastLoadedPage}) {
    return PaginationInfo(
      canLoadMore: canLoadMore ?? this.canLoadMore,
      lastLoadedPage: lastLoadedPage ?? this.lastLoadedPage,
    );
  }

  @override
  List<Object?> get props => [canLoadMore, lastLoadedPage];
}
