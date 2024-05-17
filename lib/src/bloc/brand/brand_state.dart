part of 'brand_bloc.dart';

class BrandState extends Equatable {
  final String name;
  final String logo;

  const BrandState({required this.name, required this.logo});

  // Zero-argument constructor
  const BrandState.initial()
      : name = '', // Provide default values or initialize with empty strings
        logo = ''; // Provide default values or initialize with empty strings

  BrandState copyWith({String? name, String? logo}) {
    return BrandState(name: name ?? this.name, logo: logo ?? this.logo);
  }

  @override
  List<Object> get props => [name, logo];
}

class BrandLoadSuccess extends BrandState {
  final List<Brand> brands;

  const BrandLoadSuccess({required this.brands}) : super.initial();
}

class BrandLoadFailure extends BrandState {
  final String error;

  const BrandLoadFailure({required this.error}) : super.initial();
}
