import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Viewalldoctor extends StatelessWidget {
  const Viewalldoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Category',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategoryIcon(
                  'assets/icons/Icon_Healt.svg',
                  "Healthy",
                  Colors.purple,
                ),
                _buildCategoryIcon(
                  'assets/icons/IconPet.svg',
                  "Grooming",
                  const Color(0xffB77EFFAB),
                ),
                _buildCategoryIcon(
                  'assets/icons/IconPet Food.svg',
                  "Pet Food",
                  const Color(0xffB77EFFAB),
                ),
                _buildCategoryIcon(
                  'assets/icons/Icon - Home.png',
                  "Boarding",
                  const Color(0xffB77EFFAB),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade200,
              ),
            ),
            const SizedBox(height: 20),

            // "Show All" Button
            GestureDetector(
              onTap: () {
                // Navigate to the page that shows all doctors
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllDoctorsPage(),
                  ),
                );
              },
              child: const Text(
                'Show All',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Veterinary Doctors Title
            const Text(
              'Veterinary Doctors',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // List of Doctors
            Expanded(
              child: ListView(
                children: [
                  _buildDoctorCard(
                    context,
                    name: "Dr. Kalini Jithma",
                    specialty: "Veterinary Behavioral",
                    rating: 4.8,
                    distance: "12 km",
                    imageUrl: "https://via.placeholder.com/150",
                  ),
                  const SizedBox(height: 10),
                  _buildDoctorCard(
                    context,
                    name: "Dr. D. Deshapriya",
                    specialty: "Veterinary Surgery",
                    rating: 4.9,
                    distance: "8 km",
                    imageUrl: "https://via.placeholder.com/150",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(String icon, String label, Color backgroundColor) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: backgroundColor,
          child: icon.endsWith('.svg')
              ? SvgPicture.asset(icon, height: 28, width: 28)
              : Image.asset(icon, height: 28, width: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorCard(
      BuildContext context, {
        required String name,
        required String specialty,
        required double rating,
        required String distance,
        required String imageUrl,
      }) {
    return GestureDetector(
      onTap: () {
        _showBookingBottomSheet(context, name);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    specialty,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/vector.svg', width: 16),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.location_on,
                          color: Colors.white, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        distance,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imageUrl),
            ),
          ],
        ),
      ),
    );
  }

  void _showBookingBottomSheet(BuildContext context, String doctorName) {
    DateTime? selectedDate;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Book an Appointment with $doctorName",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListTile(
                      title: Text(
                        selectedDate != null
                            ? "Selected Date: ${DateFormat.yMMMd().format(selectedDate!)}"
                            : "Select Appointment Date",
                      ),
                      trailing: const Icon(Icons.calendar_today),
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2100),
                        );
                        if (pickedDate != null) {
                          setState(() {
                            selectedDate = pickedDate;
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Perform booking logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text("Confirm Booking"),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class AllDoctorsPage extends StatelessWidget {
  const AllDoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, String>> categories = [
      {"name": "Cats", "image": "https://images.unsplash.com/photo-1602526218675-b4ac6f3fc2c1"},
      {"name": "Dogs", "image": "https://images.unsplash.com/photo-1603966714596-ec2a191e58c3"},
      {"name": "Birds", "image": "https://images.unsplash.com/photo-1598102412327-d9a60e1609b4"},
      {"name": "Fish", "image": "https://images.unsplash.com/photo-1602526218675-2147f4f1b4d4"},
      {"name": "Rabbits", "image": "https://images.unsplash.com/photo-1574158622681-0178e9de8cd7"},
      {"name": "Horses", "image": "https://images.unsplash.com/photo-1531231001915-dfc300a9b6c1"},
    ];


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: const Text(
          'Doctors',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // عدد العناصر في كل صف
            crossAxisSpacing: 16, // المسافة الأفقية بين العناصر
            mainAxisSpacing: 16, // المسافة العمودية بين العناصر
            childAspectRatio: 1, // نسبة العرض إلى الطول للكروت
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return _buildCategoryCard(
              context,
              categories[index]["name"]!,
              categories[index]["image"]!,
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String category, String imageUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorListPage(category: category),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple.withOpacity(0.8), // تخفيف لون الخلفية
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(imageUrl),
            ),
            const SizedBox(height: 12),
            Text(
              category,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}






class DoctorListPage extends StatelessWidget {
  final String category;

  const DoctorListPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    List<_DoctorData> doctors;

    switch (category) {
      case "Cats":
        doctors = [
          _DoctorData(
            name: "Dr. Kalini Jithma",
            specialty: "Veterinary Behavioral",
            rating: 4.8,
            distance: "12 km",
            imageUrl: "https://randomuser.me/api/portraits/women/21.jpg",
          ),
          _DoctorData(
            name: "Dr. D. Deshapriya",
            specialty: "Veterinary Surgery",
            rating: 4.9,
            distance: "8 km",
            imageUrl: "https://randomuser.me/api/portraits/men/32.jpg",
          ),
        ];
        break;
      case "Dogs":
        doctors = [
          _DoctorData(
            name: "Dr. Sanjay Kumar",
            specialty: "Veterinary Medicine",
            rating: 4.7,
            distance: "10 km",
            imageUrl: "https://randomuser.me/api/portraits/men/12.jpg",
          ),
          _DoctorData(
            name: "Dr. Priya Nair",
            specialty: "Veterinary Care",
            rating: 4.6,
            distance: "15 km",
            imageUrl: "https://randomuser.me/api/portraits/women/34.jpg",
          ),
        ];
        break;
      case "Birds":
        doctors = [
          _DoctorData(
            name: "Dr. Anjali Patil",
            specialty: "Avian Medicine",
            rating: 5.0,
            distance: "20 km",
            imageUrl: "https://randomuser.me/api/portraits/women/56.jpg",
          ),
          _DoctorData(
            name: "Dr. Rajesh Singh",
            specialty: "Poultry Care",
            rating: 4.5,
            distance: "25 km",
            imageUrl: "https://randomuser.me/api/portraits/men/78.jpg",
          ),
        ];
        break;
      default:
        doctors = [];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('$category Doctors'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: doctors.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return _buildDoctorCard(
              context,
              name: doctor.name,
              specialty: doctor.specialty,
              rating: doctor.rating,
              distance: doctor.distance,
              imageUrl: doctor.imageUrl,
            );
          },
        ),
      ),
    );
  }

  Widget _buildDoctorCard(
      BuildContext context, {
        required String name,
        required String specialty,
        required double rating,
        required String distance,
        required String imageUrl,
      }) {
    return GestureDetector(
      onTap: () {
        // Add action here
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    specialty,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/vector.svg', width: 16),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.location_on,
                          color: Colors.white, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        distance,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(imageUrl),
            ),
          ],
        ),
      ),
    );
  }
}

class _DoctorData {
  final String name;
  final String specialty;
  final double rating;
  final String distance;
  final String imageUrl;

  _DoctorData({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.distance,
    required this.imageUrl,
  });
}




