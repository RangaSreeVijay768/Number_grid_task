import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:basic/app/core/blocs/base_cubit.dart';

import 'package:get_it/get_it.dart';

part 'algorithm_task_number_grid_widget_state.dart';

part 'algorithm_task_number_grid_widget_cubit.freezed.dart';

class AlgorithmTaskNumberGridWidgetCubit
    extends BaseCubit<AlgorithmTaskNumberGridWidgetState> {
  AlgorithmTaskNumberGridWidgetCubit({required super.context})
      : super(initialState: AlgorithmTaskNumberGridWidgetState.initial());
}
