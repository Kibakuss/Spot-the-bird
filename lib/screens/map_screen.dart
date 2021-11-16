import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:spot_the_bird/bloc/location_cubit.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationCubit,LocationState>(
        builder : (context,state){
      if (state is LocationLoaded){
        return  FlutterMap(
          options: MapOptions(
              center: LatLng(state.latitude, state.longitude), zoom: 15.7, maxZoom: 17, minZoom: 3.5),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
              retinaMode: true,
            )
          ],
        
      
    );
  }
  if(state is LocationError){
    return Center(child:MaterialButton(child:const Text("Try again"),onPressed: (){
      context.read<LocationCubit>().getLocation();
    } ,) );
  }
  return const Center(child: CircularProgressIndicator());
        }
      ),
      );
  }}