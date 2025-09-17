import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepOrange,
          backgroundColor: Colors.lightGreen,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Profile Page')),
        body: Center(
          child: Column(
            children: [
              // Header
              ProfileHeader(),
              ProfileImage(imageUrl: 'assets/images/dog.jpg'),
              Text(
                'Nathan Dogphry',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
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
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Employee Profile',
        style: TextStyle(
          fontSize: 36.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  final String imageUrl;
  const ProfileImage({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.cover),
        border: Border.all(
          width: 4.0,
          color: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfo({required this.label, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Text(value, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
