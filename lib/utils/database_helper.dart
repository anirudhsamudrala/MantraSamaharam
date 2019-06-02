import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_app/models/landingmenu.dart';

void main() async {
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'mantra_database.db'),
    // When the database is first created, create a table to store dogs
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE LandingMenu(id INTEGER PRIMARY KEY, iconImagePath TEXT, iconImageText TEXT)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  Future<void> insertDog(LandingMenu landingMenu) async {
    // Get a reference to the database
    final Database db = await database;

    // Insert the Dog into the correct table. We will also specify the
    // `conflictAlgorithm` to use in this case. If the same dog is inserted
    // multiple times, it will replace the previous data.
    await db.insert(
      'LandingMenu',
      landingMenu.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<LandingMenu>> landingMenu() async {
    // Get a reference to the database
    final Database db = await database;

    // Query the table for All The Dogs.
    final List<Map<String, dynamic>> landingMenus =
        await db.query('LandingMenu');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(landingMenus.length, (i) {
      return LandingMenu(
          id: landingMenus[i]['id'],
          iconImagePath: landingMenus[i]['iconImagePath'],
          iconImageText: landingMenus[i]['iconImageText']);
    });
  }

  var menuItem1 = LandingMenu(
    id: 1,
    iconImagePath: 'assets/images/om.jpg',
    iconImageText: 'Om',
  );
  var menuItem2 = LandingMenu(
    id: 2,
    iconImagePath: 'assets/images/ganesha.png',
    iconImageText: 'Ganesh',
  );

  var menuItem3 = LandingMenu(
    id: 2,
    iconImagePath: 'assets/images/pooja.png',
    iconImageText: 'Pooja',
  );
  // Insert a dog into the database
  await insertDog(menuItem1);
  await insertDog(menuItem2);
  await insertDog(menuItem3);

  // Print the list of dogs (only Fido for now)
  print(await landingMenu());
}
