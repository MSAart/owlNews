import 'package:get/get.dart';
import 'package:owlnews/helper/category_data.dart';
import 'package:owlnews/helper/news_data.dart';
import 'package:owlnews/models/article_model.dart';
import 'package:owlnews/models/category_model.dart';

class HomeController extends GetxController {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = [];
  late Repository repository = Repository(category: 'business');
  RxBool loading = false.obs;

  getNews() async {
    // Repository repository = Repository(category: 'business');
    articles = await repository.fetchArticle();
    loading = false.obs;
  }

  @override
  void onInit() {
    super.onInit();
    getNews();
    categories = getCategories();
    // TODO: implement onInit
  }
}
