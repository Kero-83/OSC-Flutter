import 'package:bloc/bloc.dart';

part 'data_reciving_state.dart';

class DataRecivingCubit extends Cubit<DataRecivingState> {
  DataRecivingCubit() : super(DataRecivingInitial(true));
  void dataRecived() {
    emit(DataRecived(false));
  }
}
