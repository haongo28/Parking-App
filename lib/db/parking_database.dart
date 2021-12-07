import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shrine/model/parking.dart';

class ParkingDatabase {
  static final ParkingDatabase instance = ParkingDatabase._init();

  static Database? _database;

  ParkingDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('parking.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';

    await db.execute('''
  CREATE TABLE $tableParking ( 
    ${GuestFields.id} $idType, 
    ${GuestFields.licensePlate} $textType,
    ${GuestFields.timeCheckin} $textType,
    ${GuestFields.timeCheckout} $textType,
    ${GuestFields.imgPath} $textType
    )
  ''');
    }

  Future<Guest> create(Guest guest) async {
    final db = await instance.database;

    final id = await db.insert(tableParking, guest.toJson());
    return guest.copy(id: id);
  }

  Future<Guest> readNote(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      tableParking,
      columns: GuestFields.values,
      where: '${GuestFields.id} = ?', // prevents sql injection
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Guest.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<Guest>> readAllNotes() async {
    final db = await instance.database;

    final orderBy = '${GuestFields.checkin_time} ASC';
    // final result =
    //     await db.rawQuery('SELECT * FROM $tableNotes ORDER BY $orderBy');

    final result = await db.query(tableParking, orderBy: orderBy);

    return result.map((json) => Guest.fromJson(json)).toList();
  }

  Future<int> insert(Guest guest) async {
    final db = await instance.database;

    return db.insert(
      tableParking,
      guest.toJson(),

    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      tableParking,
      where: '${GuestFields.id} = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}