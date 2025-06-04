import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'core/util/functions.dart';
import 'core/widgets/custom_button.dart';
import 'home_screen_page.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    // Get the full size of the device screen
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      // Background color behind everything
      backgroundColor: const Color.fromRGBO(92, 148, 148, 1),

      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // Full screen image aligned to the top center
          Container(
            height: size.height,
            width: size.width,
            alignment: Alignment.topCenter,
            child: Image.asset(
              'assets/images/mobile_shopping_app.png',
              width: size.width,
              fit: BoxFit.fill,
            ),
          ),

          // Bottom section with rounded container and content inside SafeArea
          SafeArea(
            bottom: false,
            child: Container(
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(48),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),

              // Content inside the container arranged vertically and centered
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 73), // Top spacing

                  // Shimmer animated title text
                  Shimmer.fromColors(
                    baseColor: const Color.fromRGBO(101, 101, 101, 1),
                    highlightColor: Theme.of(context).primaryColor,
                    child: Text(
                      'Pick&Buy',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                  ),

                  SizedBox(height: size.height * 0.05), // Spacing relative to screen height

                  // Subtitle text below the title
                  Text(
                    "Pick what you love, buy instantly",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),

                  SizedBox(height: size.height * 0.05), // More spacing

                  // Button with horizontal padding
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 41),
                    child: Hero(
                      tag: "FROM_GET_STARTED_PAGE_TO_HOME_SCREEN_PAGE",
                      child: CustomButton(
                        text: 'Let`s Get Started',
                        onTap: () {
                          goTo(context, (context) => const HomeScreenPage());
                        },
                      ),
                    ),
                  ),

                  const SizedBox(height: 81), // Bottom spacing
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
