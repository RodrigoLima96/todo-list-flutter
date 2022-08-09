import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_list/pages/home/home_page.dart';
import 'package:todo_list/router/app_router.dart';
import 'blocs/bloc_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp(
      appRouter: AppRouter(),
    )),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo List',
        home: const HomePage(),
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
