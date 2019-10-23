import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rlstyles/main.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  renderMain (Widget child) {
    return MaterialApp(
      home: Scaffold(
        body: child
      )
    );
  }

  renderSwiper () {
    return ImageView(
      url: Image.asset('assets/images/banner1.png'),
    );
  }

  Widget renderIcon (int index, List<Map<String,dynamic>> data) {
    final item = data[index];
    return View(
      styles: styles['icon'],
      children: <Widget>[
        ImageView(
          url: Image.asset('assets/images/icon${index + 1}.png',fit: BoxFit.fill,width: 42,height: 42,),
        ),
        TextView(item['name'],styles: Styles(color: '#666666',fontSize: 26,marginTop: 20))
      ],
    );
  }

  renderIconGroup () {
    List<Map<String,dynamic>> data = [
      {
        'name':'生产管理'
      },
      {
        'name':'采销管理'
      },
      {
        'name':'打印二维码'
      },
      {
        'name':'快速检测'
      },
      {
        'name':'小程序店铺'
      },
      {
        'name':'农业保险'
      },
      {
        'name':'农资商城'
      },
      {
        'name':'农担贷款'
      }
    ];
    return View(
      styles: styles['iconGroup'],
      children: data.asMap().keys.map((e)=>renderIcon(e,data)).toList()
    );
  }

  renderCardHeader (String title,String subTitle,bool isShowMore) {
    return TextView(
      title,
      styles: Styles(
        fontSize: 34,
        color: '#333333',
        fontWeight: 'bold',
      ),
    );
  }

  renderCard ({String title,String subTitle,bool isShowMore,Widget child}) {
    return View(
      styles: styles['card'],
      children: <Widget>[
        renderCardHeader(title,subTitle,isShowMore),
        child
      ]
    );
  }

  Widget renderFloorGroup (List<String> data) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return View(
          styles: Styles(width: '100%',height: 85,flexDirection: 'row', marginTop: 14,justifyContent: 'space-between'),
          children: data.map((e){
            return ImageView(
              url: Image.asset(e,width: constraints.maxWidth / data.length - (data.length > 1 ? 10 : 0) ,fit: BoxFit.fill),
            );
          }).toList()
        );
      }
    );
  }

  renderFloor () {
    Map<String,dynamic> data = {
      'type':'1*2',
      'data':[
          'assets/images/foot1.png',
          'assets/images/foot2.png',
          'assets/images/foot3.png'
      ]
    };
    final splitArr = (data['type'] as String).split('*');
    return renderCard(
      title: '为你推荐',
      child: View(
        styles: Styles(flexDirection: 'column',width: '100%'),
        children: splitArr.map((e){
          List listSelect = (data['data'] as List).sublist(0,int.parse(e));
          (data['data'] as List).removeRange(0,int.parse(e));
          return renderFloorGroup(listSelect);
        }).toList()
      )
    );
  }

  renderMall () {
    Iterable<Map<String,dynamic>> data = List(3).map((e){
      return   {
        'name':'汉印热敏标 签打印机',
        'subTitle':'一机多用 热卖爆款'
      };
    });
    return renderCard(
      title: '直营商城',
      child: View(
        styles: Styles(flexDirection: 'row',justifyContent: 'space-between',marginTop: 20),
        children: data.map((f){
          return View(
            styles:styles['mallItem'],
            children: <Widget>[
              ImageView(
                url: Image.asset('assets/images/foot2.png'),
                styles: Styles(width: 138,height: 102),
              ),
              TextView(f['name'],styles: Styles(fontWeight: 'bold',fontSize: 28,color: '#4B4B4B')),
              TextView(f['subTitle'],styles: Styles(fontSize: 26,color: '#999999')),
              TextView('立即购买>',styles: Styles(color: '#FDA00F',fontSize: 28))
            ],
          );
        }).toList()
      )
    );
  }

  rendeerView () {
    return View(
      styles: styles['body'],
      children: <Widget>[
        renderIconGroup(),
        renderFloor(),
        renderMall(),
      ],
    );
  }

  rendeerBody () {
    return View(
      styles: Styles(overflow: 'scroll'),
      children: <Widget>[
        View(
          styles: styles['main'],
          children: <Widget>[
            renderSwiper(),
            rendeerView(),
          ]
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750,height: 1330);
    return renderMain(rendeerBody());
  }
}

const Map<String,Styles> styles = {
  'main':Styles(
    // width: double.infinity,
    // height: double.infinity,
    backgroundColor: 'white',
    position: 'rel'
  ),
  'body':Styles(
    flexDirection: 'column',
    paddingLeft: 30,
    paddingRight: 30,
    marginTop: 400
    // flex: 1,
    // display: 'flex',
  ),
  'iconGroup':Styles(
    width: '100%',
    backgroundColor: 'white',
    elevation: 1,
    borderRadius: 20,
    flexWrap: 'wrap',
    paddingLeft: 25,
    paddingTop: 20,
    paddingRight: 30,
    paddingBottom: 20
  ),
  'icon':Styles(
    width: '25%',
    flexDirection: 'column',
    alignItems: 'center',
    marginTop: 20
  ),
  'card':Styles(
    flexDirection: 'column',
    marginTop: 50,
    width: '100%',
  ),
  'mallItem':Styles(
    width: 200,
    height: 372,
    flexDirection: 'column',
    justifyContent: 'space-arround',
    elevation: 1,
    borderRadius: 10,
    backgroundColor: 'white',
    alignItems: 'center',
    paddingLeft: 20,
    paddingRight: 20,
    paddingTop: 20,
    paddingBottom: 20
  )
};