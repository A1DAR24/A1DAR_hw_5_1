import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_5_1/presentation/cubit/rick/rick_cubit.dart';
import 'package:lesson_5_1/app/di/inject_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cubit = getIt<RickCubit>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    cubit.getCharacters();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      cubit.getNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE0EAFC), Color(0xFFCFDEF3)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          SafeArea(
            child: BlocBuilder<RickCubit, RickState>(
              bloc: cubit,
              builder: (context, state) {
                
                if (state is LoadingState && cubit.allCharacters.isEmpty) {
                  return const Center(child: CircularProgressIndicator(color: Colors.blueGrey));
                }

                if (state is SuccesState || cubit.allCharacters.isNotEmpty) {
                  final list = cubit.allCharacters;
                  final hasNext = (state is SuccesState) ? state.hasNext : false;

                  return Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "CHARACTERS",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w200, letterSpacing: 8),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          itemCount: hasNext ? list.length + 1 : list.length,
                          itemBuilder: (context, index) {
                            if (index == list.length) {
                              return const SizedBox(
                                height: 80,
                                child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                              );
                            }

                            final character = list[index];
                            return _buildGlassCard(character);
                          },
                        ),
                      ),
                    ],
                  );
                }

                if (state is ErrorState) {
                  return Center(child: Text(state.error));
                }

                return const SizedBox();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlassCard(dynamic character) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.5)),
            ),
            child: Row(
              children: [
                Image.network(
                  character.image,
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        character.name,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Text("Rick & Morty Series", style: TextStyle(color: Colors.black54)),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.black26),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}