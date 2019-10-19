import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/error/no_params.dart';
import 'package:flutter_clean_architecture/core/http/http_client_impl.dart';
import 'package:flutter_clean_architecture/core/http/network_info_impl.dart';
import 'package:flutter_clean_architecture/core/persistence/key_value_store_impl.dart';
import 'package:flutter_clean_architecture/features/feed/data/datasources/feed_local_data_source_impl.dart';
import 'package:flutter_clean_architecture/features/feed/data/datasources/feed_remote_data_source_impl.dart';
import 'package:flutter_clean_architecture/features/feed/data/repositories/feeds_repository_impl.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/bloc/feeds_bloc.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/bloc/feeds_state.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/widgets/feed_list.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FeedsScreen extends StatefulWidget {
  @override
  _FeedsScreenState createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  FeedsBloc bloc;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((sharedPreferences) {
      bloc = FeedsBloc(repository: FeedsRepositoryImpl(remoteDataSource: FeedRemoteDataSourceImpl(httpClient: HttpClientImpl(client: http.Client())), localDataSource: FeedLocalDataSourceImpl(keyValueStore: KeyValueStoreImpl(sharedPreferences: sharedPreferences)), networkInfo: NetworkInfoImpl(DataConnectionChecker())));
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (bloc == null) {
      return Scaffold(body: CircularProgressIndicator());
    }
    bloc.add(NoParams());
    return Scaffold(
      body: BlocBuilder<FeedsBloc, FeedsState>(
          bloc: bloc,
          builder: (BuildContext context, FeedsState feedState) {
            if (feedState is FeedsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (feedState is FeedsError) {
              return Text('Ayo! Error');
            } else if (feedState is FeedsLoaded) {
              return FeedList(feeds: feedState.feedItems);
            }
            return Container(
                color: Colors.orangeAccent,
                height: double.infinity,
                width: double.infinity);
          }),
    );
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
}

