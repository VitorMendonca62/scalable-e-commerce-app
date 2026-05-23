import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scalable_e_commerce_app/core/theme/spacing.dart';
import 'package:scalable_e_commerce_app/core/theme/typography.dart';
import 'package:scalable_e_commerce_app/modules/auth/presentation/validators/validators.dart';
import 'package:scalable_e_commerce_app/shared/widgets/form_button.dart';
import 'package:scalable_e_commerce_app/shared/widgets/form_input.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.onSurfaceVariant,
                    ],
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
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.all(Radius.circular(36)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 12),
                      Text(
                        "Entrar na sua conta",
                        style: AppTypography.headlineSmall.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        "Diga suas credencias para acessar",
                        style: AppTypography.bodyLarge.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: AppThemePage.inputSpacing),
                      Form(
                        child: Column(
                          children: [
                            FormInput(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              labelText: "Email",
                              hintText: "example@example.com",
                              validator: emailValidator,
                            ),
                            const SizedBox(height: AppThemePage.inputSpacing),
                            FormInput(
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              labelText: "Senha",
                              hintText: "********",
                              validator: (String? teste) => "awddw",
                              isPasswordField: true,
                            ),
                            const SizedBox(height: AppThemePage.inputSpacing),
                            SizedBox(
                              width: double.infinity,
                              child: FormButton(
                                onPressed: () {
                                  return;
                                },
                                text: 'Entrar',
                              ),
                            ),
                            const SizedBox(height: AppThemePage.inputSpacing),
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
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
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
                            return;
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.secondary,
                            side: BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                            overlayColor: Theme.of(
                              context,
                            ).colorScheme.onSecondary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(AppBorder.radius),
                            ),
                          ),
                          icon: SvgPicture.asset(
                            'assets/icons/google_logo.svg',
                            width: 18,
                            height: 18,
                          ),
                          label: Text(
                            'Continuar com Google',
                            style: AppTypography.labelLarge.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
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
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                            Text(
                              "Criar conta",
                              style: AppTypography.labelMedium.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ],
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
