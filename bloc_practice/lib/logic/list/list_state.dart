part of 'list_bloc.dart';

enum ListStatus { loading, success, failure }

@immutable
abstract class ListState {}

class ListInitial extends ListState {}
