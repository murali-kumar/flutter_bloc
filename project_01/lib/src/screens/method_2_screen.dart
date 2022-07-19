import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_01/src/blocs/method2/method2_bloc.dart';
import 'package:project_01/src/utils/helper.dart';

class Method2Screen extends StatelessWidget {
  const Method2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Data from Bloc object')),
      body: BlocBuilder<Method2Bloc, Method2State>(
        builder: (context, state) {
          if (state is Method2InitialState) {
            context.read<Method2Bloc>().add(Method2LoadEvent());
            return const SizedBox.shrink();
          }
          if (state is Method2LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is Method2ErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          if (state is Method2LoadedState) {
            return Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(state.dataList.toString()),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<Method2Bloc>().add(Method2AddEvent(
                            addValue: Helper.generateRandomNumber()));
                      },
                      child: const Text('add random Number')),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<Method2Bloc>().add(Method2RemoveEvent());
                      },
                      child: const Text('Remove All Data')),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
