import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../Theme/dashboard_colors.dart';
import '../../../../core/util/assets_manager.dart';

/// A custom app bar widget for the dashboard screen
///
/// This widget provides a horizontal layout with:
/// - Left side: Menu button and app title
/// - Right side: Notification icon and user avatar
class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key});

  // Layout constants
  static const double _horizontalPadding = 30.0;
  static const double _menuButtonPadding = 4.0;
  static const double _spacingSmall = 8.0;
  static const double _spacingMedium = 10.0;
  static const double _avatarRadius = 16.0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      bottom: false, // Only apply safe area to top, not bottom
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: _horizontalPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left side: Menu button and app title
            _buildLeftSection(context, screenSize),

            // Right side: Notification and user avatar
            _buildRightSection(context),
          ],
        ),
      ),
    );
  }

  /// Builds the left section containing menu button and app title
  Widget _buildLeftSection(BuildContext context, Size screenSize) {
    return Row(
      children: [
        // Menu button with circular background
        _buildMenuButton(context, screenSize),

        const SizedBox(width: _spacingSmall),

        // App title
        Text(
          'AllPro',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }

  /// Builds the menu button with circular background
  Widget _buildMenuButton(BuildContext context, Size screenSize) {
    return Container(
      decoration: BoxDecoration(
        color: DashboardColors.menuButtonBackground,
        borderRadius: BorderRadius.circular(screenSize.width), // Creates perfect circle
      ),
      child: Padding(
        padding: const EdgeInsets.all(_menuButtonPadding),
        child: IconButton(
          icon: const Icon(Icons.menu, color: DashboardColors.textPrimary),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
    );
  }

  /// Builds the right section containing notification icon and user avatar
  Widget _buildRightSection(BuildContext context) {
    return Row(
      children: [
        // Notification icon
        SvgPicture.asset(ImgAssets.notificationCenter),

        const SizedBox(width: _spacingMedium),

        // User avatar with initials
        _buildUserAvatar(context),
      ],
    );
  }

  /// Builds the user avatar with initials
  Widget _buildUserAvatar(BuildContext context) {
    return CircleAvatar(
      radius: _avatarRadius,
      backgroundColor: DashboardColors.avatarBackground,
      child: Text(
        'MA',
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}