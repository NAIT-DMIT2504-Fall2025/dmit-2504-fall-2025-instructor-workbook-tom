import 'package:flutter/material.dart';
import 'package:profile_example/widgets/header.dart';
import 'package:profile_example/widgets/profile_image.dart';
import 'package:profile_example/widgets/profile_info.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile Page')),
      body: Center(
        child: Column(
          children: [
            // Header
            Header(),
            ProfileImage(imageUrl: 'assets/images/dog.jpg'),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Nathan Dogphry',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
            ),
            Column(
              children: [
                ProfileInfo(label: 'Role', value: 'Good Boy'),
                ProfileInfo(
                  label: 'Responsibilites',
                  value: 'Fetch, Bark, Lick',
                ),
                ProfileInfo(label: 'Favourite Food', value: 'Eggs'),
                ProfileInfo(label: 'Handle', value: '@TheRealDogphry'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
