import 'package:flutter/material.dart';

class TextSearchWay extends StatefulWidget {
  const TextSearchWay({super.key});

  @override
  State<TextSearchWay> createState() => _TextSearchWayState();
}

class _TextSearchWayState extends State<TextSearchWay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                       
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 30,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  '教材を探す',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                  color: Colors.transparent,
                ),
              ],
            )),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.1,
                  width: MediaQuery.of(context).size.width * 0.95,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey[300],
                  ),
                  child: TextField(
                      onChanged: (text) async {
                        List preForSearch = [];
                        if (text.length > 1) {
                          for (int i = 0; i < text.length - 1; i++) {
                            if (!preForSearch
                                .contains(text.substring(i, i + 2))) {
                              preForSearch.add(text.substring(i, i + 2));
                            }
                          }
                          setState(() {});
                        } else {
                          setState(() {});
                        }
                      },
                      textAlignVertical: TextAlignVertical.center,
                      style: const TextStyle(
                        fontSize: 19,
                      ),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.search,
                            size: 19,
                          ),
                          isDense: true,
                          border: InputBorder.none,
                          hintText: '検索',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 19,
                          ))),
                ),
              ],
            ),
            const SizedBox(
                  height: 15,
                ),
            InkWell(
              onTap: () {
                
              },
              child: Container(
                height: 70,
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(width: 0.5, color: Colors.grey),
                  top: BorderSide(width: 0.5, color: Colors.grey),
                )),
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.star_border_rounded,
                          size: 40,
                          color: Colors.orangeAccent,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'カテゴリランキングから選ぶ',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                
              },
              child: Container(
                height: 70,
                padding: EdgeInsets.symmetric(
                    horizontal:MediaQuery.of(context).size.width * 0.02),
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(width: 0.5, color: Colors.grey),
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.book_rounded,
                          size: 35,
                          color: Colors.pink,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '自分で教材を作る',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                height: 70,
                padding: EdgeInsets.symmetric(
                    horizontal:MediaQuery.of(context).size.width * 0.02),
                decoration: const BoxDecoration(
                    border: Border(
                  bottom: BorderSide(width: 0.5, color: Colors.grey),
                )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.person,
                          size: 40,
                          color: Color.fromARGB(255, 30, 254, 37),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '授業から選ぶ',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
