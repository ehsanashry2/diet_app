import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/plan_model.dart';


class PlansCubit extends Cubit<PlansState> {
  PlansCubit() : super(PlansInitialState());
  //==================================
  //================================== Variables
  //==================================
  List<PlanModel> plans = [];
  //==================================
  //================================== Functions
  //==================================
  Future<List<PlanModel>> _requestPlansAPI()async{
    await Future.delayed(Duration(seconds: 2));
    return [
      PlanModel(title: 'Diet Plan', description: 'Chicken wings, Vegetables and Fru..',price:180,imageUrl: 'plans.png'),
      PlanModel(title: 'Gym Plan', description: 'Chicken wings, Vegetables and Fru..',price:160, imageUrl: 'food2.png'),
      PlanModel(title: 'Gym Plan', description: 'Chicken wings, Vegetables and Fru..',price:190, imageUrl: 'plans.png'),
      PlanModel(title: 'Gym Plan', description: 'Chicken wings, Vegetables and Fru..',price:170, imageUrl: 'food2.png'),

    ];
  }
  void getPlans() async{
    emit(PlansLoadingState());
    try{
      plans = await _requestPlansAPI();
      if(plans.isNotEmpty)emit(PlansLoadedState(plans: plans));
      else emit(PlansEmptyState());
    }
    catch(e){
      emit(PlansErrorState(message: e.toString()));
    }

  }
}

abstract class PlansState {
  dynamic data;

  PlansState({this.data});
}

//============================== States
class PlansInitialState extends PlansState {}
class PlansLoadingState extends PlansState {}
class PlansEmptyState extends PlansState {}
class PlansLoadedState extends PlansState {
  List<PlanModel> plans;

  PlansLoadedState({this.plans = const []});
}
class PlansErrorState extends PlansState {
  String message;

  PlansErrorState({this.message = ''});
}
