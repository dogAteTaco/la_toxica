import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toxica_2/presentation/views/chat/chat_view.dart';
import 'package:toxica_2/providers/theme_provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = context.watch<ThemeProvider>();
    return Scaffold(
        appBar: ContactBar(themeProvider),
        body: const ChatView());
  }

  AppBar ContactBar(ThemeProvider themeProvider) {
    return AppBar(
        title: const Text('La Tóxica'),
        centerTitle: false,
        leading: const Padding(
          padding: EdgeInsets.all(5.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://helios-i.mashable.com/imagery/articles/06NwyMPotETRux7TrR6H74Q/hero-image.fill.size_1200x1200.v1614270598.jpg'),
          ),
        ),
        actions: ChangeTheme(themeProvider),
      );
  }

  List<Widget> ChangeTheme(ThemeProvider themeProvider) {
    return [
        IconButton(
          icon: Icon(themeProvider.appTheme.brightness == Brightness.dark
              ? Icons.dark_mode
              : Icons.sunny),
          onPressed: () {
            (themeProvider.appTheme.brightness == Brightness.dark)
                ? themeProvider.setBrightness(Brightness.light)
                : themeProvider.setBrightness(Brightness.dark);
          },
        ),
      ];
  }

}
