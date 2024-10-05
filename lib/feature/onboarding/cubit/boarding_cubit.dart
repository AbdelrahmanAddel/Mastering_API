import 'package:bloc/bloc.dart';

part 'boarding_state.dart';

class BoardingCubit extends Cubit<BoardingState> {
  BoardingCubit() : super(BoardingInitial());
  int currentIndex=0;

  void changeCurrentIndex(int index){
    currentIndex=index;

    emit(ChangeCurrentIndexSuccess());

  }
  

}
