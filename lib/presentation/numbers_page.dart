import 'package:flutter/material.dart';
import 'package:stream_flutter/presentation/bloc/numbers_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/numbers_datasource.dart';

class NumbersPage extends StatefulWidget {
  const NumbersPage({Key? key}) : super(key: key);

  @override
  State<NumbersPage> createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  @override
  void dispose() {
    BlocProvider.of<NumbersBloc>(context).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Numbers'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<NumbersBloc, NumbersState>(
            builder: (context, state) {
              if (state is NumbersLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is NumbersGenerating) {
                return Center(child: Text(state.number.toString()));
              } else {
                return const Center(child: Text('Something went wrong'));
              }
            },
          ),
          ElevatedButton(
            onPressed: () {
              context.read<NumbersBloc>().add(GenerateNumbers());
            },
            child: const Text('Generate'),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<NumbersBloc>(context).close();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
