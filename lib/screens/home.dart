import 'package:flutter/material.dart';
import 'package:news_bakry/models/category_data.dart';
import 'package:news_bakry/screens/category_item.dart';
import 'package:news_bakry/screens/home_drawer.dart';
import 'package:news_bakry/screens/selected_category.dart';
import 'package:news_bakry/utils/app_colors.dart';

class Home extends StatefulWidget {
  static const String routeName = "home";
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var categoryList = CategoryData.getCategories();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.white,
          child: Image.asset(
            "assets/images/pattern.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(
                selectedCategoryData == null
                    ? 'News'
                    : selectedCategoryData!.title,
                style: Theme.of(context).textTheme.titleLarge,
              ),

            ),
            drawer: HomeDrawer(
              onCategoryChangedClicked: onCategoryChangedClicked,
            ),
            body: selectedCategoryData == null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Pick your category \n of interest!",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 12,
                                    crossAxisSpacing: 12),
                            itemBuilder: (context, index) {
                              return CategoryItem(
                                categoryData: categoryList[index],
                                index: index,
                                onCategoryClicked: onCategoryClicked,
                              );
                            },
                            itemCount: categoryList.length,
                          ),
                        ),
                      ],
                    ),
                  )
                : SelectedCategory(categoryData: selectedCategoryData!))
      ],
    );
  }

  CategoryData? selectedCategoryData;
  void onCategoryClicked(CategoryData categoryData) {
    setState(() {
      selectedCategoryData = categoryData;
    });
  }

  void onCategoryChangedClicked() {
    setState(() {
      selectedCategoryData = null;
      Navigator.pop(context);
    });
  }
}
