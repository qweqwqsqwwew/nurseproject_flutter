import 'package:nurseproject_flutter/utils/log_util.dart';
import 'package:nurseproject_flutter/pages/AppHomePage/Home/home_request/home_model.dart';
import 'package:nurseproject_flutter/services/api.dart';

class HomeBannerRequest {
  /*
  static Future<List<MovieItem>> requestMovieList(int start) async {
    final movieUrl = 'https://douban-api.uieee.com/v2/movie/top250?start=$start&count=${DoubanConfig.MOVIE_COUNT}';

    final response = await HttpRequest.request(movieUrl);
    final subjects = response['subjects'];

    List<MovieItem> movies = [];
    for(var sub in subjects){
      movies.add(MovieItem.fromMap(sub));
    }
    return movies;
  }
  */

  static Future<List<BannerItem>> requestHomeBannerAds() async {
    Map resData = await getHomeBannerData();
    LogUtil.d(resData);
    final subjects = resData['data'];
     List<BannerItem> imageData = [];
     for (var sub in subjects){
       imageData.add(BannerItem.fromMap(sub));
     }
      return imageData;
  }
}