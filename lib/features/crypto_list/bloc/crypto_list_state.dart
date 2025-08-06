part of 'crypto_list_bloc.dart';

sealed class CryptoListState extends Equatable {
  const CryptoListState();
}

final class CryptoListInitial extends CryptoListState {
  @override
  List<Object> get props => [];
}

final class CryptoListProgressState extends CryptoListState {
  @override
  List<Object> get props => [];
}

final class CryptoListDataReceivedState extends CryptoListState {
  final List<CoinDataDto> coins;

  const CryptoListDataReceivedState({required this.coins});

  @override
  List<Object> get props => [coins];
}

final class CryptoListErrorReceivedState extends CryptoListState {
  final ApiErrorDto error;

  const CryptoListErrorReceivedState({required this.error});

  @override
  List<Object> get props => [error];
}
