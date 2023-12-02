import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../common/colo_extension.dart';
import 'accountDetails.dart';
import 'notification.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool isDarkMode = false;
  bool _notificationsEnabled = true;

  void signUserOut(){
    FirebaseAuth.instance.signOut();
  }
  final user = FirebaseAuth.instance.currentUser!;
  Widget buildProfileImage() {
    if (user.photoURL != null) {
      // User has a profile picture from Google Sign-In
      return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(
          user.photoURL!,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      );
    } else {
      // Use the default image if no Google profile picture exists
      return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.asset(
          "assets/img/user_pic.png",
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions:[
          IconButton(
            onPressed:signUserOut,
            icon:Icon(
              Icons.logout,
              color:Colors.black
              ),
            )
        ],
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leadingWidth: 0,
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  buildProfileImage(),
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(30),
                  //   child: Image.asset(
                  //     "assets/img/u2.png",
                  //     width: 50,
                  //     height: 50,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user.email!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              _buildListItem(
                icon: Icons.account_circle,
                text: "Account",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditAccountPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              _buildListItem(
                icon: Icons.notifications,
                text: "Notification",
                onTap: () {
                  // Handle notification toggle logic
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 15),
              _buildListItem(
                icon: Icons.policy,
                text: "Privacy Policy",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PrivacyPolicyPage(),
                    ),
                  );
                  // Show privacy policy information
                },
              ),
              const SizedBox(height: 15),
              _buildListItem(
                icon: Icons.contact_mail,
                text: "Contact Us",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactusPage(),
                    ),
                  );
                  // Show contact information
                },
              ),
              const SizedBox(height: 15),
              _buildListItem(
                icon: Icons.settings,
                text: "Settings",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(
                        isDarkMode: isDarkMode,
                        toggleDarkMode: () {
                          setState(() {
                            isDarkMode = !isDarkMode;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 25),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(color: Colors.black12, blurRadius: 2),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.black),
                const SizedBox(width: 8),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.black),
          ],
        ),
      ),
    );
  }
}





class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Privacy Policy",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Privacy Policy",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            buildSectionTitle("Privacy Policy"),
            buildSectionContent(
              "This Privacy Policy governs the manner in which MindBody collects, uses, maintains, and discloses information collected from users of the MindBody application.",
            ),
            SizedBox(height: 20),
            buildSectionTitle("Personal Identification Information"),
            buildSectionContent(
              "MindBody may collect personal identification information from Users in various ways, including, but not limited to, when Users visit our app, register on the app, and in connection with other activities, services, features, or resources we make available on our app. Users may be asked for, as appropriate, name, email address, and other relevant information.",
            ),
            SizedBox(height: 20),
            buildSectionTitle("Non-Personal Identification Information"),
            buildSectionContent(
              "MindBody may collect non-personal identification information about Users whenever they interact with our app. Non-personal identification information may include the browser name, the type of device, and technical information about Users' means of connection to our app, such as the operating system and other similar information.",
            ),
            SizedBox(height: 20),
            buildSectionTitle("How We Protect Your Information"),
            buildSectionContent(
              "We adopt appropriate data collection, storage, and processing practices and security measures to protect against unauthorized access, alteration, disclosure, or destruction of your personal information and data stored on our app.",
            ),
            SizedBox(height: 20),
            buildSectionTitle("Sharing Your Personal Information"),
            buildSectionContent(
              "We do not sell, trade, or rent Users' personal identification information to others. We may share generic aggregated demographic information not linked to any personal identification information regarding visitors and users with our business partners, trusted affiliates, and advertisers for the purposes outlined above.",
            ),
            SizedBox(height: 20),
            buildSectionTitle("Changes to This Privacy Policy"),
            buildSectionContent(
              "MindBody has the discretion to update this privacy policy at any time. When we do, we will revise the updated date at the bottom of this page. We encourage Users to frequently check this page for any changes to stay informed about how we are helping to protect the personal information we collect. You acknowledge and agree that it is your responsibility to review this privacy policy periodically and become aware of modifications.",
            ),
            SizedBox(height: 20),
            buildSectionTitle("Your Acceptance of These Terms"),
            buildSectionContent(
              "By using this app, you signify your acceptance of this policy. If you do not agree to this policy, please do not use our app. Your continued use of the app following the posting of changes to this policy will be deemed your acceptance of those changes.",
            ),
            SizedBox(height: 20),
            buildSectionTitle("Contacting Us"),
            buildSectionContent(
              "If you have any questions about this Privacy Policy, the practices of this app, or your dealings with this app, please contact us at [contact@mindbodyapp.com].This document was last updated on 29.11.2023.",
            ),
            // Add more sections similarly using buildSectionTitle and buildSectionContent
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.justify,
    );
  }

  Widget buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.justify,
    );
  }
}

class ContactusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black), // Back button
          onPressed: () {
            Navigator.pop(context); // Navigate back when pressed
          },
        ),
        title: Text(
          "Contact Us",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "Contact Information:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text("Address: 123 Main Street, City, Country"),
            SizedBox(height: 20),
            Text("Phone: +123-456-7890"),
            SizedBox(height: 20),
            Text("Email: info@mindbody.com"),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Text(
              "Operating Hours:",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text("Monday - Friday: 9 AM to 5 PM"),
            SizedBox(height: 20),


          ],
        ),
      ),
    );
  }
}


class SettingsPage extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleDarkMode;

  const SettingsPage({
    required this.isDarkMode,
    required this.toggleDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: TColor.black), // Back button
          onPressed: () {
            Navigator.pop(context); // Navigate back when pressed
          },
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            color: TColor.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SwitchListTile(
        title: Text("Dark Mode"),
        value: isDarkMode,
        onChanged: (value) {
          toggleDarkMode();
        },
      ),
    );
  }
}
