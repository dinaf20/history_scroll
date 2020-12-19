import 'package:flutter/material.dart';
import'package:sticky_headers/sticky_headers.dart';
import 'package:sticky_list_history/theme/app_typography.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeView(),
    );
  }
}
class HomeView extends StatelessWidget {

  Container card(String title, String Stitle, Color colour) {
    title = title;
    Stitle = Stitle;
    colour = colour;
    return Container(
        height: 90,
        width: double.infinity,
        decoration: (BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10), bottomRight:Radius.circular(10) ),
            boxShadow: [
              BoxShadow(
                color: colour.withOpacity(0.6),
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 2),
              )
            ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(top: 24, right: 16.0),
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: AppTypography.header2.copyWith(color: colour),
                )),
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: Text(
                Stitle,
                textAlign: TextAlign.right,
                style: AppTypography.bodySmall
                    .copyWith(color: colour, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ));
  }
  Widget content(String cont) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        color: Colors.white,
        child: Text(
          cont,
          textAlign: TextAlign.right,
          style: AppTypography.bodyNormal2.copyWith(fontWeight: FontWeight.w400, ),
        ),
      ),
    );
  }

  StickyHeaderBuilder scroll (String img, String title, String desc, String cont, Color colour){
    return StickyHeaderBuilder(
        builder: (context, stuckAmount) {
          stuckAmount = stuckAmount.clamp(0.0, 1.0);
          return Container(
            height: 200.0 - (100 * (1 - stuckAmount)),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,

                  alignment: Alignment.topCenter),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
          );
        },
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            card(title, desc, colour),
            content(cont),
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Color(0xffc7c7c7),title: Center(
          child: Text(
            "التسلسل الزمني للتاريخ الاسترالي",
            style: AppTypography.headerMedium.copyWith(
                fontSize: 20,
                letterSpacing: 2,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
        ),),
        body: ListView.builder(
            itemCount: 1,
          itemBuilder: (context, index) {
          return Column(
            children: [
              //1
              scroll ('assets/art.jpg', 'قبل الميلاد', '60000-42000 ق.م',
                  " أن أول إنسان وطأت قدماه أستراليا كان قبل 65 ألف عام على الأقل، أي قبل ما كان يقدر سابقا بكثير.\n تستند هذه النتيجة إلى كنز من آلاف القطع الأثرية للسكان الأصليين تم اكتشافها في المأوى الصخري المسمى مادجيدبي في منطقة الإقليم الشمالي.\n كما تفيد الدراسات إلى أن البشر وصلوا إلى القارة الأسترالية قبل انقراض الحيوانات الضخمة مثل الدببة الأسترالية العملاقة والكنغارو قصير الوجه. وأن الاستيطان الأول  للبشر حدث في وقت كان فيه مستوى سطح البحر أقل بكثير، حيث كانت المسافة من جنوب شرقي آسيا إلى أستراليا أقصر من اليوم.\n يذكر أن توقيت وصول أول إنسان إلى البلاد كان موضع نقاش على مدى عقود، مع تقديرات سابقة لوصول السكان الأصليين إلى أستراليا ما بين 47 ألف و60 ألف عام.  ",Colors.brown),

              //2
                  scroll ('assets/vessel.jpg','اكتشاف أستراليا','القرن السابع عشر',

            "   يصنف البحار والمستكشف الهولندي وليام جانزون كأول أوروبي شاهد أستراليا، فخلال رحلته الشهيرة ما بين عامي 1605 و1606 حلّ الأخير بهذه المنطقة ليعلن بداية الرحلات الاستكشافية والتوسعية الهولندية بها.\n واصل البحارة الهولنديين الإبحار على طول الساحل في رحلاتهم ودعوا هذه الأرض نيو هولاند. و في عام 1642 شاهد هولندي يدعى أبيل تازمان  (Abel Tasman) جزيرة تسمى (فان ديمان), ولم يدرك أن هذه الجزير جزء من أستراليا. تم تغيير الاسم لاحقا الى تازمينيا على شرف مكتشفها. ثم اكتشف الجزر التي أطلق عليها اسم نيوزيلندا وجزر تونجا وفيجي.  ",
            Color(0xff023047)),
              //3
              scroll ('assets/cook.jpg', ' بريطانيا في استراليا', 'القرن الثامن عشر',
                      "ما بين سنتي 1768 و1771، قاد المستكشف الإنجليزي جيمس كوك رحلة علمية واستكشافية انتهت بإعلان ملكية بريطانيا للسواحل الشرقية لأستراليا يوم 22 من شهر آب/أغسطس سنة 1770 وظهور ما يعرف بمنطقة نيوساوث ويلز.\n سعى الإنجليز إلى توسيع نفوذهم ليمتد نحو ممتلكاتهم في أستراليا. وبناء على ذلك، حاولت بريطانيا إنشاء عدد من المستعمرات بهذه الأراضي, لكن هذه المهمة مثلت عبئا ثقيلا على السلطات, لغياب مقومات البنية التحتية و المناخ السيء, فارتأت بريطانيا ترحيل المجرمين نحو المستعمرات في استراليا كبديل لمستعمراتها في أمريكا بعد حصولها على استقلالها.وفي عام 1793 وصلت أول سفينة تحمل أول المستوطنين المهاجرين الأحرار، الذين كانت شروط هجرتهم تشمل تزويدهم بمرور مجاني واعطائهم معدات زراعية وأدوات، بالإضافة إلى قطعة أرض خلية من النفقات.  "
                  , Colors.blueGrey),
              //4
              scroll ('assets/castle_hill.jpg','تأسيس المستعمرات' ,'القرن التاسع عشر',
            "في عام 1804، اندلع تمرد المدانين في كاسل هيل الذي يقوده حوالي مئتين من الهاربين، معظمهم من المدانين الإيرلنديين، كانت هذه الانتفاضة الأولى والوحيدة للمسجونين في التاريخ الأسترالي, غير أنه أُخمد بسرعة من قِبل فيلق نيو ساوث ويلز.في 1803, استعمرت أرض فان دامين، والتي تسمى تازمينيا حالياً، حتى أصبحت مستعمرة مستقلة في 1825. وقامت المملكة المتحدة باستعمار الجزء الغربي من أستراليا في 1828. بعد انفصال عدة مستعمرات عن نيو ساوث ويلز مثل: جنوب أستراليا في 1836 وفيكتوريا في 1851 وكوينزلاند في 1859.  تأسس الإقليم الشمالي الذي كان منفصلاً عن الجنوب الأسترالي، حينها كانت جنوب أستراليا مقاطعة حرة ولم تكن مستعمرة عقوبات أبداً. وكذلك فيكتوريا وغرب أستراليا، ولكنهم مؤخراً وافقوا على نقل المحكوم عليهم إليها. وقاد سكان نيوساوث ويلز إلى حملة لإيقاف نقل المحكوم عليهم للمستعمرة، حينها كانت أخر سفينة للمحكوم عليهم تصل نيوساوث ويلز في 1848. "
            , Colors.grey[850]),

              //5
              scroll ('assets/rush.jpg', 'اكتشاف الذهب' ,'القرن التاسع عشر',
            "تم اكتشاف الذهب في استراليا لأول مرة عام 1951 مما أدى إلى تحول استراليا اقتصاديا وسياسيا وديموغرافيا. ونتيجة لذلك هاجر حوالي 2% من سكان بريطانيا بالإضافة إلى سكان من مختلف الأعراق  إلى استراليا. ان تمرّد حاجز دفاع يوريكا عام 1854، وهو احتجاج مسلّح نفّذه عمال المناجم في مناجم ذهب فيكتوريا، والجدل الذي تلا ذلك، بمثابة قوّةٍ دافعة كبيرة لإجراء إصلاحات ديمقراطية. جاء التمرّد إثر اعتراض الحكومة على تقديم تراخيص للتعدين، إذ يجب دفع رسوم الترخيص بغض النظر عما إذا كان طلب المُنقب عن الذهب قد أتى بأي ذهب، ووجد المتعهدون الأقل نجاحًا صعوبة في دفع رسوم الترخيص الخاصة بهم. وأنتج الذهب ثروة مفاجئة للقليلين، ويعود تاريخ ثراء بعض أقدم الأثرياء في أستراليا إلى هذه الفترة."
            , Colors.deepOrangeAccent),

              //6
              scroll ('assets/commonwealth.jpg', 'الاتحاد' ,'القرن العشرين',
            "في بداية القرن العشرين، بعد اختتام مفاوضات استمرت قرابة العقدين عن الاتحاد وبموافقة جميع المستعمرات الأسترالية الست على دستور اتحادي وتصديق البرلمان البريطاني عليها في مرحلة لاحقة في عام 1900، أسفر ذلك عن اندماج سياسي للمستعمرات الأسترالية الست في الكومنولث الأسترالي الموحد، وأُعلن عنه رسميًا في 1 يناير 1901،  وتم حينها اختيار علم استراليا. أصبحت أستراليا تتمتع بالحكم الذاتي في الشؤون الداخلية والخارجية بإقرار قانون اعتماد القوانين التشريعية لويستمنستر في 9 أكتوبر 1942. وأزال قانون أستراليا لعام 1986 بقايا السلطة القانونية البريطانية على الصعيد الاتحادي. "
            , Colors.grey[700]),
            ],
          );
        }));
  }
}



