import 'package:flutter/material.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountEmail: Text(""),
            accountName: Text("sahal rahman"),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'assets/SideBar_img/Sidebar_img.jpg',
              ),
              fit: BoxFit.fill,
            )),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text("Share Doingly App"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.mail_outline),
            title: Text("Contact Us"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.info_rounded),
            title: Text("About App"),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.logout_rounded),
            title: Text("Sign Out"),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
