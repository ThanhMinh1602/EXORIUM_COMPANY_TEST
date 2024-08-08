import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:funny_app/features/funny_screen/presentations/binding/funny_binding.dart';
import 'package:funny_app/features/funny_screen/presentations/widgets/funny_widget.dart';

class FunnyPage extends StatelessWidget {
  const FunnyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BlocProvider(
      create: FunnyBinding.generateBloc,
      child: FunnyWidget(),
    );
  }
}
