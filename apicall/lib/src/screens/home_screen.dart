import 'package:apicall/src/bloc/photo/photo_bloc.dart';
import 'package:apicall/src/model/photo_info.dart';
import 'package:apicall/src/widgets/photo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Api calling')),
      body: BlocBuilder<PhotoBloc, PhotoState>(
        builder: (context, state) {
          if (state is PhotoInitialState) {
            context.read<PhotoBloc>().add(PhotoLoadEvent());
            return const SizedBox.shrink();
          }
          if (state is PhotoLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PhotoErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          if (state is PhotoLoadedState) {
            List<PhotoInfo> dataList = state.dataList;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return PhotoItem(
                      photoInfo: dataList[index],
                    );
                  }),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
  //
}
