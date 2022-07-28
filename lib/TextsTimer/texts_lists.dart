import 'package:eigo/ad_state.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class TextList extends StatefulWidget {
  const TextList({super.key});

  @override
  State<TextList> createState() => _TextListState();
}

class _TextListState extends State<TextList> {
  BannerAd? banner;

  @override
  void initState() {
    final adState = Provider.of<AdState>(context, listen: false);
    adState.initialization.then((status) {
      setState(() {
        banner = BannerAd(
          adUnitId: adState.bannerAdUnitId,
          size: AdSize.banner,
          request: const AdRequest(),
          listener: const BannerAdListener(),
        )..load();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Scaffold(
            body: Column(children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text('テキスト',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 22,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    childAspectRatio: 1,
                    children: List.generate(1, (i) {
                      return i != 0
                          ? Container(
                              margin: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                // border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: LayoutBuilder(builder: (ctx, constraints) {
                                return Column(children: [
                                  Container(
                                    height: constraints.maxHeight * 0.8,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue),
                                      color: Colors.blue,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.circular(10.0),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('HELLO'),
                                    ],
                                  ),
                                ]);
                              }))
                          : Container(
                            margin: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 4,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            child: InkWell(
                              onTap:() {

                              },
                              child: const Icon(
                                Icons.add,
                                size: 60,
                              ),
                            )
                          );
                    })),
              )
            ]),
          ),
        ),
        Positioned(
          bottom: 0,
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: banner != null
                  ? AdWidget(
                      ad: banner!,
                    )
                  : const SizedBox()),
        ),
      ],
    );
  }
}
