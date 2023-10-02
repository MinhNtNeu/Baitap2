
import 'package:besoul/product/product_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

import '../model/best_sell_model.dart';



class BestSellPage extends StatefulWidget {
  const BestSellPage({Key? key}) : super(key: key);

  @override
  State<BestSellPage> createState() => _BestSellPageState();
}

class _BestSellPageState extends State<BestSellPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              _AppBarWidget(),
              SizedBox(height: 10,),
              _BestSellWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBarWidget extends StatelessWidget {
  const _AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: Colors.black12,
                  width: 0.5
              )
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkResponse(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset('assets/back.svg')),
            const Text('Sản Phẩm Bán Chạy Nhất',style: TextStyle(color: Color(0xFF595D5F),fontSize: 16,fontWeight: FontWeight.w600),),
            SvgPicture.asset('assets/d_search.svg'),
            SvgPicture.asset('assets/d_goods.svg'),

          ],
        ),
      ),
    );
  }
}

class _BestSellWidget extends StatefulWidget {
  const _BestSellWidget({Key? key}) : super(key: key);

  @override
  State<_BestSellWidget> createState() => _BestSellWidgetState();
}

class _BestSellWidgetState extends State<_BestSellWidget> {
  final dio = Dio();
  List<Sell> bestsell = [];

  Future<BestSellModel> getBestSellModel() async {
    Response r = await dio.get(
        'https://mobile.gongu365.vn/v6/api/public/product/best-sell?numberNews=5&page=0&size=10&sort=buyCount%2CDESC');
    return BestSellModel.fromJson(r.data);
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  initData() async {
    BestSellModel data = await getBestSellModel();
    setState(() {
      bestsell = data.productsPage?.sell ?? [];
    });
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
    return GridView.count(
      crossAxisCount: 2,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 8.0,
      childAspectRatio: 0.6,
      children: List.generate(bestsell.length, (idx) {
        var y = bestsell[idx];
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
          child: InkResponse(
            onTap: () async {
              final r = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(result: y.productId, categoryId: y.categoryId),
                ),
              );
              if (r != null) {
                print('ket qua la: $r');
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 160,
                    height: 190,
                    child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(3)),
                        child: Image.network(
                          y.productImage ?? '',
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
            ),
          ),
        );
      }),
    );
  }
}
