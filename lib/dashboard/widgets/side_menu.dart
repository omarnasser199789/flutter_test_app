import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});
  static const Color _primaryColor = Color(0xFF4E46B4);
  static const Color _textSecondary = Color(0xFF6B7280);
  static const Color _textPrimary = Color(0xFF111827);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          _buildDrawerHeader(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildMenuSection('MAIN', [
                  _buildMenuItem(Icons.dashboard_rounded, 'Dashboard', true),
                  _buildMenuItem(Icons.people_rounded, 'Leads', false),
                  _buildMenuItem(Icons.analytics_rounded, 'Analytics', false),
                  _buildMenuItem(Icons.campaign_rounded, 'Campaigns', false),
                ]),
                _buildMenuSection('MANAGEMENT', [
                  _buildMenuItem(Icons.settings_rounded, 'Settings', false),
                  _buildMenuItem(Icons.group_rounded, 'Team', false),
                  _buildMenuItem(Icons.integration_instructions_rounded, 'Integrations', false),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build drawer header
  Widget _buildDrawerHeader() {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [SideMenu._primaryColor, Color(0xFF7C3AED)],
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.white,
              child: Text(
                'MA',
                style: TextStyle(
                  color: SideMenu._primaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Mark Anderson',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Sales Manager',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build menu section
  Widget _buildMenuSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: SideMenu._textSecondary,
              letterSpacing: 0.5,
            ),
          ),
        ),
        ...items,
      ],
    );
  }

  /// Build menu item
  Widget _buildMenuItem(IconData icon, String title, bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: isActive ? SideMenu._primaryColor.withOpacity(0.1) : null,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Icon(
          icon,
          color: isActive ? SideMenu._primaryColor : SideMenu._textSecondary,
          size: 22,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: isActive ? SideMenu._primaryColor : SideMenu._textPrimary,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            fontSize: 15,
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
