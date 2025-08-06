import 'package:cryptomoney/features/crypto_list/view/blur_effect_widget.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../resources/app_colors.dart';

class ProgressWidget<
  EVENT extends Equatable,
  STATE extends Equatable,
  PROGRESS_STATE extends STATE,
  BLOC extends Bloc<EVENT, STATE>
>
    extends StatelessWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BLOC, STATE>(
      buildWhen:
          (previous, current) =>
              previous is PROGRESS_STATE || current is PROGRESS_STATE,
      builder: (context, state) {
        if (state is PROGRESS_STATE) {
          return const _ProgressWidget();
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _ProgressWidget extends StatelessWidget {
  const _ProgressWidget();

  @override
  Widget build(BuildContext context) {
    return BlurryEffect(
      child: Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      ),
    );
  }
}
