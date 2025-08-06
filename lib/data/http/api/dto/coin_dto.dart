import 'package:equatable/equatable.dart';

import '../models/coin_data.dart';

class CoinDataDto extends Equatable {
  final String id;
  final String symbol;
  final String priceUsd;

  const CoinDataDto({
    required this.id,
    required this.symbol,
    required this.priceUsd,
  });

  factory CoinDataDto.fromApi({required CoinData coin}) {
    return CoinDataDto(
      id: coin.id,
      symbol: coin.symbol,
      priceUsd: _roundPrice(coin.priceUsd),
    );
  }

  @override
  List<Object> get props => [id, symbol, priceUsd];

  static String _roundPrice(String price) {
    try {
      double value = double.parse(price);
      final rounded = ((value * 100).roundToDouble() / 100).toStringAsFixed(2);
      List<String> parts = rounded.split('.');
      String integerPart = parts[0];
      String decimalPart = parts[1];

      String formatted = '';
      for (int i = 0; i < integerPart.length; i++) {
        if (i > 0 && (integerPart.length - i) % 3 == 0) {
          formatted += ',';
        }
        formatted += integerPart[i];
      }
      return '\$$formatted.$decimalPart';
    } on FormatException {
      return '-';
    }
  }
}
