import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_5_1/cubit/rick_cubit.dart';
import 'package:lesson_5_1/deteil_page.dart';
import 'package:lesson_5_1/di/inject_model.dart';
import 'package:lesson_5_1/model/rick_model.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = getIt<RickCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Легкий фон для контраста с карточками
      appBar: AppBar(
        title: const Text('Rick and Morty characters', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<RickCubit, RickState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is SuccesState) {
            final list = state.rickModel.results;
            return ListView.builder( // Используем builder для более плотного списка
              padding: const EdgeInsets.all(12),
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 4,
                  clipBehavior: Clip.antiAlias, // Чтобы картинка не вылезала за углы
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DeteilPage(
                            id: item.id,
                            name: item.name,
                            image: item.image,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Картинка персонажа
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child: Image.network(
                            item.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // Имя персонажа
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator(color: Colors.green));
        },
      ),
    );
  }
}