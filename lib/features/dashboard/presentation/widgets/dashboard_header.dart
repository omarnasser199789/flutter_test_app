import 'package:flutter/material.dart';

/// Dashboard header widget displaying navigation and page title
///
/// This widget provides:
/// - Back navigation arrow icon
/// - Page title "Leads details"
/// - Consistent padding and spacing
class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  // Design constants
  static const Color _textSecondary = Color(0xFF6B7280); // Gray color for icon

  // Layout constants
  static const double _containerPadding = 8.0;
  static const double _horizontalPadding = 30.0;
  static const double _iconSize = 16.0;
  static const double _spacingBetweenElements = 8.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(_containerPadding),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Row(
          children: [
            // Back navigation icon
            _buildBackIcon(),

            const SizedBox(width: _spacingBetweenElements),

            // Page title
            _buildPageTitle(context),
          ],
        ),
      ),
    );
  }

  /// Builds the back navigation icon
  ///
  /// Returns an iOS-style back arrow icon that can be tapped
  /// to navigate back to the previous screen
  Widget _buildBackIcon() {
    return const Icon(
      Icons.arrow_back_ios,
      size: _iconSize,
      color: _textSecondary, // Uncomment to apply secondary text color
    );
  }

  /// Builds the page title text
  ///
  /// Uses the theme's titleSmall style for consistency
  /// with the app's design system
  Widget _buildPageTitle(BuildContext context) {
    return Text(
      'Leads details',
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}