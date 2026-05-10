
// import 'package:flutter/material.dart';
// import '../models/student.dart';
// import 'student_list_screen.dart';
// import 'add_student/basic_info_screen.dart';
// import 'student_detail_screen_v2.dart';
// import 'update_progress_screen_v2.dart';
// import 'settings_screen.dart';

// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});

//   /// Centralized Navigation Handler
//   /// This eliminates code duplication by routing all taps (from Quick Actions and Bottom Nav) through one function.
//   void _handleNavigation(BuildContext context, int index) {
//     switch (index) {
//       case 0:
//         // Already on Home/Dashboard, do nothing or pop to root
//         break;
//       case 1:
//         // ADD STUDENT SCREEN
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const BasicInfoScreen()),
//         );
//         break;
//       case 2:
//         // UPDATE PROGRESS SCREEN
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const UpdateProgressScreenV2()),
//         );
//         break;
//       case 3:
//         // SETTINGS SCREEN (Placeholder)
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Settings screen coming soon"),
//           ),
//         );
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF8FAFC),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             _buildHeader(context),
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   _buildQuickActions(context),
//                   const SizedBox(height: 20),
//                   _buildAIInsightsCard(),
//                   const SizedBox(height: 24),
//                   _buildStudentListHeader(context),
//                   // Render preview list
//                   ...mockStudents
//                       .take(2)
//                       .map((student) => _buildStudentTile(context, student))
//                       .toList(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       // Cleaned Bottom Navigation calling the centralized handler
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: const Color(0xFF2563EB),
//         unselectedItemColor: const Color(0xFF94A3B8),
//         currentIndex: 0,
//         selectedFontSize: 12,
//         unselectedFontSize: 12,
//         onTap: (index) => _handleNavigation(context, index),
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_filled),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add_circle_outline),
//             label: 'Add',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.auto_graph_rounded),
//             label: 'Progress',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings_outlined),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeader(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.only(top: 60, left: 24, right: 24, bottom: 30),
//       decoration: const BoxDecoration(
//         color: Color(0xFF2563EB),
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(32),
//           bottomRight: Radius.circular(32),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 24,
//                     backgroundColor: Colors.white24,
//                     child: ClipOval(
//                       child: Image.network(
//                         'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&q=80&w=120',
//                         width: 48,
//                         height: 48,
//                         fit: BoxFit.cover,
//                         errorBuilder: (context, error, stackTrace) {
//                           return const Icon(Icons.person_rounded, color: Colors.white, size: 28);
//                         },
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 12),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         "Welcome back,",
//                         style: TextStyle(color: Colors.white70, fontSize: 13),
//                       ),
//                       const SizedBox(height: 2),
//                       Text(
//                         "Priya Volunteer",
//                         style: TextStyle(
//                           color: Colors.white.withOpacity(0.95),
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Row(
//                 children: [
//                   Stack(
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.notifications_none_rounded, color: Colors.white, size: 26),
//                         onPressed: () {},
//                       ),
//                       Positioned(
//                         right: 8,
//                         top: 8,
//                         child: Container(
//                           padding: const EdgeInsets.all(4),
//                           decoration: const BoxDecoration(
//                             color: Color(0xFFEF4444),
//                             shape: BoxShape.circle,
//                           ),
//                           constraints: const BoxConstraints(
//                             minWidth: 16,
//                             minHeight: 16,
//                           ),
//                           child: const Text(
//                             '3',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 9,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             textAlign: TextAlign.center,
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.logout_rounded, color: Colors.white, size: 24),
//                     onPressed: () {},
//                   ),
//                 ],
//               )
//             ],
//           ),
//           const SizedBox(height: 24),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               _StatCard(value: "12", label: "Students"),
//               _StatCard(value: "9", label: "Verified"),
//               _StatCard(value: "1", label: "Pending"),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildQuickActions(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: _ActionCard(
//             title: "Add Student",
//             subtitle: "Create new profile",
//             color: const Color(0xFFEFF6FF),
//             iconColor: const Color(0xFF2563EB),
//             icon: Icons.person_add_alt_1_rounded,
//             // Reusing the index 1 action
//             onTap: () => _handleNavigation(context, 1), 
//           ),
//         ),
//         const SizedBox(width: 16),
//         Expanded(
//           child: _ActionCard(
//             title: "Update Progress",
//             subtitle: "Attendance & marks",
//             color: const Color(0xFFF0FDF4),
//             iconColor: const Color(0xFF16A34A),
//             icon: Icons.trending_up_rounded,
//             // Reusing the index 2 action
//             onTap: () => _handleNavigation(context, 2), 
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildAIInsightsCard() {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Color(0xFFA855F7), Color(0xFF9333EA)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//         borderRadius: BorderRadius.circular(24),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: const [
//               Icon(Icons.psychology_rounded, color: Colors.white, size: 24),
//               SizedBox(width: 8),
//               Text(
//                 "AI INSIGHTS",
//                 style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 0.5),
//               ),
//             ],
//           ),
//           const SizedBox(height: 12),
//           const Text(
//             "2 students flagged for high dropout risk this month. Immediate attention recommended.",
//             style: TextStyle(color: Colors.white, fontSize: 13, height: 1.4),
//           ),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: const [
//               _AIInsightMiniBadge(value: "2", label: "High Risk"),
//               _AIInsightMiniBadge(value: "3", label: "Med Risk"),
//               _AIInsightMiniBadge(value: "7", label: "On Track"),
//             ],
//           )
//         ],
//       ),
//     );
//   }

//   Widget _buildStudentListHeader(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         const Text(
//           "My Students",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
//         ),
//         TextButton(
//           onPressed: () => Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => const StudentListScreen()),
//           ),
//           child: const Text(
//             "See all >",
//             style: TextStyle(color: Color(0xFF2563EB), fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildStudentTile(BuildContext context, Student student) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.02),
//             blurRadius: 10,
//             offset: const Offset(0, 4),
//           )
//         ],
//       ),
//       child: ListTile(
//         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         leading: CircleAvatar(
//           radius: 24,
//           backgroundColor: const Color(0xFFE9D5FF),
//           backgroundImage: NetworkImage(student.imageUrl),
//         ),
//         title: Text(
//           student.name,
//           style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
//         ),
//         subtitle: Text(
//           student.gradeAndSchool,
//           style: const TextStyle(color: Color(0xFF64748B), fontSize: 13),
//         ),
//         trailing: const Icon(Icons.chevron_right_rounded, color: Color(0xFF94A3B8)),
//         onTap: () => Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => StudentDetailScreenV2(student: student)),
//         ),
//       ),
//     );
//   }
// }

// class _StatCard extends StatelessWidget {
//   final String value, label;
//   const _StatCard({required this.value, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       padding: const EdgeInsets.symmetric(vertical: 14),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.15),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         children: [
//           Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 4),
//           Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
//         ],
//       ),
//     );
//   }
// }

// class _ActionCard extends StatelessWidget {
//   final String title, subtitle;
//   final Color color, iconColor;
//   final IconData icon;
//   final VoidCallback onTap;

//   const _ActionCard({
//     required this.title,
//     required this.subtitle,
//     required this.color,
//     required this.iconColor,
//     required this.icon,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(8),
//               decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
//               child: Icon(icon, color: iconColor, size: 24),
//             ),
//             const SizedBox(height: 16),
//             Text(title, style: TextStyle(color: iconColor, fontSize: 15, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 4),
//             Text(subtitle, style: TextStyle(color: iconColor.withOpacity(0.6), fontSize: 11)),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class _AIInsightMiniBadge extends StatelessWidget {
//   final String value, label;
//   const _AIInsightMiniBadge({required this.value, required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 90,
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.15),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         children: [
//           Text(value, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
//           Text(label, style: const TextStyle(color: Colors.white70, fontSize: 10)),
//         ],
//       ),
//     );
//   }
// }








import 'package:flutter/material.dart';
import '../models/student.dart';
import 'student_list_screen.dart';
import 'add_student/basic_info_screen.dart';

// NEW UNIQUE SCREEN IMPORTS
import 'student_detail_screen_v2.dart';
import 'update_progress_screen_v2.dart';
// 1. ADDED IMPORT FOR THE SETTINGS SCREEN
import 'settings_screen.dart'; 
import 'profile_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  /// Centralized Navigation Handler
  void _handleNavigation(BuildContext context, int index) {
    switch (index) {
      case 0:
        // Already on Home/Dashboard, do nothing
        break;
      case 1:
        // ADD STUDENT SCREEN
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const BasicInfoScreen()),
        );
        break;
      case 2:
        // UPDATE PROGRESS SCREEN
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const UpdateProgressScreenV2()),
        );
        break;
      case 3:
        // 2. FIXED: Navigates to your actual SettingsScreen now!
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingsScreen()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  _buildQuickActions(context),
                  const SizedBox(height: 20),
                  _buildAIInsightsCard(),
                  const SizedBox(height: 24),
                  _buildStudentListHeader(context),
                  ...mockStudents
                      .take(2)
                      .map((student) => _buildStudentTile(context, student))
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF2563EB),
        unselectedItemColor: const Color(0xFF94A3B8),
        // Keep index 0 highlighted since this screen is the "Home" destination
        currentIndex: 0, 
        selectedFontSize: 12,
        unselectedFontSize: 12,
        onTap: (index) => _handleNavigation(context, index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph_rounded),
            label: 'Progress',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, left: 24, right: 24, bottom: 30),
      decoration: const BoxDecoration(
        color: Color(0xFF2563EB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: Colors.white24,
                    child: ClipOval(
                      child: Image.network(
                        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&q=80&w=120',
                        width: 48,
                        height: 48,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.person_rounded, color: Colors.white, size: 28);
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome back,",
                        style: TextStyle(color: Colors.white70, fontSize: 13),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Priya Volunteer",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.95),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Stack(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.notifications_none_rounded, color: Colors.white, size: 26),
                        onPressed: () {},
                      ),
                      Positioned(
                        right: 8,
                        top: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Color(0xFFEF4444),
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: const Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout_rounded, color: Colors.white, size: 24),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _StatCard(value: "12", label: "Students"),
              _StatCard(value: "9", label: "Verified"),
              _StatCard(value: "1", label: "Pending"),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionCard(
            title: "Add Student",
            subtitle: "Create new profile",
            color: const Color(0xFFEFF6FF),
            iconColor: const Color(0xFF2563EB),
            icon: Icons.person_add_alt_1_rounded,
            onTap: () => _handleNavigation(context, 1), 
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _ActionCard(
            title: "Update Progress",
            subtitle: "Attendance & marks",
            color: const Color(0xFFF0FDF4),
            iconColor: const Color(0xFF16A34A),
            icon: Icons.trending_up_rounded,
            onTap: () => _handleNavigation(context, 2), 
          ),
        ),
      ],
    );
  }

  Widget _buildAIInsightsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFA855F7), Color(0xFF9333EA)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(Icons.psychology_rounded, color: Colors.white, size: 24),
              SizedBox(width: 8),
              Text(
                "AI INSIGHTS",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 0.5),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            "2 students flagged for high dropout risk this month. Immediate attention recommended.",
            style: TextStyle(color: Colors.white, fontSize: 13, height: 1.4),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _AIInsightMiniBadge(value: "2", label: "High Risk"),
              _AIInsightMiniBadge(value: "3", label: "Med Risk"),
              _AIInsightMiniBadge(value: "7", label: "On Track"),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildStudentListHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "My Students",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
        ),
        TextButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const StudentListScreen()),
          ),
          child: const Text(
            "See all >",
            style: TextStyle(color: Color(0xFF2563EB), fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildStudentTile(BuildContext context, Student student) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: const Color(0xFFE9D5FF),
          backgroundImage: NetworkImage(student.imageUrl),
        ),
        title: Text(
          student.name,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
        ),
        subtitle: Text(
          student.gradeAndSchool,
          style: const TextStyle(color: Color(0xFF64748B), fontSize: 13),
        ),
        trailing: const Icon(Icons.chevron_right_rounded, color: Color(0xFF94A3B8)),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => StudentDetailScreenV2(student: student)),
        ),
      ),
    );
  }
}

// Sub-widgets used in dashboard
class _StatCard extends StatelessWidget {
  final String value, label;
  const _StatCard({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String title, subtitle;
  final Color color, iconColor;
  final IconData icon;
  final VoidCallback onTap;

  const _ActionCard({
    required this.title,
    required this.subtitle,
    required this.color,
    required this.iconColor,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            const SizedBox(height: 16),
            Text(title, style: TextStyle(color: iconColor, fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(subtitle, style: TextStyle(color: iconColor.withOpacity(0.6), fontSize: 11)),
          ],
        ),
      ),
    );
  }
}

class _AIInsightMiniBadge extends StatelessWidget {
  final String value, label;
  const _AIInsightMiniBadge({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 10)),
        ],
      ),
    );
  }
}