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
        Scaffold(
          body: Column(children: [
            GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1,
                children: List.generate(9, (i) {
                  return Container(
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: LayoutBuilder(builder: (ctx, constraints) {
                          return Column(children: [
                            Container(
                                height: constraints.maxHeight * 0.7,
                                color: Colors.blue,
                              ),
                            Text('HELLO'),
                          ]);
                        }
                      ));
                }))
          ]),
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
