part of 'algorithm_task_home_screen_cubit.dart';

@freezed
class AlgorithmTaskHomeScreenState with _$AlgorithmTaskHomeScreenState {
  const factory AlgorithmTaskHomeScreenState.initial({
    required List<int> numbers,
    required String selectedRule,
  }) = _Initial;
}
