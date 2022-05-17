import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_flutter/data/numbers_datasource.dart';
import 'package:stream_flutter/presentation/bloc/numbers_bloc.dart';
import 'package:stream_flutter/presentation/numbers_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Welcome To Number generator'),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider<NumbersBloc>(
                      create: (context) => NumbersBloc(NumbersDatasource()),
                      child: const NumbersPage(),
                    ),
                  ),
                );
              },
              child: const Text("Let's go"))
        ],
      ),
    ));
  }
}
