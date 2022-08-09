import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_list/pages/home/home_page.dart';
import 'blocs/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo List',
        home: HomePage(),
      ),
    );
  }
}
