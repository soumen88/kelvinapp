import 'package:kelvinapp/config/star_type_enum.dart';

class GetAssetFilePath{

  String getStarImagePath(StarTypeEnum currentStar){
    switch(currentStar){
      case StarTypeEnum.BLACK_STAR:{
        return "assets/images/black_star.png";
      }

      case StarTypeEnum.WHITE_STAR:{
        return "assets/images/white_star.png";
      }

      case StarTypeEnum.YELLOW_STAR:{
        return "assets/images/yellow_star.png";
      }
    }
  }
}