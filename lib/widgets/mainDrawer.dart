import 'package:flutter/material.dart';

class mainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color(0xFF32B108),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 60,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF1665AE),
                ),
                child: Text(
                  'Reglages',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              leading: const Icon(
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
              leading: const Icon(
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
      ),
    );
  }
}
