part of values;

class Gradients {
  static const Gradient primaryGradient = RadialGradient(
    center: Alignment.centerRight,
//    focalRadius: 1.0,
    radius: 1.0,
    colors: [
//      Color(0xFF1B2934),
//      Color(0xFF0A1720),
      AppColors.secondaryColor,
      AppColors.primaryColor,
    ],
  );
}
