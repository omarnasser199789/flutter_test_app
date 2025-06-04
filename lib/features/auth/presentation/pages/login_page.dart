import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/classes/field_validator.dart';
import '../../../../core/util/assets_manager.dart';
import '../../../../core/util/functions.dart';
import '../../../../core/widgets/back_button_widget.dart';
import '../../../../core/widgets/background_glows.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../dashboard/presentation/pages/dashboard_page.dart';
import '../../domain/use_cases/login_usecase.dart';
import '../bloc/bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundGlows(child: _ForegroundContent()),
    );
  }
}

class _ForegroundContent extends StatefulWidget {
  const _ForegroundContent();

  @override
  State<_ForegroundContent> createState() => _ForegroundContentState();
}

class _ForegroundContentState extends State<_ForegroundContent> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool loading = false;
  bool allowGo = false;
  bool allowShowMsg = false;

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => sl<AuthBloc>(),
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {

          loading = (state is Loading)?true:false;

          if (state is SuccessLogin) {
            if(allowGo){
              allowGo=false;
              Future.delayed(const Duration(milliseconds: 500), () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const DashboardPage()), (Route<dynamic> route) => false,
                );
              });
            }
          } else if (state is Error) {
            if(allowShowMsg){
              allowShowMsg = false;
              Future.delayed(Duration.zero, () {
                showMessage(message: state.message, context: context);
              });
            }
          }

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButtonWidget(),
                Padding(
                  padding: const EdgeInsets.only(left: 45, right: 45),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 114,
                          child: DefaultTextStyle(
                            style: Theme.of(context).textTheme.displayMedium!,
                            child: AnimatedTextKit(
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Welcome\nBack.',
                                ),
                              ],
                              onTap: () {},
                            ),
                          ),
                        ),
                        CustomTextField(
                          hint: "Email",
                          textInputAction: TextInputAction.done,
                          controller: emailController,
                          prefixIcon: SvgPicture.asset(
                            ImgAssets.email,
                          ),
                          validator: (value) {
                            if (value == "") {
                              return "Email can not be empty!";
                            } else {
                              return FieldValidator.validateEmail(value);
                            }
                          },
                        ),
                        const SizedBox(
                          height: 39,
                        ),
                        CustomTextField(
                          hint: "Password",
                          controller: passwordController,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                          suffixIcon: SvgPicture.asset(
                            ImgAssets.featherEye,
                          ),
                          prefixIcon: SvgPicture.asset(
                            ImgAssets.password,
                          ),
                          isPassword: true,
                          validator: (value) {
                            if (value == "") {
                              return "Password can not be empty!";
                            } else {
                              return FieldValidator.validatePassword(value);
                            }
                          },
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot Password?",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 52,
                        ),
                        Hero(
                          tag: "FROM_GET_STARTED_PAGE_TO_HOME_SCREEN_PAGE",
                          child: CustomButton(
                            text: 'Login',
                            loading: loading,
                            onTap: () {
                              FormState form = _formKey.currentState!;
                              if (form.validate()) {
                                allowGo = true;
                                allowShowMsg = true;
                                BlocProvider.of<AuthBloc>(context).add(
                                    LoginEvent(params: LoginParams(
                                        email: emailController.text,
                                        password: passwordController.text)));
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 39,
                        ),
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
                  ),
                )
              ],
            ),
          );
        }));
  }
}
