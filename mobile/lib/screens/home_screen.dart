import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/pet.dart';
import '../services/api_service.dart';
import '../theme.dart';
import '../widgets/glass_container.dart';
import 'add_pet_screen.dart';
import 'pet_detail_screen.dart'; // We will create this next
import 'services_screen.dart'; // We will create this next

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<Pet>> _petsFuture;

  @override
  void initState() {
    super.initState();
    _petsFuture = _apiService.getPets();
  }

  void _refreshPets() {
    setState(() {
      _petsFuture = _apiService.getPets();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1E1E2C), Color(0xFF2D2D44)],
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildPetCarousel(),
              const SizedBox(height: 20),
              _buildQuickActions(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddPetScreen()),
          );
          if (result == true) _refreshPets();
        },
        backgroundColor: AppTheme.primaryColor,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          "Add Pet",
          style: GoogleFonts.outfit(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back,",
                style: AppTheme.darkTheme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 4),
              Text(
                "Pet Owner", // TODO: Replace with user name
                style: AppTheme.darkTheme.textTheme.displayMedium,
              ),
            ],
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none_rounded, size: 28),
                onPressed: () {},
              ),
              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppTheme.errorColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPetCarousel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            "My Pets",
            style: AppTheme.darkTheme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 220,
          child: FutureBuilder<List<Pet>>(
            future: _petsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return _buildEmptyPetCard();
              }
              final pets = snapshot.data!;
              return PageView.builder(
                controller: PageController(viewportFraction: 0.85),
                itemCount: pets.length,
                itemBuilder: (context, index) {
                  return _buildPetCard(pets[index]);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildPetCard(Pet pet) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PetDetailScreen(pet: pet)),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: GlassContainer(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white.withOpacity(0.05),
          borderGradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.2),
              Colors.white.withOpacity(0.05),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: AppTheme.primaryColor.withOpacity(0.2),
                      child: FaIcon(
                        _getPetIcon(pet.species),
                        color: AppTheme.primaryColor,
                        size: 20,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.secondaryColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppTheme.secondaryColor.withOpacity(0.5),
                        ),
                      ),
                      child: Text(
                        "Active",
                        style: TextStyle(
                          color: AppTheme.secondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  pet.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "${pet.species} • ${pet.breed}",
                  style: const TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyPetCard() {
    return Center(
      child: GlassContainer(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        borderRadius: BorderRadius.circular(24),
        color: Colors.white.withOpacity(0.05),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.pets, size: 48, color: Colors.white30),
              const SizedBox(height: 12),
              Text(
                "No pets added yet",
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getPetIcon(String species) {
    switch (species.toLowerCase()) {
      case 'dog':
      case 'perro':
        return FontAwesomeIcons.dog;
      case 'cat':
      case 'gato':
        return FontAwesomeIcons.cat;
      default:
        return FontAwesomeIcons.paw;
    }
  }

  Widget _buildQuickActions() {
    final actions = [
      {
        'icon': FontAwesomeIcons.notesMedical,
        'label': 'Medical',
        'color': Color(0xFF6C63FF),
      },
      {
        'icon': FontAwesomeIcons.userDoctor,
        'label': 'Find Vet',
        'color': Color(0xFF03DAC6),
      },
      {
        'icon': FontAwesomeIcons.shieldHeart,
        'label': 'Insurance',
        'color': Color(0xFFFFB74D),
      },
      {
        'icon': FontAwesomeIcons.truckMedical,
        'label': 'Emergency',
        'color': Color(0xFFCF6679),
      },
    ];

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Services",
              style: AppTheme.darkTheme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 1.5,
                ),
                itemCount: actions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (actions[index]['label'] == 'Medical') {
                        // TODO: Navigate to Medical List
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ServicesScreen(),
                          ),
                        );
                      }
                    },
                    child: _buildActionCard(actions[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(Map<String, dynamic> action) {
    return GlassContainer(
      borderRadius: BorderRadius.circular(20),
      color: (action['color'] as Color).withOpacity(0.1),
      borderGradient: LinearGradient(
        colors: [
          (action['color'] as Color).withOpacity(0.3),
          (action['color'] as Color).withOpacity(0.0),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            action['icon'] as IconData,
            color: action['color'] as Color,
            size: 28,
          ),
          const SizedBox(height: 12),
          Text(
            action['label'] as String,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
