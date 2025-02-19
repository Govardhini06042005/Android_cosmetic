import 'package:flutter/material.dart';

class DashboardOfFragments extends StatelessWidget {
  const DashboardOfFragments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Handle logout logic here
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Menu'),
            ),
            ListTile(
              title: const Text('Tutorials'),
              onTap: () {
                Navigator.pushNamed(context, '/tutorials'); // Navigate to Tutorials screen
              },
            ),
            ListTile(
              title: const Text('Products'),
              onTap: () {
                Navigator.pushNamed(context, '/products'); // Navigate to Products screen
              },
            ),
            ListTile(
              title: const Text('Offers'),
              onTap: () {
                Navigator.pushNamed(context, '/offers'); // Navigate to Offers screen
              },
            ),
            // Add more items as needed
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/pback.jpg'), // Ensure the path is correct
            fit: BoxFit.cover, // Adjusts the image to cover the whole screen
          ),
        ),
        child: const Center(
          child: Text(
            'Beauty Unveiled',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.purple, // Adjust text color for contrast
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
