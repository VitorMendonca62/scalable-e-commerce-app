import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scalable_e_commerce_app/core/theme/colors.dart';
import 'package:scalable_e_commerce_app/core/theme/spacing.dart';
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
        body: Padding(
          padding: EdgeInsetsGeometry.symmetric(
            horizontal: AppThemePage.horizontalPadding,
            vertical: AppThemePage.verticalPadding,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  constraints: const BoxConstraints(
                    maxWidth: 48,
                    maxHeight: 48,
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.accentForeground,
                    borderRadius: BorderRadius.all(AppBorder.radius),
                  ),
                  child: Text(
                    "S",
                    style: TextStyle(
                      color: AppColors.muted,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                Text(
                  "Entrar na sua conta",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.foreground,
                  ),
                ),
                Text(
                  "Diga suas credencias para acessar",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.mutedForeground,
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
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        "ou continue com".toUpperCase(),
                        style: TextStyle(
                          color: AppColors.mutedForeground,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Expanded(child: Divider()),
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
                      padding: EdgeInsets.symmetric(vertical: 14),
                      backgroundColor: AppColors.primaryForeground,
                      side: BorderSide(
                        width: 1,
                        color: AppColors.mutedForeground,
                      ),
                      overlayColor: AppColors.foreground,
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
                      style: TextStyle(
                        color: AppColors.foreground,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Ainda não tem um conta? ",
                        style: TextStyle(
                          color: AppColors.mutedForeground,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Criar conta",
                        style: TextStyle(
                          color: AppColors.accentForeground,
                          fontWeight: FontWeight.w600,
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
      ),
    );
  }
}
