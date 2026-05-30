import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:scalable_e_commerce_app/core/network/api_client.dart';
import 'package:scalable_e_commerce_app/core/network/dio_factory.dart';
import 'package:scalable_e_commerce_app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:scalable_e_commerce_app/modules/auth/domain/usecases/login_user_usecase.dart';
import 'package:scalable_e_commerce_app/modules/auth/infrastructure/datasources/auth_local_datasource.dart';
import 'package:scalable_e_commerce_app/modules/auth/infrastructure/datasources/login_remote_datasource.dart';
import 'package:scalable_e_commerce_app/modules/auth/infrastructure/repositories/auth_repository_impl.dart';
import 'package:scalable_e_commerce_app/modules/auth/presentation/bloc/login/login_bloc.dart';

class AppBindings extends StatelessWidget {
  final Widget child;

  const AppBindings({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => APIClient(DioFactory.create())),

        RepositoryProvider(create: (_) => const FlutterSecureStorage()),

        RepositoryProvider(
          create: (context) =>
              AuthLocalDatasource(context.read<FlutterSecureStorage>()),
        ),

        RepositoryProvider(
          create: (context) => LoginRemoteDatasource(context.read<APIClient>()),
        ),

        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepositoryImpl(
            context.read<LoginRemoteDatasource>(),
            context.read<AuthLocalDatasource>(),
          ),
        ),

        RepositoryProvider(
          create: (context) => LoginUserUsecase(context.read<AuthRepository>()),
        ),
      ],

      child: MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(context.read<LoginUserUsecase>()),
          ),
        ],

        child: child,
      ),
    );
  }
}
