import 'dart:convert';
import 'package:news_app/data/bean/comon_movie_req.dart';
import 'package:news_app/data/bean/now_playing_respo.dart';
import 'package:news_app/utils/apiutils/api_base_helper.dart';
import 'package:news_app/utils/apiutils/api_response.dart';

class MovieRepository {
  fetchNowPlaying({String endPoint, int page}) async {
    try {
      var commonReq = CommonMovieReq.page(page.toString()).toJson();
      final response = await apiHelper.getWithParam("${endPoint}", commonReq);
      return ApiResponse.returnResponse(
          response, NowPlayingRespo.fromJson(jsonDecode(response.toString())));
    } catch (error, stacktrace) {
      return ApiResponse.error(
          errCode: ApiRespoCode.known,
          errMsg: error.toString(),
          errBdy: stacktrace.toString(),
          data: null);
    }
  }
}
