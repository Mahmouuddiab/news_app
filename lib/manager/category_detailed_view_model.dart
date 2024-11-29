import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_bakry/data/api_manager.dart';
import 'package:news_bakry/manager/source_state.dart';

class CategoryDetailsViewModel extends Cubit<SourceState>{
  CategoryDetailsViewModel():super(LoadingSourceState());
  getNewSources(String categoryId)async{
    try{
      emit(LoadingSourceState());
      var response=await ApiManager.fetchSources(categoryId);
      if(response.status=="error"){
        emit(ErrorSourceState(errorMessage:''));
        return;
      }
      if(response.status=="ok"){
        emit(SuccessSourceState(sourceList: response.sources!));
        return;
      }
    }
    catch(e){
      emit(ErrorSourceState(errorMessage: 'something went wrong'));
    }
  }
}