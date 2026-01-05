import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/app_colors.dart';

class CustomerListPage extends StatelessWidget {
  CustomerListPage({super.key});

  final List<Color> avatarColors = [
    AppColors.blue,
    AppColors.green,
    AppColors.skyBlue,
    AppColors.orange,
    AppColors.blue,
    AppColors.green,
    AppColors.skyBlue,
    AppColors.orange,
    AppColors.blue,
    AppColors.green,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  AppColors.lighteGrey,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search customer",
                  prefixIcon: const Icon(Icons.arrow_back),
                  suffixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: AppColors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: avatarColors.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: avatarColors[index],
                            child: const Text(
                              "C",
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Customer Name",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "Malappuram",
                                  style: TextStyle(
                                    color: AppColors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            "Perithalmanna",
                            style: TextStyle(
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
