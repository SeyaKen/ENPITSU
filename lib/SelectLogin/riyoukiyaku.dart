
import 'package:flutter/material.dart';

class Riyoukiyaku extends StatefulWidget {
  const Riyoukiyaku({super.key});

  @override
  State<Riyoukiyaku> createState() => _RiyoukiyakuState();
}

class _RiyoukiyakuState extends State<Riyoukiyaku> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                  '利用規約',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black,
                  ),
                ),
                const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ],
            )),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                      child: Text(
                    'この利用規約（以下，「本規約」といいます。）は，瀬谷剣（以下、「当方」と言います。）がこのスマートフォン用アプリケーション上で提供するサービス（以下「本サービス」と言います）の利用に関する条件を定めたものであり、本サービスを利用するお客様（以下「利用者」と言います）全てに適用されるものです。',
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '第1条（規約への同意）',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '1.本サービスをご利用になる前に、本規約を良くお読みください。\n2.利用者は、本規約の定めに従って本サービスを利用しなければなりません。\n3.利用者は、会員登録をしないかぎり本サービスを利用できません。\n4.利用者は会員登録をするにあたり、本規約に同意して頂くことが必要であり、会員登録が完了した時点で、本規約を内容とする本サービス利用契約（以下「本契約」といいます）が当方との間で締結されます。',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '第2条（規約の適用）',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '本規約の規定が利用者との本規約に基づく契約に適用される関連法令に反するとされる場合、当該規定は、その限りにおいて、 当該利用者との契約には適用されないものとします。但し、この場合でも、本規約の他の規定の効力には影響しないものとします。',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '第3条（本サービスの内容）',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '本サービスは、日本在住の男女（もしくは留学生）を対象とした、 大学生の方の恋愛や友達づくりなどをサポートするサービスです。日本国外からのご利用（日本国外のIPアドレスでのアクセスその他当方が日本国外からの利用と判断する場合を含む）はできませんので、ご注意ください。 本サービスは、一部のサービスおよび機能を、無料でご利用いただけます。 恋人や友達探しのため、他の会員と十分なコミュニケーションをとるためには、 有料の機能をお使いいただくことをお勧めしています。なお、本サービスは恋人や友達を見つけることを保証するものではありません',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '第4条（定義）',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '本サービス利用規約において、次の用語はそれぞれ以下のように定義します。\n1.「コンテンツ」本サービスを通じて利用者が入力した、プロフィール、メッセージなどの一切の情報。\n2.「利用者」当方が定めた本サービスの登録手続きに従い、本規約に対し同意の上、本サービスの会員登録を完了し、本サービスを利用する資格を持つ個人をいいます。\n3.「有料サービス」本サービス上で利用者が任意で申し込むことができる有料の会員機能の総称',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Flexible(
                        child: Text(
                          '第5条（本サービスの提供、無保証、変更および中止）',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '1.当方は、本サービスの提供を受けることができる利用者を、会員登録の有無、年齢、その他、 当方高が合理的に必要と判断する条件を満たしたお客様に限定することができるものとします。\n2.当方は、当方が合理的に必要と判断する場合、 あらかじめ利用者に通知することなく、いつでも、本サービスの全部または一部の内容を変更し、また、その提供を中止することができるものとします。 当方は、本規定に基づき当方が行った措置によって利用者に生じた損害について一切の責任を負いません。\n3.当方は、本サービスに事実上または法律上の瑕疵（安全性、信頼性、 正確性、完全性、有効性、特定の目的への適合性、セキュリティなどに関する欠陥、エラーやバグ、 権利侵害などを含みますが、これらに限りません）がないことを保証しておりません。\n4.当方は、本サービスが、全てのパソコン、スマートフォン、タブレット端末等およびOSに対応することを保証しておりません。また、当方は、利用者の環境により本サービスを利用できなかったことに基づき利用者に生じた損害について、一切の責任を負いません。',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '第6条（利用資格）',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '1.日本在住の18歳以上の大学生（ただし留学生を含む）のみが、交際相手がいない方、独身の方（現在離婚している方も含む）のみが、日本国内において利用可能なサービスです。年齢及び独身・交際相手の有無の判断は、しかねます。そのため、全ての本サービスの会員が常時18歳以上かつ独身・交際相手がいない、かつ大学生であることを当方が保証するものではありません。登録後に違反が発見された場合、当方判断で会員登録を無効とさせていただきます。当方は、無効とする措置により利用者に発生した損害について一切の責任を負わないものとします。\n2.当方は、利用者が以下のいずれかに該当すると判断する場合、当該利用者に対し以下に定める措置の実施を求め、当該措置の実施により利用資格等につき確認ができるまでの間、会員登録を拒否し、または本サービスの利用を停止することができるものとします。当方は、これにより利用者に発生した損害について一切の責任を負わず、また、利用停止中の有料サービスの利用料金の返金もいたしません。\n（1）独身であることに疑義がある場合：独身証明書の提出\n（2）会員登録情報の虚偽その他利用資格に疑義がある場合：本人確認手続の履行\n（3）不正利用防止のために実施する本人確認の対象として選ばれた場合（無作為による抽出を含む）：本人確認手続の履行\n3.利用者は、本サービスをご利用になることによって、本契約に参加し本契約の規約と条件の全てに従う権利、権限、義務および能力を有すると表明し、保証するとみなされます。\n4.本サービスは、現在会員の犯罪経歴調査は行っておらず、会員の経歴も問い合わせず、会員の申告も確認は行っていないため、他の利用者について、この点を当方が保証するものではない点をご理解してください。\n5.当方は、利用者について、いずれかの犯罪経歴調査や他の審査（例：性的犯罪者登録検索）を、いつでも、利用可能な公的記録を使用して、行うことができるものとしますが、これを行う義務を負うものではありません。\n6本サービスは、現在または今後の会員の行為や整合性に関して、保証しておりません。\n7.当方は、利用者が下記の事由に相当する場合は、会員登録の拒否を行うことが出来るものとします。\n・本規約に違反するおそれがあると当方が合理的に判断した場合\n・当方に提供された登録情報の全部又は一部につき虚偽、誤記又は記載漏れがあった場合\n・過去に本サービスまたは当方が運営するサービスの利用規約に違反もしくは違反する恐れがあると合理的に判断され、または利用者の責に帰すべき事由によりそれらのサービスの利用の登録を取り消された者である場合\n・成年被後見人、被保佐人、又は被補助人のいずれかであり、法定代理人、後見人、保佐人又は補助人の同意等を得ていなかった場合\n・反社会的勢力等（暴力団、暴力団体、右翼団体、反社会的勢力、その他これに準ずる者を意味します。以下同じ。）である、又は資金提供その他を通じて反社会的勢力等の維持、運営若しくは経営に協力若しくは関与する等反社会的勢力等との何らかの交流若しくは関与を行っていると当方が判断した場合\n・その他、当方が登録を適当でないと合理的に判断した場合\n・利用者は、プロフィール情報に変更が生じた場合は、直ちに当方所定の方法により、プロフィール情報の変更を行うものとします。',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '第7条（利用者の責任および注意義務）',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '''1.利用者は、自己の責任に基づき本サービスを利用するものとし、利用者が公開するコンテンツについて、全て自己で責任を負うものとします。\n2.利用者は当方に対し、他人の著作物を使用したことなどが原因で紛争、損害賠償の請求などが起こった場合の損害、責任について一切を免責するものとし、自らの責任をもって紛争に対処するものとします。\n3.利用者は、自己の責任において、MachuPichuアカウントを管理及び保管するものとし、これを第三者に利用させたり、貸与、譲渡、名義変更、売買等をしてはならないものとします。利用者は、当方に対し、MachuPichuアカウントを第三者に盗用されるなどにより、利用者のコンテンツの改変や改竄、個人情報等の無断閲覧などにより発生するあらゆる紛争、損害賠償の請求などについて一切を免責するものとします。\n4.利用者は、本サービス利用中に知り得た他の利用者に関する情報（他の利用者のプロフィール情報、投稿コンテンツに含まれる情報を含みますが、これらに限りません。以下「利用者情報」といいます）について、守秘義務を負うものとします。利用者は、これらの情報につき、本サービスの利用以外の目的での使用、第三者に対する開示または漏洩、当方の許可なく複製・複写のいずれもしてはならず、また、本サービスの利用終了後または当該他の利用者との交際等の終了後は、速やかに当該他の利用者のこれらの情報を破棄しなければなりません。\n5.利用者は、本条で定める行為において当方に損害を与えた場合は、当方が当該利用者に対して損害賠償を請求する権利を有することを認めます。
\n6.当方は、以下のいずれかに該当する場合には、利用者に事前に通知することなく、本サービスの利用の全部又は一部を停止又は中断することができるものとします。
・本サービスに係るコンピューター・システムの点検又は保守作業を定期的又は緊急に行う場合
・コンピューター、通信回線等が事故により停止した場合
・火災、停電、天災地変などの不可抗力により本サービスの運営ができなくなった場合
・本サービスが用いるログインサービスまた、そのほかの機能に、トラブル、サービス提供の中断又は停止、仕様変更等が生じた場合
・ログインや決済等、サービスの重要な機能に障害が発生した場合
・その他、当方が停止又は中断を必要と判断した場合
\n7.当方は、本条に基づき当方が行った措置に基づき利用者に生じた損害について一切の責任を負いません。''',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '第8条（禁止事項）',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '''利用者は、本サービスの利用に際して、以下の行為を行ってはならないものとします。利用者がこれらの禁止行為を行った、又は行うおそれがあると当方が合理的に判断した場合、利用者に通知することなく、当方は該当する内容のデータの削除、当該利用者に対して注意を促す表示を行う、または利用制限もしくは強制退会させることができるものとします。ただし、当方は、当該データ等を掲載停止または削除する義務を負うものではなく、データの削除および利用制限等の処分につきまして当方は説明の義務を負わないものとします。
利用者は、これらの禁止行為を行うことにより当方に損害を与えた場合は、当方が当該利用者に対して損害賠償を請求する権利を有することを認めます。
なお、当方は、本条に基づき当方が行った措置に基づき利用者に生じた損害について一切の責任を負いません。
1.会員のアイコン画像、サブ写真を含む、本サービス上の画像を当方の承諾なくキャプチャーその他の方法により複製、利用又は公開する行為
2.本規約に反する行為
3.日本国または利用者に適用される国・地域の法令に違反する行為
4.社会規範・公序良俗に反するものや、他人の権利を侵害し、または他人の迷惑となるようなものを、投稿、掲載、開示、提供または送信（以下これらを総称して「投稿など」といいます）したりする行為
5.利用者以外の自然人・法人・団体・組織等の第三者（以下、「第三者」といいます）に自己のMachuPichuアカウントを譲渡して、本サービスを利用させる行為
6.第三者に自己のMachuPichuアカウントのログインに必要な情報を閲覧可能な状態にしておく行為
7.本サービスに関連して、反社会的勢力に直接・間接に利益を提供する行為
8.本サービスを、提供の趣旨に照らして本来のサービス提供の目的とは異なる目的で利用する行為
9.他の利用者を含む第三者の個人情報や利用者情報を第三者に開示または漏洩する行
10.本サービス利用中に知り得た他の利用者の利用者情報を、本サービスの利用以外の目的で使用する行為
11.本サービス利用中に知り得た他の利用者の利用者情報を、当方の許可なく複製・複写する行為
12.既婚者の会員登録および本サービスの利用（登録後に既婚者となった場合も含みます）
13.18歳未満（高校生を含む）及び大学生でない者の会員登録および本サービスの利用
14.児童を騙る行為
15.性描写、残酷な表現、犯罪を誘発する表現、差別表現など、公序良俗に反する行為やコンテンツ閲覧者
16.第三者に成りすます行為
17.虚偽の情報をコンテンツに掲載し、コンテンツ閲覧者を欺く行為
18.第三者の名誉や社会的信用を毀損したり、不快感や精神的な損害を与える行為
19.選挙運動、またはこれらに類似する行為および公職選挙法に抵触する行為
20.コンテンツ閲覧者を含む利用者以外の自然人・法人・団体・組織等の第三者の個人情報の収集を行う行為
21.第三者の所有する知的所有権を侵害する行為や、著作権、肖像権の侵害を誘発する行為
22.当方が許可した場合を除く、本サービス上の文字、画像、会員のニックネーム、アイコン画像、サブ写真、プロフィール情報、自己紹介文、その他の会員の情報を無断で使用する行為（モザイク処理をしても、当方が許可をしていない場合は無断使用と見なします）
23.本サービスの運営を妨げる行為
24.当方が、本サービスの運営を妨げるおそれがあると判断する量のデータ転送、サーバーに負担をかける行為（不正な連続アクセスなど）
25.商用目的の宣伝・広告行為（例：アダルト関連サービスへの誘導を目的として特定または不特定多数の利用者にメッセージ機能などの方法で送信したりする行為）
26.有害なコンピュータウィルス、コード、ファイル、プログラム等を開示する行為、もしくは開示されている場所について示唆する行為
27.無限連鎖講およびマルチ商法、またはそれに類するもの、その恐れのあるもの、あるいは当方が無限連鎖講およびマルチ商法、またはそれに類するもの、その恐れのあるものと判断する内容を掲載する行為
28.児童ポルノ、またはそれに類する内容、あるいは当方が児童ポルノに類すると判断する内容を掲載する行為
29.性器露出画像、動画、あるいは性器を描写したデータ等、当方が性器を描写した内容であると判断した内容のサイトへのリンクを掲載する行為
30.次のようなコンテンツを投稿などすること
・許可を得ないで第三者のプロフィールや写真を使用したコンテンツ
・集団および個人に対するあらゆる種類の人種差別や偏見、憎悪、身体的危害を助長するコンテンツのような、オンラインコミュニティーに対して明らかに不快だと思われるコンテンツ
・他人への嫌がらせのコンテンツ、または嫌がらせを支持するコンテンツ
・嘘であることや誤解を招くということを利用者がわかっている情報を広めるコンテンツや、違法行為を助長するコンテンツ、または罵倒、脅迫、わいせつ、名誉毀損、文書による名誉毀損に当たるような行為を助長するコンテンツ
・｢ジャンクメール｣、｢チェーンメール｣、迷惑メール、｢スパム｣などの送信に関連するコンテンツ
・海賊版コンピュータ･プログラムを提供したり、それにリンクを張ったり、製品に組み込まれたコピー防止機能を回避する情報を提供したり、海賊版音楽を提供したり、海賊版音楽ファイルにリンクを張ったりするなどして、他人の著作権によって保護された作品を違法または不正にコピーすることを助長するコンテンツ
・性的または暴力的な手法で18歳未満の人を不当に利用するコンテンツ。または、18歳未満の人から個人情報を求める構成要素を提供するコンテンツ
・営利的または違法な目的のために、他の利用者からパスワードや個人情報を求めるコンテンツ
・違法な武器の製造、購入や、他人のプライバシーの侵害、コンピュータウィルスの製造など、違法行為に関する説明を提供するコンテンツ
・公開されていないページや、パスワードがないとアクセスできないページを含んだコンテンツ
・コンテスト、宝くじ、物々交換、宣伝、ネズミ講など、当方から事前に書面で許可を得ないで、営利的活動または販売を行うコンテンツ
31日本国外から本サービスを利用する行為
32その他当方が不適切であると判断する行為''',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '第9条（本サービスの利用制限）',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '''当方は、本サービス以外での利用者の行為を監視することができませんが、本サービスから得た情報を、他人に対する嫌がらせや罵倒、危害を加える目的で使用したり、事前に明示的な同意を相手から得ずに他の会員に連絡、宣伝、勧誘、販売したりすることも、本規約に対する違反になります。そのような宣伝や勧誘から当方の会員を守るために、利用者が他の会員に24時間以内に送ることができるメールの数を、当方の妥当な判断で適切な数に制限する権利を当方は有します。''',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '第10条（契約期間および契約の終了）',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '''1.利用者が本サービスの会員である限り、本契約は有効です。会員になって本サービスに参加することを利用者が選ばれた場合は、本サービスを即座に開始することを利用者が選ばれたことになり、クーリングオフは認められません。
2.利用者が本契約の一つ以上の条項に違反した場合、また、そのおそれがあると当方が合理的に判断した場合、当方はいつでも利用者の会員資格を即座に終了させ、禁止するコンテンツを削除し、本サービスの利用を終了させることができます。さらに、利用者が本サービスの全部または一部にアクセスすることを、恒久的または一時的に当方は禁止することができます。
3.会員登録が取り消しとなった場合、利用者が退会した場合、その他の理由により利用者が会員資格を失った場合または利用ができなかった場合、有料サービスについて利用者が購入された利用期間が終了しておらずまたは利用期間中利用できなかった期間が含まれていても、返金は致しかねます。また、利用者が当方の発行する本サービスに関連するものを購入していた場合、それらは有効期限の定めにかかわらず、会員資格の喪失と同時に失効し、利用できなくなります。
4.利用者が会員資格を有したまま有料サービスを終了された場合、終了以前に利用者が購入された利用期間が残っていても、有料サービスの一切がご利用できなくなります。また、日割りでの返金も含め、返金は致しかねます。
5.利用者が有料会員でない場合、（本サービスに最後に接続した日から数えて）6ヵ月以上本サービスを利用しなかった会員のアカウントを、本サービスは無効にするまたは削除することができます｡''',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '第11条（再利用の禁止）',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '''利用者が、当方のサービスやそれらを構成するデータを、本サービスの提供目的を超えて利用した場合、当方は、それらの行為を差し止める権利ならびにそれらの行為によって利用者が得た利益相当額を請求する権利を有します。''',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Flexible(
                        child: Text(
                          '第12条（無料会員と有料会員、および利用料金）',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '''有料化次第追加''',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Flexible(
                        child: Text(
                          '第13条（投稿などの削除、サービスの利用停止、アカウント削除について）',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '''利用者が本サービスに投稿などしたコンテンツと、本サービスを通してお客様が他の会員に転送したコンテンツについて、お客様は単独で責任を負います。利用者が投稿した場合はいつでも、そのコンテンツが（a）正確かつ（b）本契約に違反せず、かつ（c）あらゆる点で誰にも害が及ばないことを、お客様は表明し保証したことになります｡
当方は、提供するサービスを適正に運営するために、以下の場合にはあらかじめ通知することなく、データやコンテンツを削除したり、サービスの全部または一部の利用をお断りしたり、利用者のアカウントを削除したりするといった措置を講じることができるものとします。
・利用者が本規約に定められている事項に違反した場合、もしくはそのおそれがあると当方が合理的に判断した場合
・当方にお支払いいただく代金について支払の遅滞が生じた場合
・本サービスの代金決済手段として指定されたクレジットカードや銀行口座の利用が停止された場合
・利用者が破産もしくは民事再生の手続の申立てを受け、または利用者自らがそれらの申立てを行うなど、利用者の信用不安が発生したと当方が判断した場合
・アカウントが反社会的勢力またはその構成員や関係者によって登録または使用された場合、もしくはそのおそれがあると当方が判断した場合
・利用者が一定期間にわたってアカウントまたは特定のサービスを使用していない場合
・その他、利用者との信頼関係が失われた場合など、当方と利用者との契約関係の維持が困難であると当方が判断した場合
また、本サービス上での利用者間のメッセージのやりとりは、当方の管理する電子掲示板を通じて提供されます。電子掲示板は、当該メッセージのやりとりをされる利用者同士と当方の三者が閲覧できる仕様となっております。利用者は、当方が事故防止ならびに健全なサービスを運営する目的で、メッセージの内容を閲覧、削除することに同意するものとします。但し、当方として電子掲示板を巡回・監視する義務を負うものではありません。''',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '第14条（当方に対する補償）',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '''利用者は、利用者が法令または本規約に違反して本サービスを利用したことに起因して（かかる趣旨のクレームを第三者より当方が受けた場合を含みます）、当方が直接的もしくは間接的に何らかの損害、損失または費用負担（弁護士費用の負担を含みます）を被った場合、当方の請求にしたがって直ちにこれを賠償または補償しなければなりません。''',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Flexible(
                        child: Text(
                          '第15条（利用者のデータおよびコンテンツの取扱い）',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '''当方の本サービスの保守や改良などの必要が生じた場合には、当方は利用者が当方の管理するサーバーに保存しているデータを、本サービスの保守や改良などに必要な範囲で複製等することができるものとします。

利用者が投稿などをしたコンテンツ（位置情報、画像データ、テキストを含みますが、これらに限られません。以下「投稿コンテンツ」といいます）については、利用者または当該投稿コンテンツの著作権者に著作権が帰属します。投稿コンテンツについて、利用者は当方に対して、日本の国内外で無償かつ非独占的に利用（複製、上映、公衆送信、展示、頒布、譲渡、貸与、翻訳、翻案、出版を含みます）する権利を期限の定めなく許諾（サブライセンス権を含みます）したものとみなします。ただし、利用者間のメッセージ内容についてはプライバシーを尊重し、本条の許諾対象には含まないものとします。なお、利用者は著作者人格権を行使しないものとします。

利用者が本サービスを利用して生成した投稿コンテンツについての著作権を除き、本サービスおよび本サービスに関連する一切の情報についての著作権およびその他知的財産権はすべて当方または当方がその利用を許諾した権利者に帰属し、利用者は無断で複製、譲渡、貸与、翻訳、改変、転載、公衆送信（送信可能化を含みます）、伝送、配布、出版、営業使用等をしてはならないものとします。

当方は、投稿コンテンツの利用を、利用者自身を除く、他の利用者その他の第三者に許諾するものではなく、利用者は他の利用者の投稿コンテンツの権利を侵害する行為を行ってはならないものとします。また、利用者は投稿コンテンツをクロール等で自動的に収集、解析する行為も行ってはならないものとします。

当方は、他の利用者の投稿コンテンツを利用したことによって利用者に生じた損害について、一切の保証をいたしません。また、利用者が他の利用者の投稿コンテンツを利用して利益を得た場合には、当方はその利益相当額の金員を請求できる権利を有するものとします。''',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '第16条（連絡または通知）',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '''1.利用者は、本利用規約に別段の定めがある場合を除き、当方への連絡はお問い合わせフォームから行うものとします。当方は電話による連絡および来訪は受け付けておりません。

2.利用者への連絡または通知の必要があると当方が判断した場合には、本サービスに登録されたメールアドレス宛に連絡または通知を行います。ただし、利用者から正確な連絡先の提供がなされていない場合の不利益に関しては、当方は一切責任を負いません。''',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '第17条（権利義務などの譲渡）',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '''利用者は、本規約に基づくすべての契約について、その契約上の地位およびこれにより生じる権利義務の全部または一部を、第三者に譲渡または貸与することはできません。

当方は本サービスにかかる事業を他社に譲渡した場合には、当該事業譲渡に伴い利用契約上の地位、本規約に基づく権利及び義務並びに利用者の登録情報その他の顧客情報を当該事業譲渡の譲受人に譲渡することができるものとし、利用者は、かかる譲渡につき本項において予め同意したものとします。なお、本項に定める事業譲渡には、通常の事業譲渡のみならず、会社分割その他事業が移転するあらゆる場合を含むものとします。''',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '第18条（会員間の紛争）',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '''利用者は、自己の責任に基づき本サービスを利用するものとし、本サービスの他の会員との交流に関しては、単独で責任を負うものとします。当方は、利用者と他の会員との間で起きた紛争を監視する権利を留保しますが、義務はありません。''',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '第19条（プライバシー）',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '''本サービスの使用には、当方のプライバシーポリシーも適用されます。会員が当方に提供した（機密性の高い個人情報も含む）個人情報は、当方のコンピュータに保存されます。興味や好み、閲覧のパターンについてのプロフィールを作成し、会員が本サービスに参加できるようにするために、当方がこの情報を利用することに、会員は同意するものとします｡''',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Flexible(
                        child: Text(
                          '第20条（児童を誘引する行為の規制）',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '''本サービスでは、インターネット異性紹介事業を利用して児童を誘引する行為の規制を行っております。

この目的は、「インターネット異性紹介事業の利用に起因する児童買春その他の犯罪から児童を保護し、もって児童の健全な育成に資すること」です。このような目的を実現するため、本サービスではサービス利用に当たって大学から提供されたメールアドレスでしか新規登録ログインができないようになっています。

''',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        '第21条（免責事項）',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '''当方の債務不履行責任は、当方の故意または重過失によらない場合には免責されるものとします。

なお、お客様との本規約に基づく当方のサービスのご利用に関する契約が消費者契約法に定める消費者契約に該当する場合、上記の免責は適用されないものとし、当方は、当方の故意・重過失に起因する場合を除き、通常生じうる損害の範囲内で、かつ、有料サービスにおいては代金額（継続的なサービスの場合は1か月分相当額）を上限として損害賠償責任を負うものとします。

本サービスの構成要素は、あらゆる種類の条件、保証、またはその他の契約条件なしに、無保証で提供されます。したがって、この法的通知がなければ本サービスとの関係で効力を持った可能性のあるすべての説明、保証、条件、またはその他の契約条件（満足のゆく品質、目的適合性、合理的な配慮と技術の行使など、法によって暗示されている条件を含みますが、これに限られません）を法によって認められている最大限度まで本サービスは排除するという前提で、当方は本サービスをお客様に提供します。

当方、会員やその他の個人または団体が、本サービスを通じて表示し、アップロードし、または配布する助言、意見、声明やその他の情報について、当方はその正確さや信頼性を表明し保証するものではありません。以上のような意見、会員プロフィール、助言、声明や情報を信頼することについては、お客様の自己責任になることをお客様は承認するものとします。オンラインでもオフラインでも、会員の行動について当方は責任を負いません。本サービスを利用される際は、注意をして常識を働かせてください。適用法令の下で排除することが不可能な強行法規の権利（消費者としてのお客様の実定法上の権利を含みます）を、この法的通知および以上の免責事項は排除するものではありません。

本サービスは、日本国内においてのみ利用することができ、日本国外から利用（日本国外のIPアドレスでのアクセスその他当方が日本国外からの利用と判断する場合を含む）はできません。当方は、日本国外から本サービスを利用できないことにより利用者に発生した損害について一切の責任を負わず、また、有料サービスの利用料金の返金もいたしません。''',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Flexible(
                        child: Text(
                          '第22条（本サービスのご利用上の注意）',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '''1.本サービスは、恋人または友達を真剣に探している18歳以上（高校生は除く）かつ交際相手がいない方かつ独身の方（現在離婚している方も含む）かつ大学生に対して、恋愛や友達づくりをサポートするサービスですが、 不特定多数の方がご利用になっているため、場合によっては本サービスを悪用されたりする可能性があります。そのような可能性があることをご認識のうえ、 他の会員（特にメッセージのやり取りを行う他の会員）に対してのやりとり方法、個人情報の開示に関しては、慎重に考えて、本サービスをご利用ください。また、やり取りをしている会員が独身・交際相手がいないか否か判断しかねます。そのため、全ての会員様が18歳以上で、かつ独身・交際相手かつ大学生であることを保証するものではございません。他の会員に対して本サービス以外でのやりとり手段の提供、個人情報等重要な情報の開示を行う場合は、慎重に検討し自己の責任のうえで行うようにしてください。規約違反の疑いがある会員を発見した場合は、お問い合せより違反内容をご報告ください。
2.利用者は、自らの責任により大学より提供されたメールアドレスの設定を行うものとします。利用者は、大学から提供されるメールアドレスを当方に提供することにより、不利益が生ずる可能性があることに予め同意するものとします。当方は、利用者が行った大学より提供されたメールアドレスの設定に起因して利用者に発生した損害について一切の責任を負わないものとします。
3.利用者は、大学より提供されたメールアドレス以外を利用して登録した場合、会員登録によって、現実の友人、知人等の第三者に本サービスを使用していることを知られるなどの不利益が生ずる可能性があることに予め同意するものとします。
4.利用者は、当方が大学より提供されたメールアドレスのバグ、不具合、瑕疵等について一切の責任を負わないことに予め同意するものとします。
5.利用者は、大学より提供されたメールアドレスの仕様、サービス内容その他の事項が変更されることにより、本サービスの内容や機能が変更される場合があることに予め同意するものとします。当方は、かかる変更により利用者に発生した損害について一切の責任を負わないものとします。''',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Flexible(
                        child: Text(
                          '第23条（本サービス及び利用規約の変更について）',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '''当方が必要と判断した場合には、利用者の事前の承諾を得ることなく、本規約をいつでも変更することができるものとします。本規約変更後に、利用者が本サービスをご利用される場合には、変更後の本規約の内容を承諾したものとみなします。''',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Flexible(
                        child: Text(
                          '第24条（準拠法）',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: [
                      Row(
                        children: const [
                          Flexible(
                            child: Text(
                              '''本規約は、日本法に準拠し、解釈されるものとします。''',
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Flexible(
                        child: Text(
                          '第25条（管轄裁判所）',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: const [
                      Text(
                        '''利用者と当方との間で訴訟の必要が生じた場合、東京地方裁判所を第一審の専属的合意管轄裁判所とします。''',
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Flexible(
                        child: Text(
                          '第26条（附則）',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            '''2021年10月9日 制定・施行''',
                          ),
                        ],
                      ),
                    ],
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
        ));
  }
}