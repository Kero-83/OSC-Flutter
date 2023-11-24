part of 'data_reciving_cubit.dart';

abstract class DataRecivingState {
  final bool isLoading;
  DataRecivingState(this.isLoading) : super();
}

final class DataRecivingInitial extends DataRecivingState {
  DataRecivingInitial(super.isLoading);
}

final class DataRecived extends DataRecivingState {
  DataRecived(super.isLoading);
}
