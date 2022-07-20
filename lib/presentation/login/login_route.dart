// Flutter imports:
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:clean_architechture/app/app.dart';
import 'package:clean_architechture/domain/login/repositories/login_repository.dart';
import 'package:clean_architechture/domain/login/usecases/login_usecase.dart';
import 'package:clean_architechture/presentation/login/bloc/login_bloc.dart';
import 'package:clean_architechture/presentation/login/ui/login_screen.dart';

class LoginRoute {
  static Widget get route => BlocProvider(
        create: (context) => LoginBloc(
          LoginUseCase(
            getIt<LoginRepository>(),
          ),
        ),
        child: const LoginScreen(),
      );
}
