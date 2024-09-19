import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';

import 'package:get_it/get_it.dart';

part 'algorithm_task_dropdown_widget_state.dart';

part 'algorithm_task_dropdown_widget_cubit.freezed.dart';

class AlgorithmTaskDropdownWidgetCubit
    extends BaseCubit<AlgorithmTaskDropdownWidgetState> {
  AlgorithmTaskDropdownWidgetCubit({required super.context})
      : super(initialState: AlgorithmTaskDropdownWidgetState.initial(selectedRule: 'none'));

  setRule(String rule) {
    emit(state.copyWith(selectedRule: rule));
  }
}
