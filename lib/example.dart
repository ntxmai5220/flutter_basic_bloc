import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/example_bloc.dart';

class Example extends StatelessWidget {
  const Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      const Text(
        'Home',
        style: TextStyle(fontSize: 30),
      ),
      const Text(
        'Favorite',
        style: TextStyle(fontSize: 30),
      ),
    ];

    return Scaffold(
      body: BlocBuilder<ExampleBloc, int>(
        builder: (context, state) {
          return Center(child: widgets[state]);
          // } else if (state is Loading) {
          //   return const Center(child: CircularProgressIndicator());
          // } else if (state is Error) {
          //   return const Center(
          //       child: Text('Error',
          //           style: TextStyle(fontSize: 30, color: Colors.red)));
        },
      ),
      bottomNavigationBar: BlocBuilder<ExampleBloc, int>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state,
            onTap: (int index) {
              BlocProvider.of<ExampleBloc>(context).add(OnChangeTab(index));
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                  backgroundColor: Colors.green),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favorite',
                  backgroundColor: Colors.red),
            ],
          );
        },
      ),
    );
  }
}
