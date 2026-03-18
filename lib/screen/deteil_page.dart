import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_5_1/cubit/rick_cubit.dart';
import 'package:lesson_5_1/app/di/inject_model.dart';

class DeteilPage extends StatefulWidget {
  final int id;
  final String name;
  final String image;

  const DeteilPage({
    super.key,
    required this.id,
    required this.name,
    required this.image,
  });

  @override
  State<DeteilPage> createState() => _DeteilPageState();
}

class _DeteilPageState extends State<DeteilPage> {
  late RickCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = getIt<RickCubit>()..getCharacterDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
      ),
      body: BlocBuilder<RickCubit, RickState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is SuccesDeteilState) {
            final item = state.rickResults;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.network(
                        widget.image,
                        width: double.infinity,
                        height: 400,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        height: 100,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          item.name, 
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  
}