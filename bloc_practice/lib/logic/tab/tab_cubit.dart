import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit() : super(TabState(status: TabStatus.tabOne));

  void tabChange(int index) {
    emit(
      TabState(
        status: index == TabStatus.tabOne.index
            ? TabStatus.tabOne
            : TabStatus.tabTwo,
      ),
    );
  }
}
