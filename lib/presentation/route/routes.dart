import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/views/about/about_view.dart';
import 'package:yelwinoo/presentation/views/certificates/certificates_view.dart';
import 'package:yelwinoo/presentation/views/home/home_page.dart';
import 'package:yelwinoo/presentation/views/projects/projects_view.dart';

class RouteGen {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return _buildRoute(const HomePage(),settings: settings);
      case Routes.projects:
        return _buildRoute(const ProjectsView(),settings: settings);
      case Routes.certificates:
        return _buildRoute(const CertificatesView(),settings: settings);
      case Routes.about:
        return _buildRoute(const AboutView(),settings: settings);
      default:
        return _buildRoute(const ErrorView(),settings: settings);
    }
  }

  static MaterialPageRoute _buildRoute(Widget child, {RouteSettings? settings}) {
    return MaterialPageRoute(
      builder: (BuildContext context) => child,
      settings: settings,
    );
  }
}

class Routes {
  static const home = "/";
  static const certificates = "/certificates";
  static const projects = "/projects";
  static const projectDetails = "/project_details";
  static const about = "/about";
  static const contact = "/contact_me";
}


class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Error Page'),
      ),
      body: Center(
        child: Text("404 - Page Not Found!",style: context.titleLarge,),
      ),
    );
  }
}
