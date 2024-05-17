import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter101/src/bloc/login/login_bloc.dart';
import 'package:flutter101/src/models/brand.dart';

part 'brand_event.dart';
part 'brand_state.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  BrandBloc() : super(const BrandState(logo: '', name: '')) {
    on<FecthBrand>((event, emit) {
      // Handle FetchBrand event here
    });
  }

  @override
  Stream<BrandState> mapEventToState(BrandEvent event) async* {
    try {
      List<Brand> brands = await getBrands();
      yield (BrandLoadSuccess(brands: brands));
    } catch (e) {
      yield (BrandLoadFailure(error: e.toString()));
    }
  }
}
