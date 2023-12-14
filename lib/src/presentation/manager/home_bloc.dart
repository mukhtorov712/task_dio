import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:task_dio/src/api_service/api_service.dart';

import '../../models/data_model.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ApiService _apiService;

  HomeBloc(
    this._apiService,
  ) : super(HomeState()) {
    on<FetchDataEvent>((event, emit) async {
      await emit.onEach(_onFetchData(event), onData: emit);
    });
  }

  fetchData() {
    add(FetchDataEvent());
  }

  Stream<HomeState> _onFetchData(FetchDataEvent event) async* {
    yield state.copyWith(status: FetchDataStatus.loading);

    final dataState = await _apiService.fetchDataNew();

    yield state.copyWith(status: FetchDataStatus.success, list: dataState);

    // if (dataState is DataSuccess) {
    //   yield state.copyWith(status: FetchDataStatus.success, list: dataState.data);
    // } else if (dataState is DataFailed) {
    //   yield state.copyWith(status: FetchDataStatus.error, errorMessage: dataState.message);
    // }
  }
}
