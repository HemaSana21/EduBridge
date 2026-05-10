import 'package:flutter/material.dart';
import 'dashboard_screen.dart'; // Import your home/dashboard screen
import 'add_student/basic_info_screen.dart'; // Import your add student screen
import 'update_progress_screen_v2.dart'; // Import your progress screen

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Keeping index 3 selected since this is the Profile/Settings screen
  int selectedIndex = 3;

  String userName = "satya";
  String userEmail = "satyasri0@gmail.com";
  String userRole = "Volunteer";

  bool notificationsEnabled = true;
  bool fingerprintLock = false;

  /// Handles Bottom Navigation Bar Clicks
  void _onNavigationTap(int index) {
    if (index == selectedIndex) return; // Already on this screen

    switch (index) {
      case 0:
        // Navigate to Home / Dashboard
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DashboardScreen()),
        );
        break;
      case 1:
        // Navigate to Add Student Screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BasicInfoScreen()),
        );
        break;
      case 2:
        // Navigate to Update Progress Screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const UpdateProgressScreenV2()),
        );
        break;
      case 3:
        // Already on Settings/Profile
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F7FB),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: _onNavigationTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart_rounded),
            label: "Progress",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo Header
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.school,
                        color: Colors.blue,
                        size: 30,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "EduBridge AI",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0B2341),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                // Title
                const Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0B2341),
                  ),
                ),
                const SizedBox(height: 25),

                // Profile Avatar & Name Card
                Center(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.blue,
                            width: 3,
                          ),
                        ),
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundColor: Color(0xFFE0E7FF),
                          backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&q=80&w=300",
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff0B2341),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        userRole,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                // ACCOUNT INFO CARD
                buildCard(
                  title: "ACCOUNT INFO",
                  child: Column(
                    children: [
                      infoRow("Email", userEmail),
                      const SizedBox(height: 18),
                      infoRow("Role", userRole),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // ACTIVITY CARD
                buildCard(
                  title: "ACTIVITY",
                  child: infoRow("Students", "3 Assigned"),
                ),
                const SizedBox(height: 20),

                // SETTINGS LIST CARD
                buildCard(
                  title: "SETTINGS",
                  child: Column(
                    children: [
                      HoverTile(
                        title: "Edit Profile",
                        icon: Icons.person_outline,
                        onTap: () {
                          openEditProfileDialog();
                        },
                      ),
                      HoverTile(
                        title: "Notifications",
                        icon: Icons.notifications_none,
                        onTap: () {
                          openNotificationDialog();
                        },
                      ),
                      HoverTile(
                        title: "Privacy",
                        icon: Icons.lock_outline,
                        onTap: () {
                          openPrivacyDialog();
                        },
                      ),
                      HoverTile(
                        title: "Help & Support",
                        icon: Icons.help_outline,
                        onTap: () {
                          openHelpDialog();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- EDIT PROFILE ----------------
  void openEditProfileDialog() {
    TextEditingController nameController = TextEditingController(text: userName);
    TextEditingController emailController = TextEditingController(text: userEmail);
    TextEditingController roleController = TextEditingController(text: userRole);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Edit Profile"),
          content: SizedBox(
            width: 300,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: "Name"),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: roleController,
                  decoration: const InputDecoration(labelText: "Role"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  userName = nameController.text;
                  userEmail = emailController.text;
                  userRole = roleController.text;
                });
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  // ---------------- NOTIFICATIONS ----------------
  void openNotificationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text("Notifications"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SwitchListTile(
                    value: notificationsEnabled,
                    title: const Text("Enable Notifications"),
                    onChanged: (value) {
                      setState(() {
                        notificationsEnabled = value;
                      });
                      setStateDialog(() {});
                    },
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Save"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // ---------------- PRIVACY ----------------
  void openPrivacyDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text("Privacy"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SwitchListTile(
                    value: fingerprintLock,
                    title: const Text("Enable Fingerprint Lock"),
                    onChanged: (value) {
                      setState(() {
                        fingerprintLock = value;
                      });
                      setStateDialog(() {});
                    },
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Save"),
                ),
              ],
            );
          },
        );
      },
    );
  }

  // ---------------- HELP SUPPORT ----------------
  void openHelpDialog() {
    TextEditingController helpController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Help & Support"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Describe your issue below:"),
              const SizedBox(height: 15),
              TextField(
                controller: helpController,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Type here...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Support request submitted"),
                  ),
                );
              },
              child: const Text("Submit"),
            ),
          ],
        );
      },
    );
  }

  // ---------------- CARD ----------------
  Widget buildCard({
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff0B2341),
            ),
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }

  // ---------------- INFO ROW ----------------
  Widget infoRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xff0B2341),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

// ---------------- HOVER TILE ----------------
class HoverTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const HoverTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  State<HoverTile> createState() => _HoverTileState();
}

class _HoverTileState extends State<HoverTile> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(14),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 14,
          ),
          decoration: BoxDecoration(
            color: isHovered ? const Color(0xffEAF4FF) : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: isHovered ? Colors.blue : const Color(0xff0B2341),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: isHovered ? Colors.blue : const Color(0xff0B2341),
                  ),
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: isHovered ? Colors.blue : Colors.black45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}