
import 'package:hive/hive.dart';

part 'recipe.g.dart';

@HiveType(typeId: 0)
class Recipe {
  @HiveField(0)
  String title;
  @HiveField(1)
  String user;
  @HiveField(2)
  String imageUrl;
  @HiveField(3)
  String description;
  @HiveField(4)
  bool isFavorite;
  @HiveField(5)
  int favoriteCount;

  Recipe(this.title, this.user, this.imageUrl, this.description,
      this.isFavorite, this.favoriteCount);

  String key() => title.hashCode.toString();
}
