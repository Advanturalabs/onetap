// import 'package:flutter/material.dart';
// import 'package:onetap/views/training/widgets/upcoming_session_card.dart';
// import 'package:sizer/sizer.dart';
//
// import '../../../AppTheme/app_theme.dart';
// import '../../../constants/app_text_style.dart';
//
// class SessionTabBar extends StatelessWidget {
//   final SessionStatus selectedStatus;
//   final Function(SessionStatus) onTabChanged;
//
//   const SessionTabBar({
//     super.key,
//     required this.selectedStatus,
//     required this.onTabChanged,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         _buildTab(SessionStatus.upcoming, 'Upcoming'),
//         const SizedBox(width: 8),
//         _buildTab(SessionStatus.completed, 'Completed'),
//         const SizedBox(width: 8),
//         _buildTab(SessionStatus.mandatory, 'Mandatory'),
//       ],
//     );
//   }
//
//   Widget _buildTab(SessionStatus status, String label) {
//     final bool isSelected = selectedStatus == status;
//
//     return GestureDetector(
//       onTap: () => onTabChanged(status),
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         decoration: BoxDecoration(
//           color: isSelected ? const Color(0xFFEFF6FF) : Colors.white,
//           borderRadius: BorderRadius.circular(30),
//           border: Border.all(
//             color: isSelected
//                 ? const Color(0xFF3B82F6)
//                 : const Color(0xFFE5E7EB),
//             width: 1,
//           ),
//         ),
//         child: Text(
//           label,
//           style: AppTextStyle.font14Weight500TextStyle.copyWith(
//             color: isSelected
//                 ? const Color(0xFF3B82F6)
//                 : AppTheme.grey400Color,
//           ),
//         ),
//       ),
//     );
//   }
// }