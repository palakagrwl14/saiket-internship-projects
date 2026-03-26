import 'package:flutter/material.dart';

void main() {
  runApp(const ImageGalleryApp());
}

class ImageGalleryApp extends StatelessWidget {
  const ImageGalleryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Gallery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const GalleryScreen(),
    );
  }
}

// Image Model
class GalleryImage {
  final String url;
  final String title;
  final String category;

  GalleryImage({
    required this.url,
    required this.title,
    required this.category,
  });
}

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  // Sample images from the internet (using placeholder images)
  final List<GalleryImage> images = [
    GalleryImage(
      url: 'https://images.pexels.com/photos/35086427/pexels-photo-35086427.jpeg',
      title: 'Harbor view',
      category: 'Nature',
    ),
    GalleryImage(
      url: 'https://images.pexels.com/photos/31884808/pexels-photo-31884808.jpeg',
      title: 'Ocean View',
      category: 'Nature',
    ),
    GalleryImage(
      url: 'https://images.pexels.com/photos/30368541/pexels-photo-30368541.jpeg',
      title: 'Architectural',
      category: 'Architecture',
    ),
    GalleryImage(
      url: 'https://images.pexels.com/photos/32430931/pexels-photo-32430931.jpeg',
      title: 'Monument',
      category: 'Architecture',
    ),
    GalleryImage(
      url: 'https://images.pexels.com/photos/33559338/pexels-photo-33559338.jpeg',
      title: 'Building',
      category: 'Architecture',
    ),
    GalleryImage(
      url: 'https://images.pexels.com/photos/5664918/pexels-photo-5664918.jpeg',
      title: 'City',
      category: 'Architecture',
    ),
    GalleryImage(
      url: 'https://images.pexels.com/photos/1133584/pexels-photo-1133584.jpeg',
      title: 'Footprints at beach',
      category: 'Nature',
    ),
    GalleryImage(
      url: 'https://images.pexels.com/photos/32847725/pexels-photo-32847725.jpeg',
      title: 'Beach Sunset',
      category: 'Nature',
    ),
    GalleryImage(
      url: 'https://images.pexels.com/photos/8336184/pexels-photo-8336184.jpeg',
      title: 'Dessert',
      category: 'Food',
    ),
    GalleryImage(
      url: 'https://images.pexels.com/photos/3084603/pexels-photo-3084603.jpeg',
      title: 'Wine',
      category: 'Food',
    ),
    GalleryImage(
      url: 'https://images.pexels.com/photos/3820638/pexels-photo-3820638.jpeg',
      title: 'Pasta',
      category: 'Food',
    ),
    GalleryImage(
      url: 'https://images.pexels.com/photos/7912400/pexels-photo-7912400.jpeg',
      title: 'Pizza',
      category: 'Food',
    ),
  ];

  String selectedCategory = 'All';

  List<String> get categories {
    final cats = images.map((img) => img.category).toSet().toList();
    cats.insert(0, 'All');
    return cats;
  }

  List<GalleryImage> get filteredImages {
    if (selectedCategory == 'All') {
      return images;
    }
    return images.where((img) => img.category == selectedCategory).toList();
  }

  void openImageDetail(GalleryImage image) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ImageDetailScreen(image: image),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Gallery',style: TextStyle(fontSize: 30,color: Colors.white,fontStyle: FontStyle.italic)),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Column(
        children: [
          // Category Filter
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                final isSelected = selectedCategory == category;

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    selectedColor: Colors.blue,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                );
              },
            ),
          ),

          // Image Count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Text(
                  '${filteredImages.length} Images',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // GridView for Images
          Expanded(
            child: filteredImages.isEmpty
                ? Center(
              child: Text(
                'No images in this category',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade600,
                ),
              ),
            )
                : GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 columns
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1, // Square items
              ),
              itemCount: filteredImages.length,
              itemBuilder: (context, index) {
                final image = filteredImages[index];
                return GalleryTile(
                  image: image,
                  onTap: () => openImageDetail(image),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Gallery Tile Widget
class GalleryTile extends StatelessWidget {
  final GalleryImage image;
  final VoidCallback onTap;

  const GalleryTile({
    Key? key,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Hero(
        tag: image.url,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              fit: StackFit.expand,
              children: [
                // Image
                Image.network(
                  image.url,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: Colors.grey.shade200,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade300,
                      child: const Icon(
                        Icons.broken_image,
                        size: 50,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),

                // Gradient Overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7),
                      ],
                    ),
                  ),
                ),

                // Title
                Positioned(
                  bottom: 8,
                  left: 8,
                  right: 8,
                  child: Text(
                    image.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),

                // Category Badge
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      image.category,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Image Detail Screen
class ImageDetailScreen extends StatelessWidget {
  final GalleryImage image;

  const ImageDetailScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Share functionality would go here'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Added to favorites!'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Full-size Image with Hero Animation
          Expanded(
            child: Center(
              child: Hero(
                tag: image.url,
                child: InteractiveViewer(
                  minScale: 0.5,
                  maxScale: 4.0,
                  child: Image.network(
                    image.url,
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                              : null,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          // Image Info
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  image.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        image.category,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Tap and drag to move • Pinch to zoom',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}