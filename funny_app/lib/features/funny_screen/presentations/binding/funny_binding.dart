import 'package:flutter/material.dart';
import 'package:funny_app/features/funny_screen/data/funny_repository.dart';
import 'package:funny_app/features/funny_screen/presentations/bloc/funny_bloc.dart';

class FunnyBinding {
  static FunnyBloc generateBloc(BuildContext context) {
    return FunnyBloc(
      repository: FunnyRepository(),
    );
  }
}
