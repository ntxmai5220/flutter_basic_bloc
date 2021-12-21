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
      body: BlocBuilder<ExampleBloc, ExampleState>(
        builder: (context, state) {
          if (state is ExampleInitial) {
            return Center(child: widgets[state.index]);
            // } else if (state is Loading) {
            //   return const Center(child: CircularProgressIndicator());
            // } else if (state is Error) {
            //   return const Center(
            //       child: Text('Error',
            //           style: TextStyle(fontSize: 30, color: Colors.red)));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: BlocBuilder<ExampleBloc, ExampleState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: (state as ExampleInitial).index,
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
