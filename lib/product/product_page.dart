import 'dart:async';
import 'package:besoul/product/product_detail.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../images.dart';
import '../model/category_id_model.dart';
import '../model/product_model.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.result}) : super(key: key);
final int? result;
  @override
  State<ProductPage> createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  final dio = Dio();
  ProductIdModel product = ProductIdModel();
  List<String> productImages = [];
  List<Content> category = [];
  Future<ProductIdModel> getProductIdModel() async {
    try {
      Response r = await dio.get(
          'https://mobile.gongu365.vn/v6/api/public/product/find-by-id?productId=${widget.result}');
      print(r.data);
      return ProductIdModel.fromJson(r.data);
    } catch (error) {
      print('Lỗi : $error');
      throw error;
    }
  }
  Future<CategoryIdModel> getCategoryIdModel() async {
    try {
      Response r = await dio.get(
          'https://mobile.gongu365.vn/v6/api/public/product/find-by-category-id?categoryId=${product.categoryId}&page=0&size=10&sort=INSERT_DATETIME%2CDESC');
      print(r.data);
      return CategoryIdModel.fromJson(r.data);
    } catch (error) {
      print('Lỗi : $error');
      throw error;
    }
  }
  fetchData() async {
    CategoryIdModel data1 =  await getCategoryIdModel();
    ProductIdModel data =  await getProductIdModel();
    setState(() {
      product = data;
      productImages = List<String>.from(data.productImages ?? []);
      category = data1.content ?? [];
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
        if (nextPage >= productImages.length) {
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

  int selectedindex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  Timer? _timer;
  bool _isUserScrolling = false;

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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _appbarWidget(),
                const SizedBox(height: 10,),
                _productduceWidget(),
                const SizedBox(height: 10,),
                  _informationWidget(),
                const SizedBox(height: 10,),
                  _timeWidget(),
                const SizedBox(height: 10,),
               _brand(),
                const SizedBox(height: 10,),
                _reviewWidget(),
                const SizedBox(height: 10,),
                  _categoryIdWidget(),
                const SizedBox(height: 10,),
                 _bottomWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _appbarWidget(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkResponse(
              onTap: () {
                Navigator.pop(context);
              },
              child: SvgPicture.asset('assets/back.svg')),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/d_search.svg'),
              const SizedBox(width: 20,),
              SvgPicture.asset('assets/d_goods.svg'),
            ],
          ),
        ],
      ),
    );
  }
  Widget _productduceWidget() {
    return SizedBox(
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
                  itemCount: productImages.length,
                  itemBuilder: (ctx, idx) {
                    var x = productImages[idx];
                    return Stack(children: [
                      Positioned.fill(
                        child: Image.network(
                          x,
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
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        " ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      ),
                      Positioned(
                        top: 426,
                        left: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                            productImages.length,
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
                    ]);
                  }),
            )));
  }

  Widget _informationWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              Text(product.productName ?? '',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2E2E2E)),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 105,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildRatingStars(product.averageStar?.toInt() ?? 0),
                  Text(
                    ' (${product.likeNumber})',
                    style: const TextStyle(
                        fontSize: 10, color: Color(0xFF949494)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${product.buyCount} ',
                    style: const TextStyle(fontSize: 10, color: Color(0xFF949494)),
                  ),
                  const TextSpan(
                    text: 'đã bán',
                    style: TextStyle(fontSize: 10, color: Color(0xFF949494)),
                  ),

                ],
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text: 'Còn ',
                    style: TextStyle(fontSize: 10, color: Color(0xFF949494)),
                  ),
                  TextSpan(
                    text: '${product.buyCount} ',
                    style: const TextStyle(fontSize: 10, color: Color(0xFF949494)),
                  ),
                  const TextSpan(
                    text: 'sản phẩm',
                    style: TextStyle(fontSize: 10, color: Color(0xFF949494)),
                  ),

                ],
              ),
            ),

          ],
        ),
        Text(
          '${product.price} đ',
          style: const TextStyle(
              fontSize: 10,
              color: Color(0xFF2E2E2E),
              fontWeight: FontWeight.w800),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _SizeWidget(size: 'S'),
            _SizeWidget(size: 'M'),
            _SizeWidget(size: 'L'),
            _SizeWidget(size: 'XL'),
            _SizeWidget(size: 'XXL'),
          ],
        )
      ],
    );
  }
  Widget _timeWidget(){
    return Container(
      decoration: const BoxDecoration(
        border: Border(
            bottom: BorderSide(
            color: Colors.black12,
            width: 0.5
        )
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/clock.svg'),
                    const Text('Thời gian giao hàng',style: TextStyle(color: Color(0xFF595D5F),fontWeight: FontWeight.w500,fontSize: 13),),
                    SvgPicture.asset('assets/chevron-down.svg')
                  ],
                ),
                SizedBox(height: 10,),
                const Text("Dự kiến thời gian giao hàng thực tế có thể khác nhau tùy thuộc vào hoàn"
                    " cảnh của công ty chuyển phát nhanh. Cám ơn quý khách hàng ",style: TextStyle(color: Color(0xFF595D5F),fontWeight: FontWeight.w400,fontSize: 13)),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/like.svg'),
                const Text('100% sản phẩm chính hãng',style: TextStyle(color: Color(0xFF595D5F),fontWeight: FontWeight.w500,fontSize: 13),),
                SvgPicture.asset('assets/chevron-down1.svg'),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _brand(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(20), // Image radius
                child: Image.network(product.brand?.brandAvatar ?? '', width: 5, height: 5),
              ),
            ),
            Container(
                color: Colors.green,
                child: Text(product.brand?.brandName ?? '', style: const TextStyle(color: Color(0xFF595D5F),fontWeight: FontWeight.w500,fontSize: 13),)),
            SvgPicture.asset('assets/Arrow - Left.svg')
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Voucher', style: TextStyle(color: Color(0xFF595D5F),fontWeight: FontWeight.w500,fontSize: 14),),
              Stack(
                children: [
                  SvgPicture.asset('assets/Rectangle 3028.svg'),
                  Positioned(
                    right: 23,
                      top: 8,
                      child: const Text('20K', style: TextStyle(color: Color(0xFF2E2E2E),fontWeight: FontWeight.w500,fontSize: 14),))
                ],
              )
            ],
          ),
        )
      ],
    );
  }
  Widget _reviewWidget(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
              const _InforWidget(name: 'Thông tin sản phẩm',color: Color(0xFF3E3E3E),font: Color(0xFF595D5F),),
              InkResponse(
                  onTap: () {
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const ProductDetailPage(),
                        ),
                      );
                    }
                  },
                  child: const _InforWidget(name: 'Đánh giá (15)',color: Color(0xFFF2F2F2),font: Color(0xFFA5A5A5),)),
              Container(
                  width: 80,
                  child: const _InforWidget(name: 'Review (15)',color: Color(0xFFF2F2F2),font: Color(0xFFA5A5A5),)),
          ],
        ),
        const Text('나를 위한 피부 과학 테라피 아름다운 피부, 피부미가 찾아드립니다. 모레 6/21 화요일 출고 예정',style: TextStyle(color: Color(0xFF595D5F),fontWeight: FontWeight.w400,fontSize: 13),),
        const SizedBox(height: 24,),
        const Text('나를 위한 피부 과학 테라피 아름다운 피부, 피부미가 찾아드립니다. 모레 6/21 화요일 출고 예정',style: TextStyle(color: Color(0xFF595D5F),fontWeight: FontWeight.w400,fontSize: 13))
      ],
    );
  }
  Widget _categoryIdWidget(){
    return Container(
      height: 280,
      color: Colors.white,
      margin: const EdgeInsets.only(left: 0, right: 0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 19),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Sản phẩm liên quan",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF4AA98B),
                        fontWeight: FontWeight.w600),
                  ),
                  SvgPicture.asset(chuyen),
                ],
              ),
              Container(
                width: 400,
                height: 100,
                child: ListView.separated(
                    separatorBuilder: (ctx, idx) {
                      return Container(
                        width: 18,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: category.length,
                    itemBuilder: (ctx, idx) {
                      var y = category[idx];
                      String imageUrl = '';
                      if (y.productImages?.isNotEmpty ?? false) {
                        imageUrl = y.productImages!.first;
                      } else if (y.productImages?.isNotEmpty ?? false) {
                        imageUrl = y.productImage!;
                      }
                     return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 160,
                              height: 190,
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                  child: Image.network(
                                    imageUrl,
                                    fit: BoxFit.cover,
                                  ))),
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
                                style:
                                const TextStyle(fontSize: 10, color: Color(0xFF949494)),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 140,
                            child: Text(
                              y.productName ?? '',
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2E2E2E)),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            width: 160,
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
                                  style:
                                  const TextStyle(fontSize: 10, color: Color(0xFF8D8D8D)),
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _bottomWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SvgPicture.asset('assets/heart.svg'),
            Text('${product.likeNumber}',style: const TextStyle(color: Color(0xFF818181),fontWeight: FontWeight.w400,fontSize: 13),)
          ],
        ),
        Container(
          width: 283,
          height: 40,
          decoration: const BoxDecoration(
            color: Color(0xFF60D7B2),
            borderRadius: BorderRadius.all(Radius.circular(3)),

          ),
          child: Center(

            child: Text(' Chọn Sản Phẩm',style: const TextStyle(color: Color(0xFFFFFFFF),fontWeight: FontWeight.w500,fontSize: 13), ),
          ),
        )
      ],
    );
  }
}
class _InforWidget extends StatelessWidget {
  const _InforWidget({Key? key,required this.name,required this.color,required this.font}) : super(key: key);
  final String name;
  final Color color;
  final Color font;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name ,style: TextStyle(color: font,fontWeight: FontWeight.w500,fontSize: 14),),
        Container(
            width: 125,
          height: 1,
          color: color,
        )
      ],
    );
  }

}

class _SizeWidget extends StatelessWidget {
  const _SizeWidget({Key? key,required this.size}) : super(key: key);
  final String size;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(3)),
        color: Color(0xFFF5F5F5)
      ),
      child: Center(
        child: Text(size, style:
        const TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.w500) ),
      ),
    );
  }
}
