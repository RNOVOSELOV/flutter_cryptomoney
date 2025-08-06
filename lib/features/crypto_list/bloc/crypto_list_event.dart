part of 'crypto_list_bloc.dart';

sealed class CryptoListEvent extends Equatable {
  const CryptoListEvent();
}

final class CryptoListPageLoadedEvent extends CryptoListEvent {
  const CryptoListPageLoadedEvent();

  @override
  List<Object?> get props => [];
}
final class CryptoNeedDataEvent extends CryptoListEvent {
  const CryptoNeedDataEvent();

  @override
  List<Object?> get props => [];
}