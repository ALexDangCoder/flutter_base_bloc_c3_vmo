// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:clean_architechture/presentation/list_user/bloc/list_user_bloc.dart';
import 'package:clean_architechture/presentation/list_user/ui/list_user_screen.dart';

class ListUserRoute {
  static Widget get route => BlocProvider(
        create: (context) => ListUserBloc()..add(GetListUser()),
        child: const ListUserScreen(),
      );
}
