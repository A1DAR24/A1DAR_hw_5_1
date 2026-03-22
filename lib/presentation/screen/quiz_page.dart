import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_5_1/app/di/inject_model.dart';
import 'package:lesson_5_1/presentation/cubit/quiz/quiz_cubit.dart';

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final QuizCubit cubit = getIt<QuizCubit>();

  @override
  void initState() { 
    super.initState();
    cubit.loadQuiz(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rick & Morty Quiz")),
      body: BlocProvider.value(
        value: cubit,
        child: BlocBuilder<QuizCubit, QuizState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is SuccessState) {
              final q = state.question;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Вопрос ${state.currentIndex + 1} из ${state.totalQuestions}",
                      style: const TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      q.question,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    
                    ...q.allAnswers.map((answer) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: () => cubit.answerQuestion(),
                        child: Text(answer, textAlign: TextAlign.center),
                      ),
                    )).toList(),
                  ],
                ),
              );
            }

            if (state is QuizFinishedState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Тест пройден!", style: TextStyle(fontSize: 24)),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => cubit.loadQuiz(),
                      child: const Text("Попробовать снова"),
                    ),
                  ],
                ),
              );
            }

            if (state is ErrorState) {
              return Center(child: Text("Ошибка: ${state.error}"));
            }

            return Center(
              child: ElevatedButton(
                onPressed: () => cubit.loadQuiz(),
                child: const Text("Начать квиз"),
              ),
            );
          },
        ),
      ),
    );
  }
}