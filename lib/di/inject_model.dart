import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'inject_model.config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_5_1/cubit/rick_cubit.dart';
import 'package:lesson_5_1/model/rick_model.dart';

import 'package:lesson_5_1/model/rick_model.dart';
import 'package:lesson_5_1/repository.dart';

final getIt = GetIt.instance;  
  
@InjectableInit(  
  initializerName: 'init', // default  
  preferRelativeImports: true, // default  
  asExtension: true, // default  
)  
void configureDependencies() => getIt.init();  