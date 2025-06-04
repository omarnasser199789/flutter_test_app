import 'package:flutter/material.dart';

import '../dashboard_colors.dart';

/// Navigation drawer component for the dashboard
///
/// Features:
/// - User profile header with gradient background
/// - Organized menu sections (MAIN, MANAGEMENT)
/// - Active state highlighting for current page
/// - Professional design with rounded corners and proper spacing
class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // Design system colors
  static const Color _secondaryColor = Color(0xFF7C3AED);
  static const Color _textSecondary = Color(0xFF6B7280);
  static const Color _drawerBackground = Colors.white;

  // Layout constants
  static const double _headerHeight = 250.0;
  static const double _headerPadding = 20.0;
  static const double _headerTopSpacing = 40.0;
  static const double _avatarRadius = 35.0;
  static const double _avatarSpacing = 16.0;
  static const double _sectionTitleSpacing = 20.0;
  static const double _sectionTitleBottomSpacing = 10.0;
  static const double _menuItemHorizontalMargin = 12.0;
  static const double _menuItemVerticalMargin = 2.0;
  static const double _menuItemBorderRadius = 12.0;
  static const double _menuItemHorizontalPadding = 16.0;
  static const double _menuItemVerticalPadding = 4.0;
  static const double _iconSize = 22.0;

  // Typography constants
  static const double _userNameFontSize = 20.0;
  static const double _userRoleFontSize = 14.0;
  static const double _sectionTitleFontSize = 12.0;
  static const double _menuItemFontSize = 15.0;
  static const double _avatarTextFontSize = 24.0;

  // Currently active menu item (would typically come from navigation state)
  static const String _activeMenuItem = 'Dashboard';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: _drawerBackground,
      child: Column(
        children: [
          // User profile header with gradient background
          _buildDrawerHeader(),

          // Scrollable menu sections
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // Main navigation section
                _buildMainMenuSection(),

                // Management section
                _buildManagementMenuSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the drawer header with user profile information
  ///
  /// Contains:
  /// - Gradient background
  /// - User avatar with initials
  /// - User name and role
  Widget _buildDrawerHeader() {
    return Container(
      height: _headerHeight,
      width: double.infinity,
      decoration: _buildHeaderGradient(),
      child: const Padding(
        padding: EdgeInsets.all(_headerPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: _headerTopSpacing),

            // User avatar
            _UserAvatar(),

            SizedBox(height: _avatarSpacing),

            // User information
            _UserInfo(),
          ],
        ),
      ),
    );
  }

  /// Builds the main menu section with primary navigation items
  Widget _buildMainMenuSection() {
    return _buildMenuSection(
      title: 'MAIN',
      items: [
        _buildMenuItem(
          icon: Icons.dashboard_rounded,
          title: 'Dashboard',
          isActive: _activeMenuItem == 'Dashboard',
        ),
        _buildMenuItem(
          icon: Icons.people_rounded,
          title: 'Leads',
          isActive: _activeMenuItem == 'Leads',
        ),
        _buildMenuItem(
          icon: Icons.analytics_rounded,
          title: 'Analytics',
          isActive: _activeMenuItem == 'Analytics',
        ),
        _buildMenuItem(
          icon: Icons.campaign_rounded,
          title: 'Campaigns',
          isActive: _activeMenuItem == 'Campaigns',
        ),
      ],
    );
  }

  /// Builds the management menu section with admin-related items
  Widget _buildManagementMenuSection() {
    return _buildMenuSection(
      title: 'MANAGEMENT',
      items: [
        _buildMenuItem(
          icon: Icons.settings_rounded,
          title: 'Settings',
          isActive: _activeMenuItem == 'Settings',
        ),
        _buildMenuItem(
          icon: Icons.group_rounded,
          title: 'Team',
          isActive: _activeMenuItem == 'Team',
        ),
        _buildMenuItem(
          icon: Icons.integration_instructions_rounded,
          title: 'Integrations',
          isActive: _activeMenuItem == 'Integrations',
        ),
      ],
    );
  }

  /// Builds a menu section with title and list of menu items
  ///
  /// [title] - Section title (e.g., "MAIN", "MANAGEMENT")
  /// [items] - List of menu item widgets
  Widget _buildMenuSection({
    required String title,
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section title
        Padding(
          padding: const EdgeInsets.fromLTRB(
            _sectionTitleSpacing,
            _sectionTitleSpacing,
            _sectionTitleSpacing,
            _sectionTitleBottomSpacing,
          ),
          child: Text(
            title,
            style: _buildSectionTitleStyle(),
          ),
        ),

        // Menu items
        ...items,
      ],
    );
  }

  /// Builds an individual menu item with icon and title
  ///
  /// [icon] - Material icon to display
  /// [title] - Menu item title text
  /// [isActive] - Whether this item is currently active/selected
  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required bool isActive,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: _menuItemHorizontalMargin,
        vertical: _menuItemVerticalMargin,
      ),
      decoration: _buildMenuItemDecoration(isActive),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: _menuItemHorizontalPadding,
          vertical: _menuItemVerticalPadding,
        ),
        leading: Icon(
          icon,
          color: _getMenuItemIconColor(isActive),
          size: _iconSize,
        ),
        title: Text(
          title,
          style: _buildMenuItemTextStyle(isActive),
        ),
        onTap: () => _handleMenuItemTap(context, title),
      ),
    );
  }

  /// Creates gradient decoration for the drawer header
  BoxDecoration _buildHeaderGradient() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [DashboardColors.primary, _secondaryColor],
      ),
    );
  }

  /// Creates text style for section titles
  TextStyle _buildSectionTitleStyle() {
    return const TextStyle(
      fontSize: _sectionTitleFontSize,
      fontWeight: FontWeight.w600,
      color: _textSecondary,
      letterSpacing: 0.5,
    );
  }

  /// Creates decoration for menu items based on active state
  BoxDecoration _buildMenuItemDecoration(bool isActive) {
    return BoxDecoration(
      color: isActive ? DashboardColors.primary.withOpacity(0.1) : null,
      borderRadius: BorderRadius.circular(_menuItemBorderRadius),
    );
  }

  /// Returns appropriate icon color based on active state
  Color _getMenuItemIconColor(bool isActive) {
    return isActive ? DashboardColors.primary : _textSecondary;
  }

  /// Creates text style for menu items based on active state
  TextStyle _buildMenuItemTextStyle(bool isActive) {
    return TextStyle(
      color: isActive ? DashboardColors.primary : DashboardColors.textPrimary,
      fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
      fontSize: _menuItemFontSize,
    );
  }

  /// Handles menu item tap events
  ///
  /// [context] - Build context for navigation
  /// [title] - Title of the tapped menu item
  void _handleMenuItemTap(BuildContext context, String title) {
    // Close the drawer
    Navigator.pop(context);
    debugPrint('Menu item tapped: $title');
  }
}

/// User avatar widget displaying initials in a circular container
class _UserAvatar extends StatelessWidget {
  const _UserAvatar();

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: _SideMenuState._avatarRadius,
      backgroundColor: _SideMenuState._drawerBackground,
      child: Text(
        'MA',
        style: TextStyle(
          color: DashboardColors.primary,
          fontSize: _SideMenuState._avatarTextFontSize,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// User information widget displaying name and role
class _UserInfo extends StatelessWidget {
  const _UserInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User name
        const Text(
          'Mark Anderson',
          style: TextStyle(
            color: _SideMenuState._drawerBackground,
            fontSize: _SideMenuState._userNameFontSize,
            fontWeight: FontWeight.w600,
          ),
        ),

        // User role
        Text(
          'Sales Manager',
          style: TextStyle(
            color: _SideMenuState._drawerBackground.withOpacity(0.7),
            fontSize: _SideMenuState._userRoleFontSize,
          ),
        ),
      ],
    );
  }
}