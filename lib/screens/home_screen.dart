import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFF4F3F2), // F2F2F2
        // appBar: AppBar(title: const Text('Title')),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search any places',
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.blueAccent,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blueAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.blueAccent,
                      width: 2,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _CategoryChip(icon: Icons.terrain, label: 'Mountains'),
                    SizedBox(width: 8),
                    _CategoryChip(icon: Icons.beach_access, label: 'Beache'),
                    SizedBox(width: 8),
                    _CategoryChip(icon: Icons.water, label: 'Lakes'),
                    SizedBox(width: 8),
                    _CategoryChip(icon: Icons.local_florist, label: 'Camp'),
                    SizedBox(width: 8),
                    _CategoryChip(
                      icon: Icons.temple_buddhist,
                      label: 'Tamples',
                    ),
                    SizedBox(width: 8),
                    _CategoryChip(
                      icon: Icons.account_balance,
                      label: 'Pagodas',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Recommended',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 10),
              // SizedBox(
              //   height: 225,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: products.length,
              //     itemBuilder: (context, index) {
              //       return GestureDetector(onTap: () {});
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CategoryChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.blueAccent, size: 24),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.blueAccent[700],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
