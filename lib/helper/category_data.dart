import 'package:owlnews/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = CategoryModel();

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Business";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Entertainment";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "General";

  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Health";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Science";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Sports";
  category.add(categoryModel);

  categoryModel = CategoryModel();
  categoryModel.categoryName = "Technology";

  category.add(categoryModel);

  return category;
}
