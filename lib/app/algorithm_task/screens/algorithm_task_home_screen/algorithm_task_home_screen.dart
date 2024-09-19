import 'package:basic/app/algorithm_task/widgets/algorithm_task_dropdown_widget/algorithm_task_dropdown_widget.dart';
import 'package:basic/app/algorithm_task/widgets/algorithm_task_number_grid_widget/algorithm_task_number_grid_widget.dart';
import 'package:basic/app/themes/borders.dart';
import 'package:basic/app/themes/edge_insets.dart';
import 'package:basic/app/themes/fonts.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'algorithm_task_home_screen_controller.dart';
import 'algorithm_task_home_screen_cubit.dart';

import 'package:basic/app/core/widgets/base_stateless_widget.dart';

class AlgorithmTaskHomeScreen
    extends BaseStatelessWidget<
        AlgorithmTaskHomeScreenController,
        AlgorithmTaskHomeScreenCubit,
        AlgorithmTaskHomeScreenState> {

  AlgorithmTaskHomeScreen({Key? key, super.controller, super.onStateChanged})
      : super(key: key);

  final numbers= List.generate(100, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AlgorithmTaskHomeScreenCubit>(
      create: (context) => createCubitAndAssignToController(context),
      child: BlocConsumer<
          AlgorithmTaskHomeScreenCubit,
          AlgorithmTaskHomeScreenState>(
        listener: (context, state) {
          if (onStateChanged != null) {
            onStateChanged!(state);
          }
        },
        builder: (context, state) {
          initializeController(context);
          final highlightedNumbers = numbers.where((number) {
            return getCubit(context).isHighlighted(number);
          }).toList();

          return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Text("Number Grid", style: TextStyle(
                        fontWeight: Fonts.f500
                    ),),
                  ),
                  AlgorithmTaskDropdownWidget(
                      selectedRule: state.selectedRule,
                      onRuleChanged: (rule) {
                        getCubit(context).setRule(rule);
                      }
                  )
                ],
              ),
            ),
            body: Container(
              padding: edge_insets_16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  state.selectedRule != 'none'?
                  Container(
                    margin: edge_insets_b_24,
                    width: MediaQuery.sizeOf(context).width,
                    padding: edge_insets_10,
                    decoration: BoxDecoration(
                      border: borders.b_1px_bgPrimary,
                      borderRadius: borderRadius.br_10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          getCubit(context).getRuleName(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          highlightedNumbers.join(', '),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                  ) : Container(
                    margin: edge_insets_b_24,
                    width: MediaQuery.sizeOf(context).width,
                    padding: edge_insets_10,
                    decoration: BoxDecoration(
                      border: borders.b_1px_bgPrimary,
                      borderRadius: borderRadius.br_10,
                    ),
                    child: Text("Select from menu to view details"),
                  ),
                  Expanded(
                      child: AlgorithmTaskNumberGridWidget(
                        numbers: numbers,
                        isHighlighted: (number) => getCubit(context).isHighlighted(number),
                      )
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  AlgorithmTaskHomeScreenCubit createCubitAndAssignToController(
      BuildContext context) {
    AlgorithmTaskHomeScreenCubit cubit = AlgorithmTaskHomeScreenCubit(
        context: context, numbers: numbers);
    controller?.cubit = cubit;
    controller?.childContext = context;
    return cubit;
  }

}
