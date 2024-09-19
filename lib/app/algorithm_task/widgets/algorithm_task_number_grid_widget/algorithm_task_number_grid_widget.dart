import 'package:basic/app/themes/app_colors.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'algorithm_task_number_grid_widget_controller.dart';
import 'algorithm_task_number_grid_widget_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class AlgorithmTaskNumberGridWidget
    extends BaseStatelessWidget<
        AlgorithmTaskNumberGridWidgetController,
        AlgorithmTaskNumberGridWidgetCubit,
        AlgorithmTaskNumberGridWidgetState> {
  final List<int> numbers;
  final Function(int) isHighlighted;

  const AlgorithmTaskNumberGridWidget(
      {super.key, super.controller, super.onStateChanged, required this.numbers, required this.isHighlighted});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlgorithmTaskNumberGridWidgetCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          AlgorithmTaskNumberGridWidgetCubit,
          AlgorithmTaskNumberGridWidgetState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 10,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: numbers.length,
            itemBuilder: (context, index) {
              final number = numbers[index];
              final highlighted = isHighlighted(number);
              return Container(
                decoration: BoxDecoration(
                  color: highlighted ? AppColors.coinProgress : AppColors.white,
                  border: borders.b_1px_bgPrimary,
                  borderRadius: borderRadius.br_5
                ),
                alignment: Alignment.center,
                child: Text(
                  number.toString(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              );
            },
          );
        },
      ),
    );
  }

  @override
  AlgorithmTaskNumberGridWidgetCubit createCubitAndAssignToController(
      BuildContext context) {
    AlgorithmTaskNumberGridWidgetCubit cubit = AlgorithmTaskNumberGridWidgetCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
