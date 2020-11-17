import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/places.dart';
import 'add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: Consumer<Places>(
        child: Center(
          child: Text('Got no places yet, start adding some!'),
        ),
        builder: (ctx, places, ch) => places.items.length <= 0
            ? ch
            : ListView.builder(
                itemCount: places.items.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(places.items[i].image),
                  ),
                  title: Text(places.items[i].title),
                  onTap: () {},
                ),
              ),
      ),
    );
  }
}
