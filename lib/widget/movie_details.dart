import 'package:flutter/material.dart';
import 'package:watchme/model/model_movie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tuple/tuple.dart'; // Tuple2 사용을 위한 패키지 import

class MovieDetails extends StatelessWidget {
  final Movie movie;

  const MovieDetails({required this.movie});

  // 링크를 여는 함수
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // 특정 OTT 제공자가 포함되어 있는지 확인하는 함수
  bool isSupportedProvider(String provider) {
    const supportedProviders = [
      '넷플릭스',
      '왓챠',
      '쿠팡플레이',
      '웨이브',
      '티빙',
    ];
    return supportedProviders.contains(provider);
  }

  // OTT 제공자에 맞는 이미지 경로를 리턴하는 함수
  String getProviderIcon(String providerName) {
    switch (providerName) {
      case '넷플릭스':
        return 'assets/icons/netflix_on.png';
      case '티빙':
        return 'assets/icons/tiving_on.png';
      case '쿠팡플레이':
        return 'assets/icons/coupang_on.png';
      case '왓챠':
        return 'assets/icons/watcha_on.png';
      case '웨이브':
        return 'assets/icons/wave_on.png';
      default:
        return 'assets/icons/default.png'; // 기본 아이콘
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 영화 설명 카드
          _buildInfoCard('장르', movie.genre.join(', ')), // 리스트를 콤마로 구분된 문자열로 변환
          _buildInfoCard('연령 등급', movie.ageRating),
          _buildInfoCard('국가', movie.country.join(', ')), // 리스트를 콤마로 구분된 문자열로 변환
          _buildInfoCard('상영 시간', '${movie.runningTime}분'),
          _buildInfoCard('개봉 연도', movie.year),
          _buildInfoCard('주요 배우', movie.actor.join(', ')), // 리스트를 콤마로 구분된 문자열로 변환
          _buildInfoCard('감독', movie.staff.join(', ')), // 리스트를 콤마로 구분된 문자열로 변환

          // "보러 가기" 섹션
          SizedBox(height: 20),
          Text(
            '보러 가기:',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white70,
            ),
          ),
          SizedBox(height: 10),

          // OTT 제공자 링크 아이콘들
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // movie.ottProvider가 List<Tuple2> 형식이라면
              for (var provider in movie.ottProvider)
                if (isSupportedProvider(provider.item1))
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      onTap: () => _launchURL(provider.item2), // provider.item2에 URL이 들어있다고 가정
                      child: CircleAvatar(
                        backgroundColor: Colors.white24,
                        radius: 25,
                        child: Image.asset(
                          getProviderIcon(provider.item1), // 아이콘 경로를 함수로 가져옴
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ],
      ),
    );
  }

  // 정보를 담을 카드 위젯
  Widget _buildInfoCard(String title, String content) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.white70,
            ),
          ),
          Text(
            content,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
