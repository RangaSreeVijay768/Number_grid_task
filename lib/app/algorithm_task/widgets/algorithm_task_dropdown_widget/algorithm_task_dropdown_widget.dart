import 'package:basic/app/themes/borders.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../themes/app_colors.dart';
import 'algorithm_task_dropdown_widget_controller.dart';
import 'algorithm_task_dropdown_widget_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class AlgorithmTaskDropdownWidget
    extends BaseStatelessWidget<
        AlgorithmTaskDropdownWidgetController,
        AlgorithmTaskDropdownWidgetCubit,
        AlgorithmTaskDropdownWidgetState> {
  final String selectedRule;
  final Function(String) onRuleChanged;

  const AlgorithmTaskDropdownWidget(
      {super.key, super.controller, super.onStateChanged, required this.selectedRule, required this.onRuleChanged});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlgorithmTaskDropdownWidgetCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          AlgorithmTaskDropdownWidgetCubit,
          AlgorithmTaskDropdownWidgetState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          return Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius.br_100,
              border: borders.b_3px_green
            ),
            child: PopupMenuButton(
              icon: const Icon(
                Icons.menu,
                color: AppColors.textHeading,
              ),
              onSelected: onRuleChanged,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 'odd',
                    child: Text('Odd Numbers'),
                  ),
                  PopupMenuItem(
                    value: 'even',
                    child: Text('Even Numbers'),
                  ),
                  PopupMenuItem(
                    value: 'prime',
                    child: Text('Prime Numbers'),
                  ),
                  PopupMenuItem(
                    value: 'fibonacci',
                    child: Text('Fibonacci Numbers'),
                  ),
                ];
              },
            ),
          );},
      ),
    );
  }

  @override
  AlgorithmTaskDropdownWidgetCubit createCubitAndAssignToController(
      BuildContext context) {
    AlgorithmTaskDropdownWidgetCubit cubit = AlgorithmTaskDropdownWidgetCubit(
        context: context);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
