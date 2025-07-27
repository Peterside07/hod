import 'package:flutter/material.dart';
import 'package:hodtech/core/assets/assets.dart';
import 'package:hodtech/core/shared/button/primary_button.dart';
import 'package:hodtech/core/shared/input/primary_input.dart';
import 'package:hodtech/core/utils/colors.dart';
import 'package:hodtech/features/authentication/view/complete_profile.dart';
import 'package:hodtech/features/authentication/widget/term_and_condtion.dart';

class EmailEntryScreen extends StatelessWidget {
  static const routeName = '/email';

  final TextEditingController emailController = TextEditingController();

  EmailEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24,
          // vertical: 50
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),

                  Text(
                    "Hi! What’s your email?",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Welcome Home!",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: appColor.grey_700,
                        ),
                  ),

                  const SizedBox(height: 24),
                  PrimaryTextField(
                    label: "Email Address",
                    placeholder: "Enter your email",
                    controller: emailController,
                  ),
                  const SizedBox(height: 20),

                  PrimaryButton(
                    onPressed: (){
                      Navigator.pushNamed(context, CompleteProfile.routeName);
                    },
                    label: 'Continue',
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Expanded(child: Divider(color: appColor.grey_200)),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("OR"),
                      ),
                      Expanded(child: Divider(color: appColor.grey_200)),
                    ],
                  ),

                  const SizedBox(height: 16),

                  PrimaryButtonWithIcon(
                    isPrimary: false,
                    onPressed: () {},
                    label: "Continue with Google",
                    icon:
                        Image.asset(kgoogleLogo, height: 19),
                  ),

                  const SizedBox(height: 16),

                  PrimaryButtonWithIcon(
                    isPrimary: false,
                    onPressed: () {},
                    label: "Continue with Apple",
                    icon:
                        Image.asset(kAppleLogo, height: 20),
                  ),

                  const SizedBox(height: 20),
                  const TermAndCondition(),
                  Center(
                    child: Image.asset(kHodLogo, height: 40),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
