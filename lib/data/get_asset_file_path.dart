import 'package:kelvinapp/config/star_type_enum.dart';

class GetAssetFilePath{

  String getStarImagePath(StarTypeEnum currentStar){
    switch(currentStar){
      case StarTypeEnum.BLUE_STAR:{
        return "assets/images/blue_star.png";
      }

      case StarTypeEnum.ORANGE_STAR:{
        return "assets/images/orange_star.png";
      }

      case StarTypeEnum.YELLOW_STAR:{
        return "assets/images/sun.png";
      }
    }
  }
}