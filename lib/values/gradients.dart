part of values;

class Gradients {

  static const Gradient primaryGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [
      0.5,
      1,
    ],
    colors: [
      AppColors.primaryColor,
      AppColors.secondaryColor,
    ],
  );
}
