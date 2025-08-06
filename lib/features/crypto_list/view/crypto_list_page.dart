import 'package:cryptomoney/data/http/api/dto/coin_dto.dart';
import 'package:cryptomoney/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:cryptomoney/features/crypto_list/view/progress_widget.dart';
import 'package:cryptomoney/resources/app_colors.dart';
import 'package:cryptomoney/theme/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CryptoListPage extends StatefulWidget {
  const CryptoListPage({super.key});

  @override
  State<CryptoListPage> createState() => _CryptoListPageState();
}

class _CryptoListPageState extends State<CryptoListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CryptoListBloc()..add(CryptoListPageLoadedEvent()),
      child: _CryptoListWidget(),
    );
  }
}

class _CryptoListWidget extends StatelessWidget {
  const _CryptoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Stack(
        children: [
          _CoinsListWidget(),
          const ProgressWidget<
            CryptoListEvent,
            CryptoListState,
            CryptoListProgressState,
            CryptoListBloc
          >(),
        ],
      ),
    );
  }
}

class _CoinsListWidget extends StatefulWidget {
  const _CoinsListWidget({super.key});

  @override
  State<_CoinsListWidget> createState() => _CoinsListWidgetState();
}

class _CoinsListWidgetState extends State<_CoinsListWidget> {
  late final List<({CoinDataDto coin, Color color})> coins;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    coins = [];

    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.addListener(() {
        if (_scrollController.position.extentAfter < 500) {
          context.read<CryptoListBloc>().add(CryptoNeedDataEvent());
        }
      }),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoListBloc, CryptoListState>(
      builder: (context, state) {
        if (state is CryptoListDataReceivedState) {
          coins.addAll(state.coins);
        } else if (state is CryptoListErrorReceivedState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Text(
                'Ошибка получения данных\n\nПроверьте наличие crypto.env файла в корне проекта c содержимым в формате:\n'
                'AUTH_TOKEN=YOUR_AUTH_TOKEN',
                textAlign: TextAlign.center,
                style: context.theme.cryptoText,
              ),
            ),
          );
        }
        return coins.isEmpty
            ? SizedBox.shrink()
            : ListView.builder(
              controller: _scrollController,
              itemCount: coins.length,
              itemBuilder: (context, index) {
                return CoinItemWidget(
                  key: ValueKey(index),
                  coin: coins.elementAt(index).coin,
                  color: coins.elementAt(index).color,
                );
              },
            );
      },
    );
  }
}

class CoinItemWidget extends StatelessWidget {
  const CoinItemWidget({super.key, required this.coin, required this.color});

  final CoinDataDto coin;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                ),
              ),
              SizedBox(width: 16),
              Text(coin.symbol.toUpperCase(), style: context.theme.cryptoText),
            ],
          ),
          Text(coin.priceUsd.toUpperCase(), style: context.theme.cryptoText),
        ],
      ),
    );
  }
}

/*

 */
