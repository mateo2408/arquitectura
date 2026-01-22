import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/pet.dart';
import '../theme.dart';
import '../widgets/glass_container.dart';

class PetDetailScreen extends StatelessWidget {
  final Pet pet;

  const PetDetailScreen({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppTheme.primaryGradient),
        child: SafeArea(
          child: Column(
            children: [
              _buildAppBar(context),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppTheme.backgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: DefaultTabController(
                    length: 3,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        _buildPetHeader(),
                        const SizedBox(height: 20),
                        TabBar(
                          indicatorColor: AppTheme.primaryColor,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.white60,
                          labelStyle: GoogleFonts.outfit(
                            fontWeight: FontWeight.w600,
                          ),
                          tabs: const [
                            Tab(text: "Info"),
                            Tab(text: "Medical"),
                            Tab(text: "Docs"),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              _buildInfoTab(),
                              _buildMedicalTab(),
                              _buildDocumentsTab(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          Text(
            "Pet Details",
            style: GoogleFonts.outfit(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // TODO: Edit Pet
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPetHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white.withOpacity(0.1),
          child: FaIcon(
            pet.species.toLowerCase() == 'dog'
                ? FontAwesomeIcons.dog
                : FontAwesomeIcons.cat,
            size: 40,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          pet.name,
          style: GoogleFonts.outfit(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          "${pet.breed} • ${pet.species}",
          style: GoogleFonts.outfit(fontSize: 16, color: Colors.white70),
        ),
      ],
    );
  }

  Widget _buildInfoTab() {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildInfoItem(
          "Birth Date",
          pet.birthDate.toString().split(' ')[0],
        ), // Simple date format
        _buildInfoItem("Age", _calculateAge(DateTime.parse(pet.birthDate))),
        _buildInfoItem("Gender", "Male"), // Mock data if not in model
        _buildInfoItem("Weight", "12 kg"), // Mock data
        _buildInfoItem("Microchip", "982000123456789"), // Mock data
      ],
    );
  }

  String _calculateAge(DateTime birthDate) {
    // Simple age calc
    final now = DateTime.now();
    final difference = now.difference(birthDate);
    final days = difference.inDays;
    final years = (days / 365).floor();
    if (years > 0) return "$years years";
    final months = (days / 30).floor();
    return "$months months";
  }

  Widget _buildInfoItem(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: GlassContainer(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(color: Colors.white70)),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMedicalTab() {
    // Mock Medical Records
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        _buildMedicalCard("Vaccination: Rabies", "Next due: 12/12/2026", true),
        _buildMedicalCard("Checkup: Yearly", "Completed: 01/01/2026", false),
        _buildMedicalCard("Deworming", "Next due: 06/06/2026", true),
      ],
    );
  }

  Widget _buildMedicalCard(String title, String subtitle, bool isAlert) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: GlassContainer(
        color: isAlert
            ? AppTheme.errorColor.withOpacity(0.1)
            : Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(16),
        borderGradient: isAlert
            ? LinearGradient(
                colors: [
                  AppTheme.errorColor.withOpacity(0.5),
                  Colors.transparent,
                ],
              )
            : null,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isAlert
                    ? AppTheme.errorColor.withOpacity(0.2)
                    : AppTheme.secondaryColor.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                isAlert
                    ? Icons.warning_amber_rounded
                    : Icons.check_circle_outline,
                color: isAlert ? AppTheme.errorColor : AppTheme.secondaryColor,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentsTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.folder_open_outlined, size: 60, color: Colors.white24),
          const SizedBox(height: 16),
          Text("No Documents", style: TextStyle(color: Colors.white54)),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.file_upload_outlined),
            label: Text("Upload Document"),
          ),
        ],
      ),
    );
  }
}
