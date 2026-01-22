import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/pet.dart';

class ApiService {
  // For Android Emulator, use 10.0.2.2. For iOS Simulator, use localhost.
  // For physical devices, use the local machine IP address.
  // IMPORTANT: Update this IP when your network changes!
  static const String _localMachineIP = '172.31.12.73';

  // Set to true when testing on physical Android device
  static const bool _isPhysicalDevice = true;

  static String get baseUrl {
    if (Platform.isAndroid) {
      // Use machine IP for physical devices, 10.0.2.2 for emulator
      final host = _isPhysicalDevice ? _localMachineIP : '10.0.2.2';
      return 'http://$host:8082/pets';
    }
    return 'http://localhost:8082/pets';
  }

  Future<List<Pet>> getPets() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item) => Pet.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load pets');
    }
  }

  Future<Pet> createPet(Pet pet) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(pet.toJson()),
    );

    if (response.statusCode == 200) {
      return Pet.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create pet');
    }
  }
}
