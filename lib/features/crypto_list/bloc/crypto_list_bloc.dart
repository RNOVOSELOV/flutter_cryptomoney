import 'dart:async';

import 'package:cryptomoney/data/http/api/api_repository.dart';
import 'package:cryptomoney/data/http/api/api_service.dart';
import 'package:cryptomoney/data/http/dio_builder.dart';
import 'package:cryptomoney/data/http/token_interceptor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cryptomoney/data/http/api/dto/coin_dto.dart';
import 'package:equatable/equatable.dart';

import '../../../data/http/api/dto/error_dto.dart';
import '../../../data/http/api/pagination_info.dart';

part 'crypto_list_event.dart';

part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  late final ApiRepository _api;

  static const _limit = 15;
  PaginationInfo paginationInfo = PaginationInfo.initial();
  bool loading = false;

  CryptoListBloc() : super(CryptoListInitial()) {
    _api = ApiRepository(
      dataProvider: ApiService(
        dio:
            DioBuilder()
                .addHeaderParameters()
                .addAuthInterceptor(AuthTokenInterceptor())
                .build(),
      ),
    );

    on<CryptoListPageLoadedEvent>(_onPageLoadedEvent);
    on<CryptoNeedDataEvent>(_onNeedNewDataEvent);
  }

  FutureOr<void> _onPageLoadedEvent(
    final CryptoListPageLoadedEvent event,
    final Emitter<CryptoListState> emit,
  ) async {
    await _getCoinsData(emit);
  }

  FutureOr<void> _onNeedNewDataEvent(
    final CryptoNeedDataEvent event,
    final Emitter<CryptoListState> emit,
  ) async {
    await _getCoinsData(emit);
  }

  Future<void> _getCoinsData(Emitter<CryptoListState> emit) async {
    if (loading) {
      return;
    }
    if (!paginationInfo.canLoadMore) {
      return;
    }
    loading = true;
    emit(CryptoListProgressState());
    final data = await _api.getInfo(
      limit: _limit,
      offset: paginationInfo.lastLoadedPage * _limit,
    );
    if (data.isRight) {
      final canLoadMore = data.right.length == _limit;
      paginationInfo = paginationInfo.copyWith(
        canLoadMore: canLoadMore,
        lastLoadedPage: paginationInfo.lastLoadedPage + 1,
      );
      emit(CryptoListDataReceivedState(coins: data.right));
    } else {
      emit(CryptoListErrorReceivedState(error: data.left));
    }
    loading = false;
  }
}
