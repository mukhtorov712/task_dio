part of 'home_bloc.dart';

enum FetchDataStatus { initial, loading, success, error }

class HomeState {
  final List<DataModel> list;
  final FetchDataStatus status;
  final String errorMessage;

  HomeState({
    this.list = const [],
    this.status = FetchDataStatus.initial,
    this.errorMessage = 'Some Error',
  });

  HomeState copyWith({
    List<DataModel>? list,
    FetchDataStatus? status,
    String? errorMessage,
  }) =>
      HomeState(
        list: list ?? this.list,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
