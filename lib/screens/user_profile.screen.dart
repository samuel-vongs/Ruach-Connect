import 'package:fintech_app/screens/edit_profile.dart';
import 'package:fintech_app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  Map<String, String>? userData;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final userDetails = await authService.fetchCredentialsFromFirestore();
    if (userDetails != null) {
      setState(() {
        userData = userDetails;
      });
    }
  }

  Future<void> _logout() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    await authService.signOut();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  Future<void> _deleteAccount() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    await authService.deleteUserAccount();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    userData?['name'] ?? 'Loading...',
                    style: GoogleFonts.roboto(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff001c39),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                buildCard(Icons.email,
                    'Email: ${userData?['email'] ?? 'Loading...'}'),
                buildCard(Icons.phone, 'Phone: ${userData?['phone'] ?? 'N/A'}'),
                buildCard(
                    Icons.home, 'Address: ${userData?['address'] ?? 'N/A'}'),
                buildCard(
                    Icons.cake, 'Date of Birth: ${userData?['dob'] ?? 'N/A'}'),
                buildCard(Icons.info, 'Bio:',
                    subtitle: userData?['bio'] ?? 'N/A'),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _navigateToEditProfile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff001c39),
                    ),
                    child: Text('Edit Profile', style: GoogleFonts.roboto()),
                  ),
                ),
                const SizedBox(height: 20),
                buildCard(Icons.logout, 'Logout', onTap: _logout),
                buildCard(Icons.delete, 'Delete Account',
                    onTap: _deleteAccount),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card buildCard(IconData icon, String title,
      {String? subtitle, GestureTapCallback? onTap}) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title,
            style: GoogleFonts.roboto().copyWith(
              color: Color(0xff001c39),
              fontSize: 14,
            )),
        subtitle: subtitle != null
            ? Text(subtitle, style: GoogleFonts.roboto())
            : null,
        onTap: onTap,
      ),
    );
  }

  void _navigateToEditProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          onProfileUpdated: () {
            fetchUserData();
          },
        ),
      ),
    );
  }
}
