import 'package:flutter/material.dart';
import 'package:flutter101/src/bloc/brand/brand_bloc.dart';
import 'package:flutter101/src/services/data_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BrandBloc brandBloc;
  @override
  Widget build(BuildContext context) {
    brandBloc = BlocProvider.of<BrandBloc>(context); // เพื่อเข้าถึง instance
    brandBloc.add(
      FecthBrand(),
    ); //เรียกใช้เหตุการณ์ FetchDataEvent() บน apiBloc เพื่อดึงข้อมูลจากแหล่งข้อมูล.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brand'),
        backgroundColor: Colors.black87,
      ),
      body: Center(child: BlocBuilder<BrandBloc, BrandState>(
        builder: (context, state) {
          return Container(
            child: Text('hola'),
          );
        },
      )),
    );
  }
}
