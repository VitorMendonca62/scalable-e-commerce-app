import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scalable_e_commerce_app/core/theme/spacing.dart';
import 'package:scalable_e_commerce_app/core/theme/typography.dart';
import 'package:scalable_e_commerce_app/modules/auth/presentation/bloc/login/login_bloc.dart';
import 'package:scalable_e_commerce_app/modules/auth/presentation/validators/validators.dart';
import 'package:scalable_e_commerce_app/shared/widgets/app_snackbar.dart';
import 'package:scalable_e_commerce_app/shared/widgets/form_button.dart';
import 'package:scalable_e_commerce_app/shared/widgets/form_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController(
    text: 'vitor2@gmail.com',
  );
  final TextEditingController passwordController = TextEditingController(
    text: "@Vh123456",
  );

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void handleSubmited(BuildContext context) {
    AppSnackbar.success(context, "Sucesso", 'Usuário autenticado');
  }

  void handleError(BuildContext context, String message) {
    AppSnackbar.error(context, "Erro", message);
  }

  handleLogin() {
    context.read<LoginBloc>().add(
      LoginRequested(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }

  handleLoginWithGoogle() {
    context.read<LoginBloc>().add(LoginWithGoogleRequested());
  }

  @override
  Widget build(BuildContext context) {
    final colorSchema = Theme.of(context).colorScheme;
    final loginBloc = context.read<LoginBloc>();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [colorSchema.primary, colorSchema.onSurfaceVariant],
                  ),
                ),
              ),
              Transform.translate(
                offset: const Offset(0, -60),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppThemePage.horizontalPadding,
                    vertical: AppThemePage.verticalPadding,
                  ),
                  decoration: BoxDecoration(
                    color: colorSchema.surface,
                    borderRadius: const BorderRadius.all(Radius.circular(36)),
                  ),

                  child: BlocConsumer<LoginBloc, LoginState>(
                    bloc: loginBloc,
                    listener: (context, state) {
                      if (state is LoginFailureState) {
                        handleError(context, state.exception);
                      }

                      if (state is LoginSuccessState) {
                        handleSubmited(context);
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 12),
                          Text(
                            "Entrar na sua conta",
                            style: AppTypography.headlineSmall.copyWith(
                              color: colorSchema.onSurface,
                            ),
                          ),
                          Text(
                            "Diga suas credencias para acessar",
                            style: AppTypography.bodyLarge.copyWith(
                              color: colorSchema.onSurface,
                            ),
                          ),
                          const SizedBox(height: AppThemePage.inputSpacing),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                FormInput(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  labelText: "Email",
                                  hintText: "example@example.com",
                                  validator: emailValidator,
                                  isDisabled: state is LoginLoadingState,
                                  focusNode: _emailFocusNode,
                                  textInputAction: TextInputAction.next,
                                  onFieldSubmitted: (_) =>
                                      _passwordFocusNode.requestFocus(),
                                  errorText:
                                      state is LoginFailureFieldState &&
                                          state.field == 'email'
                                      ? state.exception
                                      : null,
                                ),
                                const SizedBox(
                                  height: AppThemePage.inputSpacing,
                                ),
                                FormInput(
                                  controller: passwordController,
                                  keyboardType: TextInputType.text,
                                  labelText: "Senha",
                                  hintText: "********",
                                  validator: assemblePasswordValidator(null),
                                  isPasswordField: true,
                                  isDisabled: state is LoginLoadingState,
                                  focusNode: _passwordFocusNode,
                                  textInputAction: TextInputAction.done,
                                  onFieldSubmitted: (_) => handleLogin(),
                                  errorText:
                                      state is LoginFailureFieldState &&
                                          state.field == 'password'
                                      ? state.exception
                                      : null,
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton(
                                    onPressed: () {
                                      AppSnackbar.warning(
                                        context,
                                        'Em breve',
                                        'Recuperação de senha não implementada',
                                      );
                                    },
                                    child: Text('Esqueci a senha'),
                                  ),
                                ),

                                const SizedBox(
                                  height: AppThemePage.inputSpacing - 4,
                                ),

                                SizedBox(
                                  width: double.infinity,
                                  child: FormButton(
                                    isLoading: state is LoginLoadingState,
                                    labelString: "Entrar",
                                    labelWidget: SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        color: colorSchema.onPrimary,
                                        strokeWidth: 2,
                                      ),
                                    ),
                                    onPressed: state is LoginLoadingState
                                        ? () {}
                                        : handleLogin,
                                    formKey: _formKey,
                                  ),
                                ),
                                const SizedBox(
                                  height: AppThemePage.inputSpacing,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              const Expanded(child: Divider()),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                ),
                                child: Text(
                                  "ou continue com".toUpperCase(),
                                  style: AppTypography.labelMedium.copyWith(
                                    color: colorSchema.onSurfaceVariant,
                                  ),
                                ),
                              ),
                              const Expanded(child: Divider()),
                            ],
                          ),
                          const SizedBox(height: AppThemePage.inputSpacing),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton.icon(
                              onPressed: () {
                                handleLoginWithGoogle();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                backgroundColor: colorSchema.secondary,
                                side: BorderSide(
                                  width: 1,
                                  color: colorSchema.outline,
                                ),
                                overlayColor: colorSchema.onSecondary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    AppBorder.radius,
                                  ),
                                ),
                              ),
                              icon: SvgPicture.asset(
                                'assets/icons/google_logo.svg',
                                width: 18,
                                height: 18,
                              ),
                              label: Text(
                                'Google',
                                style: AppTypography.labelLarge.copyWith(
                                  color: colorSchema.onSurface,
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              overlayColor: Colors.transparent,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Ainda não tem um conta? ",
                                  style: AppTypography.labelMedium.copyWith(
                                    color: colorSchema.onSurface,
                                  ),
                                ),
                                Text(
                                  "Criar conta",
                                  style: AppTypography.labelMedium.copyWith(
                                    color: colorSchema.onSurface,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () {},
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
