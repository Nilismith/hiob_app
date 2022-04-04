import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../manager.dart';

part 'manager_state.dart';

class ManagerCubit extends Cubit<ManagerState> {
  Manager manager;
  StreamSubscription? streamSubscription;

  ManagerCubit({required this.manager})
      : super(ManagerState(status: ManagerStatus.loading)) {
    streamSubscription =
        manager.managerStatusStreamController.stream.listen(onStatusChange);
  }

  void onStatusChange(ManagerStatus status) {
    print("Status change");
    emit(ManagerState(status: status));
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
