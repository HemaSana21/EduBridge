import 'package:flutter/material.dart';
import '../models/student.dart';
import 'student_detail_screen.dart';

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text("My Students", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: mockStudents.length,
        itemBuilder: (context, index) {
          final student = mockStudents[index];

          Color badgeBgColor;
          Color badgeTextColor;
          if (student.riskStatus == "High Risk") {
            badgeBgColor = const Color(0xFFFEE2E2);
            badgeTextColor = const Color(0xFFEF4444);
          } else if (student.riskStatus == "Medium Risk") {
            badgeBgColor = const Color(0xFFFEF3C7);
            badgeTextColor = const Color(0xFFD97706);
          } else {
            badgeBgColor = const Color(0xFFDCFCE7);
            badgeTextColor = const Color(0xFF16A34A);
          }

          return Container(
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: const Color(0xFFF1F5F9)),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentDetailScreen(student: student)),
                );
              },
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(student.imageUrl),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            student.name,
                            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            student.gradeAndSchool,
                            style: const TextStyle(color: Color(0xFF64748B), fontSize: 13),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.trending_down_rounded, color: Colors.grey[500], size: 16),
                              const SizedBox(width: 4),
                              Text(
                                "${student.progressPercent}%",
                                style: TextStyle(color: Colors.grey[600], fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 12),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: badgeBgColor,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Text(
                                  student.riskStatus,
                                  style: TextStyle(color: badgeTextColor, fontSize: 11, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Icon(Icons.chevron_right_rounded, color: Color(0xFF94A3B8)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}