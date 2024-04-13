import 'dart:async';
import 'package:floor/floor.dart';
import 'package:news_mob_app/data/datasources/local/articles_dao.dart';
import 'package:news_mob_app/data/datasources/local/converter/source_type_converter.dart';
import 'package:news_mob_app/domain/models/responses/article.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [Article])
@TypeConverters([SourceTypeConverter])
abstract class AppDatabase extends FloorDatabase {
  ArticleDao get articleDao;
}
