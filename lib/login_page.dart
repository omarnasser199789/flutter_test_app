import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'core/util/assets_manager.dart';
import 'core/util/functions.dart';
import 'core/widgets/back_button_widget.dart';
import 'core/widgets/background_glows.dart';
import 'core/widgets/custom_button.dart';
import 'core/widgets/custom_text_field.dart';
import 'dashboard/pages/dashboard_page.dart';
import 'dashboard/widgets/dashboard_progress_indicator.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundGlows(child: _ForegroundContent()),
    );
  }
}

class _ForegroundContent extends StatelessWidget {
  const _ForegroundContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BackButtonWidget(),
        Padding(
          padding: const EdgeInsets.only(left: 45, right: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 114,
                child: DefaultTextStyle(
                  style: Theme.of(context).textTheme.displayMedium!,
                  child: AnimatedTextKit(
                    totalRepeatCount:1,
                    animatedTexts: [
                      TypewriterAnimatedText('Welcome\nBack.',),
                    ],
                    onTap: () {

                    },
                  ),
                ),
              ),

              CustomTextField(hint: "Email",
                textInputAction:TextInputAction.done,
                prefixIcon: SvgPicture.asset(ImgAssets.email,),

              ),
              const SizedBox(height: 39,),

              CustomTextField(hint: "Password",
                textInputAction:TextInputAction.done,
                suffixIcon: SvgPicture.asset(ImgAssets.featherEye,),
                prefixIcon: SvgPicture.asset(ImgAssets.password,),
                isPassword: true,

              ),

              const SizedBox(height: 13,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forgot Password?", style: Theme.of(context).textTheme.titleMedium,),
                ],
              ),

              const SizedBox(height: 52,),
              Hero(
                tag: "FROM_GET_STARTED_PAGE_TO_HOME_SCREEN_PAGE",
                child: CustomButton(
                  text: 'Login',
                  onTap: () {
                    goTo(context, (context) => const DashboardPage());
                    // goTo(context, (context) => HorizontalProcessTimeline());
                  },
                ),
              ),
              const SizedBox(height: 39,),
              RichText(
                text: TextSpan(
                  text: "Don`t have an account?",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).canvasColor.withOpacity(0.5)),

                  children: <TextSpan>[
                    TextSpan(
                      text: " Sign Up",
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

