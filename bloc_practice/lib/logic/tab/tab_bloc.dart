import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'tab_event.dart';
part 'tab_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabInitial());

  @override
  Stream<TabState> mapEventToState(
    TabEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
