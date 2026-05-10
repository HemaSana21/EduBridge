import 'package:flutter/material.dart';
import '../models/student.dart';

class UpdateProgressScreenV2 extends StatefulWidget {
  const UpdateProgressScreenV2({super.key});

  @override
  State<UpdateProgressScreenV2> createState() => _UpdateProgressScreenV2State();
}

class _UpdateProgressScreenV2State extends State<UpdateProgressScreenV2> {
  Student? _selectedStudent;
  double _attendance = 75.0;
  double _testScore = 70.0;

  String get _aiPredictionText {
    if (_attendance < 60 || _testScore < 50) {
      return "High risk of dropping out. Immediate attention recommended.";
    } else if (_attendance < 75 || _testScore < 65) {
      return "Medium risk. Monitoring suggested.";
    } else {
      return "On track. Student showing positive progress.";
    }
  }

  Color get _aiPredictionColor {
    if (_attendance < 60 || _testScore < 50) {
      return const Color(0xFFEF4444);
    } else if (_attendance < 75 || _testScore < 65) {
      return const Color(0xFFF59E0B);
    } else {
      return const Color(0xFF10B981);
    }
  }

  Color get _aiPredictionBgColor {
    if (_attendance < 60 || _testScore < 50) {
      return const Color(0xFFFEF2F2);
    } else if (_attendance < 75 || _testScore < 65) {
      return const Color(0xFFFEF3C7);
    } else {
      return const Color(0xFFECFDF5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF16A34A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, color: Colors.white, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Update Progress",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 24, bottom: 12),
              child: Text(
                "SELECT STUDENT",
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF64748B),
                  letterSpacing: 0.5,
                ),
              ),
            ),
            
            SizedBox(
              height: _selectedStudent == null ? 480 : 280,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: mockStudents.length,
                itemBuilder: (context, index) {
                  final student = mockStudents[index];
                  final bool isSelected = _selectedStudent?.name == student.name;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedStudent = student;
                        _attendance = student.progressPercent.toDouble();
                        _testScore = 70.0;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected ? const Color(0xFF16A34A) : Colors.transparent,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.015),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        leading: CircleAvatar(
                          radius: 24,
                          backgroundColor: const Color(0xFFEFF6FF),
                          child: ClipOval(
                            child: Image.network(
                              student.imageUrl,
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Text(
                                  student.name.isNotEmpty ? student.name[0] : 'S',
                                  style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2563EB)),
                                );
                              },
                            ),
                          ),
                        ),
                        title: Text(
                          student.name,
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
                        ),
                        subtitle: Text(
                          "${student.gradeAndSchool.split('·')[0].trim()} · Attendance: ${student.progressPercent}%",
                          style: const TextStyle(color: Color(0xFF64748B), fontSize: 13),
                        ),
                        trailing: isSelected
                            ? const Icon(Icons.check_circle_rounded, color: Color(0xFF16A34A), size: 28)
                            : const Icon(Icons.chevron_right_rounded, color: Color(0xFF94A3B8)),
                      ),
                    ),
                  );
                },
              ),
            ),

            if (_selectedStudent != null) ...[
              const Divider(height: 1, color: Color(0xFFE2E8F0)),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Monthly Update — May 2026",
                      style: TextStyle(
                        fontSize: 18, 
                        fontWeight: FontWeight.bold, 
                        color: Colors.blueGrey.shade50,
                      ),
                    ),
                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "ATTENDANCE",
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF64748B)),
                        ),
                        Text(
                          "${_attendance.toInt()}%",
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF2563EB)),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: const Color(0xFF2563EB),
                        inactiveTrackColor: const Color(0xFFE2E8F0),
                        thumbColor: const Color(0xFF2563EB),
                        overlayColor: const Color(0x292563EB),
                      ),
                      child: Slider(
                        value: _attendance,
                        min: 0,
                        max: 100,
                        onChanged: (val) => setState(() => _attendance = val),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("0%", style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                          Text("50%", style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                          Text("100%", style: TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "LATEST TEST SCORE",
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xFF64748B)),
                        ),
                        Text(
                          "${_testScore.toInt()}/100",
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF16A34A)),
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: const Color(0xFF16A34A),
                        inactiveTrackColor: const Color(0xFFE2E8F0),
                        thumbColor: const Color(0xFF16A34A),
                        overlayColor: const Color(0x2916A34A),
                      ),
                      child: Slider(
                        value: _testScore,
                        min: 0,
                        max: 100,
                        onChanged: (val) => setState(() => _testScore = val),
                      ),
                    ),
                    const SizedBox(height: 24),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: _aiPredictionBgColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: _aiPredictionColor.withOpacity(0.15)),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.psychology_rounded, color: _aiPredictionColor, size: 24),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "AI DROPOUT PREDICTION",
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: _aiPredictionColor,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _aiPredictionText,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: _aiPredictionColor.withOpacity(0.9),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF16A34A),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
                          elevation: 0,
                        ),
                        onPressed: () {
                          // Determine the risk status based on sliders
                          String calculatedRisk;
                          if (_attendance < 60 || _testScore < 50) {
                            calculatedRisk = "High Risk";
                          } else if (_attendance < 75 || _testScore < 65) {
                            calculatedRisk = "Medium Risk";
                          } else {
                            calculatedRisk = "Low Risk";
                          }

                          // Safe Immutable Update Pattern:
                          // Find index of student and replace the entire object with updated values
                          final index = mockStudents.indexWhere((s) => s.name == _selectedStudent!.name);
                          if (index != -1) {
                            setState(() {
                              mockStudents[index] = Student(
                                name: _selectedStudent!.name,
                                gradeAndSchool: _selectedStudent!.gradeAndSchool,
                                progressPercent: _attendance.toInt(),
                                riskStatus: calculatedRisk,
                                imageUrl: _selectedStudent!.imageUrl,
                                monthlyIncome: _selectedStudent!.monthlyIncome,
                                supportRequired: _selectedStudent!.supportRequired,
                                story: _selectedStudent!.story,
                              );
                            });
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Successfully updated ${_selectedStudent!.name}'s progress!"),
                              backgroundColor: const Color(0xFF16A34A),
                            ),
                          );
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Submit Update",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
