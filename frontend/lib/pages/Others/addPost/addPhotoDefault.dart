import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import '../../../widgets/features/pickImage.dart';
import 'dart:io';

class Addphotodefault extends StatefulWidget {
  const Addphotodefault({super.key});

  @override
  _AddphotodefaultState createState() => _AddphotodefaultState();
}

class _AddphotodefaultState extends State<Addphotodefault> {
  int _rating = 0;
  final TextEditingController _visitController = TextEditingController();
  File? _image;
  String? _imageUrl;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedImage != null) {
        if (kIsWeb) {
          _imageUrl = pickedImage.path;
        }
        _image = File(pickedImage.path);
      } else {
        print("No Image is Picked");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Photo '),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create post',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            _image == null
                ? SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Positioned(
                          child: ElevatedButton(
                            onPressed: () {
                              getImage();
                            },
                            child: const Text('Select photo'),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            // TODO: Implement image browsing logic
                          },
                          child: const Text('Browser'),
                        ),
                      ],
                    ),
                  )
                : Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: FileImage(_image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            const Text(
              'Search Place',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _visitController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search Place...',
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      maxLines: 1,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Perform search action
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Recent Searches',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Place $index'),
                    subtitle: Text('Location $index'),
                    onTap: () {
                      // Perform action on place selection
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Add Review',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Row(
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                  ),
                  color: Colors.amber,
                  onPressed: () {
                    setState(() {
                      _rating = index + 1;
                    });
                  },
                );
              }),
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle: const TextStyle(fontSize: 18),
                ),
                child: const Text('Publish'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
