part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}

// Connection States...
class ConnectionIsONState extends InternetState{}

class ConnectionIsOFFState extends InternetState{}
