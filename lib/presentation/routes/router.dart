import 'package:auto_route/auto_route_annotations.dart';
import 'package:portfoliosite/presentation/pages/home_screen.dart';
import 'package:portfoliosite/presentation/pages/root_screen.dart';

@MaterialAutoRouter()
class $Router {

  @initial
  HomeScreen homeScreen;

  RootScreen rootScreen;

}
