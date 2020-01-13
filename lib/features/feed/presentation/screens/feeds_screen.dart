import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/error/no_params.dart';
import 'package:flutter_clean_architecture/features/feed/domain/repositories/feeds_repository.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/bloc/feeds_bloc.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/bloc/feeds_state.dart';
import 'package:flutter_clean_architecture/features/feed/presentation/widgets/feed_list.dart';
import 'package:flutter_clean_architecture/injection_container.dart';

class FeedsScreen extends StatefulWidget {
  @override
  _FeedsScreenState createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  FeedsBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = FeedsBloc(repository: sl<FeedsRepository>());
  }

  @override
  Widget build(BuildContext context) {
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
