import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_app/core/util/functions.dart';
import 'core/util/assets_manager.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'core/widgets/back_button_widget.dart';
import 'core/widgets/background_glows.dart';
import 'login_page.dart';


class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

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
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackButtonWidget(),
          _CenterImage(),
          SizedBox(height: 96),
          _CenteredText(),
          SizedBox(height: 50),
          SafeArea(child: _LoginSignUpButtons()),
        ],
      ),
    );
  }
}



// Center image widget
class _CenterImage extends StatelessWidget {
  const _CenterImage();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(ImgAssets.cuate),
      ],
    );
  }
}

// Centered multi-line text widget
class _CenteredText extends StatelessWidget {
  const _CenteredText();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      SizedBox(
        height: 114,
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.displayMedium!,
        child: AnimatedTextKit(
          totalRepeatCount:1,
          animatedTexts: [
            TypewriterAnimatedText('Sign in to continue or\ncreate an account to\nstart shopping.', textAlign: TextAlign.center,),
          ],
          onTap: () {

          },
        ),
      ),
    )
      ],
    );
  }
}

// Login and Sign Up buttons
class _LoginSignUpButtons extends StatelessWidget {
  const _LoginSignUpButtons();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Hero(
        tag: "FROM_GET_STARTED_PAGE_TO_HOME_SCREEN_PAGE",
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(233, 233, 233, 1),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            children: [
              // Login button
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    goTo(context, (context)=>const LoginPage());
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                ),
              ),

              // Sign Up button
              Expanded(
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
