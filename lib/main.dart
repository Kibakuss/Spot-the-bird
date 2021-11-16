import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spot_the_bird/bloc/location_cubit.dart';
import 'package:spot_the_bird/screens/map_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LocationCubit>(create: (context) => LocationCubit()..getLocation(),
      child: MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            //appBar Color
            primaryColor: const Color(0xFF334257),
            colorScheme: const ColorScheme.light().copyWith(
    //TextFiekdColor
              primary: const Color(0xFF548CAB),
              secondary: const Color(0xFF96BAFF),
            )),
            home: const MapScreen(),
      ),
    );
  }
}
