import 'dart:async';
import 'package:besoul/product/best_page.dart';
import 'package:besoul/product/best_sell_page.dart';
import 'package:besoul/product/favorites_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'images.dart';
import 'introduce_model.dart';
import 'model/best_model.dart';
import 'model/best_sell_model.dart';
import 'model/category_model.dart';
import 'model/favorite_model.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFFF6F6F6)),
      home: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).popUntil((route) => route.isFirst);
          SystemNavigator.pop();
          return false;
        },
        child: const Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: _IntroduceWidget(),
            ),
          ),
        ),
      ),
    );
  }
}

class _IntroduceWidget extends StatefulWidget {
  const _IntroduceWidget({Key? key}) : super(key: key);

  @override
  State<_IntroduceWidget> createState() => _IntroduceWidgetState();
}

class _IntroduceWidgetState extends State<_IntroduceWidget> {
  List<IntroduceModel> intro = [
    IntroduceModel(image: 'assets/img1.png', status: '화장품을 제공하는 전자 상거래'),
    IntroduceModel(
        image: 'assets/2.png',
        status: '화장품을 제공하는 전자 상거래',
        introduce: '빠른 - 보장 - 명성'),
    IntroduceModel(
        image: 'assets/2.jpg',
        status: '화장품을 제공하는 전자 상거래 ',
        introduce: '빠른 - 보장 - 명성'),
    IntroduceModel(image: 'assets/1.jpg', status: ' 화장품을 제공하는 전자 상거래'),
  ];
  int selectedindex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;
  bool _isUserScrolling = false;
  List<Content> type = [];

  final dio = Dio();

  Future<CategoryModel> getCategoryModel() async {
    Response r = await dio.get(
        'https://mobile.gongu365.vn/v6/api/public/category/search?page=0&size=6&sort=insertDateTime%2CDESC');
    return CategoryModel.fromJson(r.data);
  }

  List<Information> best = [];
  Future<BestModel> getBest() async {
    Response r = await dio.get('https://mobile.gongu365.vn/v6/api/public/product/best?page=0&size=25');
    return BestModel.fromJson(r.data);
  }
  List<Favorite> favorite = [];
Future<FavoriteModel> getFavorite() async {
    Response r = await dio.get('https://mobile.gongu365.vn/v6/api/public/product/favorites?numberNews=5&page=0&size=20&sort=LIKE_NUMBER%2CDESC');
    return FavoriteModel.fromJson(r.data);
}
  List<Sell> bestsell = [];

  Future<BestSellModel> getBestSellModel() async {
    Response r = await dio.get(
        'https://mobile.gongu365.vn/v6/api/public/product/best-sell?numberNews=5&page=0&size=10&sort=buyCount%2CDESC');
    return BestSellModel.fromJson(r.data);
  }



