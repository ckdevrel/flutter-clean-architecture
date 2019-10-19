import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_clean_architecture/core/http/network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl(this.connectionChecker);
  final DataConnectionChecker connectionChecker;
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
