// bath assets (svgs and pngs) path

const String baseSvgPath = 'assets/svgs/';
const String basePngPath = 'assets/pngs/';

//?
final String drawerIcon = 'drawerIcon'.svg;
final String globeIcon = 'globeIcon'.svg;
final String userIcon = 'userIcon'.svg;
final String topLogoLight = 'topLogoLight'.svg;
final String topLogoDark = 'topLogoDark'.svg;
final String btcUsdtIcon = 'btc-usdt-icon'.svg;


// extensions
extension ImageExtension on String {
  // png paths
  String get png => '$basePngPath$this.png';
  // svgs path
  String get svg => '$baseSvgPath$this.svg';
}
