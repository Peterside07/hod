

final kHodLogo = 'logo'.png;
final kHodLogoSvg = 'image'.svg;
final kgoogleLogo = 'google'.png;
final kAppleLogo = 'apple'.png;

const String kNavHome = 'nav_home';
const String kNavHomeActive = 'nav_home_active';
const String kNavDevotional = 'nav_devotional';
const String kNavDevotionalActive = 'nav_devotional_active';





const pngDir = "assets/pngs";
const svgDir = "assets/svgs";


extension AssetExt on String {
  get goPng {
    return "assets/goicons/$this.png";
  }

  String get png {
    return "$pngDir/$this.png";
  }

  String get svg {
    return "$svgDir/$this.svg";
  }


}
