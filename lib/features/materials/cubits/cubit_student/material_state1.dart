abstract class MaterialState1 {}

class MaterialInitial extends MaterialState1 {}

class MaterialLoading extends MaterialState1 {}

class MaterialError extends MaterialState1 {
  final String message;
  MaterialError(this.message);
}

class MaterialSuccess extends MaterialState1 {
  final String message;
  MaterialSuccess(this.message);
}