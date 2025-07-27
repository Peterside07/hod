import 'package:flutter/material.dart';

import 'package:hodtech/core/shared/button/primary_button.dart';
import 'package:hodtech/core/shared/input/primary_input.dart';
import 'package:hodtech/core/utils/colors.dart';
import 'package:hodtech/features/dashboard/dashboard.dart';
import 'package:intl/intl.dart';


class CompleteProfile extends StatefulWidget {
  static const routeName = '/complete-profile';

  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  String? selectedGender;

  final List<String> genderOptions = ['Male', 'Female'];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2007, 1, 1),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        dobController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

void _showGenderModal() async {
  final result = await showModalBottomSheet<String>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: genderOptions
              .map((gender) => ListTile(
                    title: Text(gender),
                    onTap: () => Navigator.pop(context, gender),
                  ))
              .toList(),
        ),
      );
    },
  );

  if (result != null) {
    setState(() {
      selectedGender = result;
    });
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Almost there!",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                "Just a few more details...",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: appColor.grey_700,
                    ),
              ),

              const SizedBox(height: 30),

              PrimaryTextField(
                label: "Full Name",
                placeholder: "Enter your full name",
                controller: nameController,
              ),

              const SizedBox(height: 16),

              // Date of Birth Field
              PrimaryTextField(
                label: "Date of Birth",
                placeholder: "DD/MM/YYYY",
                controller: dobController,
                readOnly: true,
                suffixIcon: const Icon(Icons.calendar_today_outlined),
                onTap: () => _selectDate(context),
              ),

              const SizedBox(height: 16),

              GestureDetector(
                onTap: _showGenderModal,
                child: AbsorbPointer(
                  child: PrimaryTextField(
                    label: "Gender",
                    placeholder: "Select your gender",
                    controller: TextEditingController(text: selectedGender ?? ""),
                    suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              PrimaryButton(
                isActive: false,
                onPressed: () {
                  // Submit or go to next screen
                  Navigator.pushNamed(context, DashboardScreen.routeName);
                  
                },
                label: "Continue",
              )
            ],
          ),
        ),
      ),
    );
  }
}
