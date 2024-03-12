import 'package:homework/utils/app_images.dart';

class BalanceModels {
  final String icon;
  final String title;
  final String subtitle;

  BalanceModels(
      {required this.icon, required this.title, required this.subtitle});
}

List<BalanceModels> balanceDatabase = [
  BalanceModels(
    icon: AppImages.eur,
    title: "585.00",
    subtitle: "EUR Balance",
  ),
  BalanceModels(
    icon: AppImages.eur,
    title: "585.00",
    subtitle: "GPB Balance",
  ),
  BalanceModels(
    icon: AppImages.eur,
    title: "585.00",
    subtitle: "EUR Balance",
  ),
  BalanceModels(
    icon: AppImages.eur,
    title: "585.00",
    subtitle: "GPB Balance",
  ),
  BalanceModels(
    icon: AppImages.eur,
    title: "585.00",
    subtitle: "EUR Balance",
  ),
  BalanceModels(
    icon: AppImages.eur,
    title: "585.00",
    subtitle: "GPB Balance",
  ),
];