  fetchData() async {
    CategoryModel data = await getCategoryModel();
    BestModel data1 =await getBest();
    BestSellModel data2 = await getBestSellModel();
   FavoriteModel data3 =await getFavorite();
    setState(() {
      type = data.content ?? [];
      best = data1.information?? [];
      bestsell = data2.productsPage?.sell ?? [];
      favorite = data3.productsPage?.favorite ?? [];

    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    _pageController.addListener(_handlePageScroll);
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!_isUserScrolling) {
        int nextPage = selectedindex + 1;
        if (nextPage >= intro.length) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.removeListener(_handlePageScroll);
    _pageController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _handlePageScroll() {
    if (_pageController.page == _pageController.page?.round()) {
      setState(() {
        selectedindex = _pageController.page?.round() ?? 0;
      });
    }
  }

  Row buildRatingStars(int rating) {
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      if (i < rating) {
        stars.add(const Icon(
          Icons.star,
          color: Color(0xFFFF8159),
          size: 10,
        ));
      } else {
        stars.add(const Icon(
          Icons.star,
          color: Colors.grey,
          size: 10,
        ));
      }
    }
    return Row(children: stars);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 445,
          width: 448.84,
          child: NotificationListener<ScrollStartNotification>(
            onNotification: (_) {
              setState(() {
                _isUserScrolling = true;
              });
              return false;
            },
            child: NotificationListener<ScrollEndNotification>(
              onNotification: (_) {
                setState(() {
                  _isUserScrolling = false;
                });
                return false;
              },
              child: PageView.builder(
                controller: _pageController,
                itemCount: intro.length,
                itemBuilder: (ctx, idx) {
                  var x = intro[idx];
                  return Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          x.image,
                          fit: BoxFit.fitHeight,
                          height: 300,
                        ),
                      ),
                      Positioned.fill(
                        child: Opacity(
                          opacity: 1,
                          child: Container(
                            color: const Color(0xff5a798366),
                          ),
                        ),
                      ),
                      Positioned(top: 10, right: 10, left: 10, child: appbar()),
                      SizedBox(
                        width: 450,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              x.status,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              x.introduce ?? " ",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          top: 418,
                          left: 325,
                          child: Container(
                              width: 24,
                              height: 16,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF8E9A9F),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4))),
                              child: Center(
                                  child: Text(
                                '${(idx + 1)}/${intro.length}',
                                style: const TextStyle(color: Colors.white),
                              )))),
                      Positioned(
                        top: 426,
                        left: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            intro.length,
                            (index) => Container(
                              width: 24,
                              height: selectedindex == index ? 3 : 1,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4)),
                                color: selectedindex == index
                                    ? Colors.white
                                    : Colors.white38,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        typeWidget(),
        const SizedBox(
          height: 10,
        ),
      favoriteWidget(),
        const SizedBox(
          height: 10,
        ),
       bestWidget(),
        const SizedBox(
          height: 10,
        ),
        bestSellProductWidget()
      ],
    );

    //   typeWidget(),
  }

  Widget appbar() {
    return Padding(
          padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Tất cả ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    "Best ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFE7E7E7),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "Best review ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFE7E7E7),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    "Event ",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFE7E7E7),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SvgPicture.asset('assets/w_search.svg'),
                  SvgPicture.asset('assets/goods.svg'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 358,
                height: 1,
                color: Colors.white,
              ),
            ],
          ),
        );}

  Widget typeWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: Container(
        height: 130,
        color: const Color(0xFFE0E0E0),
        margin: const EdgeInsets.only(left: 0, right: 0),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ListView.separated(
                separatorBuilder: (ctx, idx) {
                  return Container(
                    width: 18,
                  );
                },
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: type.length,
                itemBuilder: (ctx, idx) {
                  var y = type[idx];
                  String imageUrl = '';
                  if (y.categoryParentSlideImages?.isNotEmpty ?? false) {
                    imageUrl = y.categoryParentSlideImages!.first;
                  } else if (y.categoryImage?.isNotEmpty ?? false) {
                    imageUrl = y.categoryImage!;
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            border: Border.all(color: Colors.white, width: 4)),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          child: Image.network(
                            imageUrl,
                            height: 70,
                            width: 70,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${y.categoryName}',
                        style: const TextStyle(
                            color: Color(0xFF595D5F),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }


Widget bestWidget(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Sản Phẩm Dành Cho Bạn ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF4AA98B),
                            fontWeight: FontWeight.w600),
                      ),
                      InkResponse(
                          onTap: () {
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => const BestPage(),
                                ),
                              );
                            }
                          },
                          child: SvgPicture.asset(chuyen)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.6,
                  children: List.generate(best.length, (idx) {
                    var y = best[idx];
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 160,
                              height: 190,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                child: Image.network(
                                  y.productImage ?? '',
                                  fit: BoxFit.cover,
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 105,
                                child: Row(
                                  children: [
                                    buildRatingStars(y.averageStar?.toInt() ?? 0),
                                    Text(
                                      ' (${y.likeNumber})',
                                      style: const TextStyle(
                                          fontSize: 10, color: Color(0xFF949494)),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                '${y.commentCount} nhận xét',
                                style: const TextStyle(
                                    fontSize: 10, color: Color(0xFF949494)),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 140,
                            child: Text(
                              y.productName ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2E2E2E)),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            width: 160,
                            child: SizedBox(
                              width: 95,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${y.price} đ',
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF2E2E2E),
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    '${y.buyCount} đã bán',
                                    style: const TextStyle(
                                        fontSize: 10, color: Color(0xFF8D8D8D)),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    );
                  }),
                ),
              ],
            ),
            if (best.length > 20)
              Container(
                width: 339,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(1)),
                  border: Border.all(
                    color: const Color(0xFFE8E8E8),
                    width: 1,
                  ),
                ),
                child:  Center(
                  child: InkResponse(
                    onTap: () {
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const FavoritePage(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Xem thêm",
                      style: TextStyle(
                        color: Color(0xFF6F6F6F),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}
Widget favoriteWidget(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Sản Phẩm Được Yêu Thích ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF4AA98B),
                            fontWeight: FontWeight.w600),
                      ),
                      InkResponse(
                          onTap: () {
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (ctx) => const FavoritePage(),
                                ),
                              );
                            }
                          },
                          child: SvgPicture.asset(chuyen)),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.6,
                  children: List.generate(favorite.length, (idx) {
                    var y = favorite[idx];
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 160,
                              height: 190,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                child: Image.network(
                                  y.productImage ?? '',
                                  fit: BoxFit.cover,
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 105,
                                child: Row(
                                  children: [
                                    buildRatingStars(y.averageStar?.toInt() ?? 0),
                                    Text(
                                      ' (${y.likeNumber})',
                                      style: const TextStyle(
                                          fontSize: 10, color: Color(0xFF949494)),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                '${y.commentCount} nhận xét',
                                style: const TextStyle(
                                    fontSize: 10, color: Color(0xFF949494)),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 140,
                            child: Text(
                              y.productName ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2E2E2E)),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            width: 160,
                            child: SizedBox(
                              width: 95,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${y.price} đ',
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF2E2E2E),
                                        fontWeight: FontWeight.w800),
                                  ),
                                  Text(
                                    '${y.buyCount} đã bán',
                                    style: const TextStyle(
                                        fontSize: 10, color: Color(0xFF8D8D8D)),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],

                      ),
                    );
                  }),
                ),
              ],
            ),
            if (favorite.length > 20)
              Container(
                width: 339,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(1)),
                  border: Border.all(
                    color: const Color(0xFFE8E8E8),
                    width: 1,
                  ),
                ),
                child:  Center(
                  child: InkResponse(
                    onTap: () {
                      {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => const FavoritePage(),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Xem thêm",
                      style: TextStyle(
                        color: Color(0xFF6F6F6F),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    ),
  );
}

  Widget bestSellProductWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Sản Phẩm Bán Chạy Nhất ",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF4AA98B),
                              fontWeight: FontWeight.w600),
                        ),
                        InkResponse(
                            onTap: () {
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) => const BestSellPage(),
                                  ),
                                );
                              }
                            },
                            child: SvgPicture.asset(chuyen)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.6,
                    children: List.generate(bestsell.length, (idx) {
                      var y = bestsell[idx];
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 160,
                                height: 190,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(3),
                                  child: Image.network(
                                    y.productImage ?? '',
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 105,
                                  child: Row(
                                    children: [
                                      buildRatingStars(y.averageStar?.toInt() ?? 0),
                                      Text(
                                        ' (${y.likeNumber})',
                                        style: const TextStyle(
                                            fontSize: 10, color: Color(0xFF949494)),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '${y.commentCount} nhận xét',
                                  style: const TextStyle(
                                      fontSize: 10, color: Color(0xFF949494)),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 140,
                              child: Text(
                                y.productName ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF2E2E2E)),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              width: 160,
                              child: SizedBox(
                                width: 95,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${y.price} đ',
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFF2E2E2E),
                                          fontWeight: FontWeight.w800),
                                    ),
                                    Text(
                                      '${y.buyCount} đã bán',
                                      style: const TextStyle(
                                          fontSize: 10, color: Color(0xFF8D8D8D)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
              if (bestsell.length > 20)
                Container(
                  width: 339,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(1)),
                    border: Border.all(
                      color: const Color(0xFFE8E8E8),
                      width: 1,
                    ),
                  ),
                  child:  Center(
                    child: InkResponse(
                      onTap: () {
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => const BestSellPage(),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "Xem thêm",
                        style: TextStyle(
                          color: Color(0xFF6F6F6F),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

