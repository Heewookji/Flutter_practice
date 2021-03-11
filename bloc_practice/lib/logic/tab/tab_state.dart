part of 'tab_cubit.dart';

enum TabStatus { tabOne, tabTwo }

class TabState extends Equatable {
  final TabStatus status;

  TabState({this.status = TabStatus.tabOne});

  @override
  List<Object> get props => [status];
}
