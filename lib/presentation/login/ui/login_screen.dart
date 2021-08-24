import 'dart:developer';

import 'package:clean_architechture/config/app_config.dart';
import 'package:clean_architechture/gen/assets.gen.dart';
import 'package:clean_architechture/presentation/common/dialog/loading_dialog.dart';
import 'package:clean_architechture/presentation/login/bloc/login_bloc.dart';
import 'package:clean_architechture/utils/multi-languages/multi_languages_utils.dart';
import 'package:clean_architechture/utils/route/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case LoginSuccessState:
            LoadingDialog.hideLoadingDialog;
            Navigator.pushNamed(context, RouteDefine.homeScreen.name);
            break;
          case LoginErrorState:
            LoadingDialog.hideLoadingDialog;
            break;
          case LoginLoadingState:
            LoadingDialog.showLoadingDialog(context);
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Login Screen ${LocaleKeys.title.tr()} ${Intl.getCurrentLocale()} ${AppConfig.getInstance()!.appFlavor}",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  context.read<LoginBloc>().add(
                        const LoginPressed(
                          "userName",
                          "password",
                          false,
                        ),
                      );
                },
                color: Colors.green,
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Login",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () {
                  context.read<LoginBloc>().add(
                        const LoginPressed(
                          "userName",
                          "password",
                          true,
                        ),
                      );
                },
                color: Colors.red,
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Login Error",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              MaterialButton(
                onPressed: () async {
                  context.setLocale(const Locale("vi","VN"));
                  log("Result : ${Intl.getCurrentLocale()}");
                  setState(() {});
                },
                color: Colors.blue,
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Change Locale to Viet Nam",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              Assets.images.cashIcon1.svg(),
            ],
          ),
        );
      },
    );
  }
}
