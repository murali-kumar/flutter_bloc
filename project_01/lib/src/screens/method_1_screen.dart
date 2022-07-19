import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_01/src/blocs/appdata/app_data_bloc.dart';
import 'package:project_01/src/utils/helper.dart';

class Method1Screen extends StatelessWidget {
  const Method1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bloc Data from states')),
      body: BlocBuilder<AppDataBloc, AppDataState>(
        builder: (context, state) {
          if (state is AppDataInitialState) {
            context.read<AppDataBloc>().add(AppDataLoadEvent());
            return const SizedBox.shrink();
          }
          if (state is AppDataLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AppDataErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          if (state is AppDataLoadedState) {
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
                        context.read<AppDataBloc>().add(AppDataAddEvent(
                            addValue: Helper.generateRandomNumber()));
                      },
                      child: const Text('add random Number')),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        context.read<AppDataBloc>().add(AppDataRemoveEvent());
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
