// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'bloc/list_user_bloc.dart';
import 'ui/list_user_screen.dart';

// Project imports:

class ListUserRoute {
  static Widget get route => BlocProvider(
        create: (context) => ListUserBloc()..add(GetListUser()),
        child: const ListUserScreen(),
      );
}
