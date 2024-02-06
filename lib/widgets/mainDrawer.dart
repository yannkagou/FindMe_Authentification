import 'package:flutter/material.dart';

class mainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0x1665AE),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 60,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                'Reglages',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            leading: Icon(
              Icons.key,
              size: 26,
            ),
            title: Text(
              'Compte',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              size: 26,
            ),
            title: Text(
              'Notifications',
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
