import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bakry/data/api_manager.dart';
import 'package:news_bakry/manager/category_detailed_view_model.dart';
import 'package:news_bakry/manager/source_state.dart';
import 'package:news_bakry/models/category_data.dart';
import 'package:news_bakry/screens/selected_category_details.dart';

class SelectedCategory extends StatelessWidget {
  CategoryData categoryData;
  CategoryDetailsViewModel viewModel=CategoryDetailsViewModel();

  SelectedCategory({super.key, required this.categoryData});

  @override
  Widget build(BuildContext context) {

    return  BlocProvider(create:(context) => viewModel..getNewSources(categoryData.id),
    child: BlocBuilder<CategoryDetailsViewModel,SourceState>(builder:(context, state) {
      if(state is LoadingSourceState){
        return Center(child: CircularProgressIndicator());
      }
      else if(state is ErrorSourceState){
        return Column(children: [
          Text("something went wrong")
        ],);
      }
      else if(state is SuccessSourceState){
        return SelectedCategoryDetails(sourceList: state.sourceList);
      }
      return Container();
    }, ),);
  }
}
