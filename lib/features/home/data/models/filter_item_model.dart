import 'package:intersect_task/core/theming/app_images.dart';

class FilterItemModel {
  final String image;
  final String title;

  FilterItemModel({required this.image, required this.title});
}

List<FilterItemModel> filterItems = [
  FilterItemModel(image: Assets.imagesGeneral, title: 'Genre'),
  FilterItemModel(image: Assets.imagesTop, title: 'Top IMDB'),
  FilterItemModel(image: Assets.imagesLanguage, title: 'Language'),
  FilterItemModel(image: Assets.imagesWatched, title: 'Watched'),
];
