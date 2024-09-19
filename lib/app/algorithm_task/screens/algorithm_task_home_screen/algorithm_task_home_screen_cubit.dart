import 'package:basic/app/algorithm_task/widgets/algorithm_task_algorithm_methods/algorithm_task_algorithm_methods.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';
import 'package:fibonacci/fibonacci.dart';
import 'package:is_prime_number/is_prime_number.dart';
import 'package:get_it/get_it.dart';

part 'algorithm_task_home_screen_state.dart';

part 'algorithm_task_home_screen_cubit.freezed.dart';

class AlgorithmTaskHomeScreenCubit
    extends BaseCubit<AlgorithmTaskHomeScreenState> {
  AlgorithmTaskHomeScreenCubit({required super.context, required List<int> numbers})
      : super(initialState: AlgorithmTaskHomeScreenState.initial(numbers: numbers, selectedRule: 'none'));

  void setRule(String rule) {
    emit(state.copyWith(selectedRule: rule));
  }

  bool isHighlighted(int number) {
    switch (state.selectedRule) {
      case 'odd':
        return number.isOdd;
      case 'even':
        return number.isEven;
      case 'prime':
        return Methods.checkPrime(number);
      case 'fibonacci':
        return Methods.checkFibonacci(number);
      default:
        return false;
    }
  }

  String getRuleName() {
    switch (state.selectedRule) {
      case 'odd':
        return 'Odd Numbers';
      case 'even':
        return 'Even Numbers';
      case 'prime':
        return 'Prime Numbers';
      case 'fibonacci':
        return 'Fibonacci Numbers';
      default:
        return 'None';
    }
  }
}
