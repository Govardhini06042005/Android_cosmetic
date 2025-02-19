import 'package:flutter/material.dart';

class TutorialsScreen extends StatefulWidget {
  const TutorialsScreen({super.key});

  @override
  _TutorialsScreenState createState() => _TutorialsScreenState();
}

class _TutorialsScreenState extends State<TutorialsScreen> {
  String _selectedLevel = 'Beginner';
  String _searchQuery = '';

  final List<Map<String, String>> _allTutorials = [
    {
      'title': 'Base Makeup',
      'description': '1. Primer: Creates a smooth base for even foundation application and longer wear. Apply after moisturizing, focusing on the T-zone.'
          '2. Foundation: Evens skin tone and hides imperfections. Choose a matching shade and blend evenly using a brush, sponge, or fingers.'
          '3. Concealer: Provides extra coverage for blemishes and dark circles. Dab onto problem areas and blend gently.'
          '4. Setting Powder: Sets foundation and concealer, reducing shine and preventing creases. Lightly dust over the face, focusing on oily areas.'
          '5. Setting Spray: Locks in makeup for long-lasting freshness. Mist evenly over the face from a distance.',
      'imagePath': 'assets/images/basem.jpg',
      'level': 'Beginner',
    },
    {
      'title': 'Eye Makeup',
      'description': '1. Eye Primer: Preps eyelids for smooth eyeshadow application and longer wear. Apply a small amount to the lids before eyeshadow.'
          '2. Eyeshadow: Adds color and dimension to your eyes. Apply a base color all over the lid, then blend darker shades into the crease for depth.'
          '3. Eyeliner: Defines the eyes and adds contrast. Apply along the upper and lower lash lines; use a pencil, gel, or liquid liner.'
          '4. Mascara: Enhances lashes, making them fuller and longer. Apply from the base to the tips of lashes in a zigzag motion for volume.'
          '5. Eyebrow Pencil/Gel: Shapes and fills in brows for a polished look. Use a pencil or gel to define the brow shape and fill in sparse areas.',
      'imagePath': 'assets/images/eye.jpg',
      'level': 'Beginner',
    },
    {
      'title': 'Lip Makeup',
      'description': '1. Lip Balm: Moisturizes and preps lips for color application. Apply a thin layer before any lip products to keep lips hydrated.'
          '2. Lip Liner: Defines and shapes lips, preventing lipstick from feathering. Trace around your lips’ natural edge before applying lipstick.'
          '3. Lipstick: Adds color and completes the look. Apply directly from the bullet or with a brush for precise application; choose a shade that complements your makeup.'
          '4. Lip Gloss: Adds shine and a fuller look to your lips. Apply on top of lipstick or on its own for a glossy finish.'
          '5. Lip Stain: Provides long-lasting, natural-looking color. Apply a thin layer and blot for a sheer, durable tint.',
      'imagePath': 'assets/images/lipb.jpg',
      'level': 'Beginner',
    },
    // Advanced tutorials
    {
      'title': 'Bridal Makeup',
      'description': 'Comprehensive guide for bridal makeup including base, eyes, lips, and more.',
      'imagePath': 'assets/images/bridal.jpg',
      'level': 'Advanced',
    },
    {
      'title': 'Party Makeup',
      'description': 'Trendy and glamorous makeup tips for parties and events.',
      'imagePath': 'assets/images/party.jpg',
      'level': 'Advanced',
    },
    {
      'title': 'Puppetry Makeup',
      'description': 'Unique makeup techniques for creating puppet-like effects.',
      'imagePath': 'assets/images/puppetry.jpg',
      'level': 'Advanced',
    },
    {
      'title': 'Engagement Makeup',
      'description': 'Elegant makeup looks for engagement ceremonies.',
      'imagePath': 'assets/images/engagement.jpg',
      'level': 'Advanced',
    },
  ];

  List<Map<String, String>> get _filteredTutorials {
    return _allTutorials.where((tutorial) {
      final levelMatch = _selectedLevel == 'All' || tutorial['level'] == _selectedLevel;
      final searchMatch = tutorial['title']!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          tutorial['description']!.toLowerCase().contains(_searchQuery.toLowerCase());
      return levelMatch && searchMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorials'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: TutorialSearchDelegate(
                  onSearch: (query) {
                    setState(() {
                      _searchQuery = query;
                    });
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/f.jpg'), // Ensure the path is correct
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Introduction
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Explore our comprehensive tutorials to master your makeup skills. Browse by category, difficulty, or featured tutorials to find what suits you best.',
                style: TextStyle(fontSize: 16.0, color: Colors.black54),
              ),
            ),

            // Filters/Sorting Options
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FilterChip(
                    label: const Text('Beginner'),
                    selected: _selectedLevel == 'Beginner',
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedLevel = selected ? 'Beginner' : 'All';
                      });
                    },
                  ),
                  FilterChip(
                    label: const Text('Advanced'),
                    selected: _selectedLevel == 'Advanced',
                    onSelected: (bool selected) {
                      setState(() {
                        _selectedLevel = selected ? 'Advanced' : 'All';
                      });
                    },
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      // Handle sort option
                    },
                    itemBuilder: (BuildContext context) {
                      return {'Newest', 'Popular', 'Top Rated'}.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                    child: const Row(
                      children: [
                        Icon(Icons.sort),
                        SizedBox(width: 8),
                        Text('Sort'),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Featured Tutorials
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Makeup Essentials',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),

            // Tutorial List
            Expanded(
              child: ListView(
                children: _filteredTutorials.map((tutorial) {
                  return _buildTutorialItem(
                    tutorial['title']!,
                    tutorial['description']!,
                    tutorial['imagePath']!,
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTutorialItem(String title, String description, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: Image.asset(imagePath, width: 120, height: 120, fit: BoxFit.cover), // Enlarged images
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        onTap: () {
          // Handle tutorial selection
        },
      ),
    );
  }
}

class TutorialSearchDelegate extends SearchDelegate<String> {
  final void Function(String query) onSearch;

  TutorialSearchDelegate({required this.onSearch});

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          title: Text('Search Results'),
        ),
        // Add your search suggestions here if needed
      ],
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final query = this.query;

    onSearch(query);

    return ListView(
      children: const [
        // Display search results if needed
        // You could filter and show the results based on the query here
      ],
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }
}
