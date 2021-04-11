import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:itlstatusb/locator.dart';
import 'package:itlstatusb/src/models/carga_model.dart';
import 'package:itlstatusb/src/models/status_model.dart';
import 'package:itlstatusb/src/screens/ScreenNow/swiper_card.dart';
import 'package:itlstatusb/src/services/api_service.dart';
import 'package:itlstatusb/src/services/authentication_service.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class ScreenNow extends StatefulWidget {
  const ScreenNow({Key key}) : super(key: key);

  @override
  _ScreenNowState createState() => _ScreenNowState();
}

class _ScreenNowState extends State<ScreenNow> {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  Status _status;
  List<Carga> _orderedCarga;
  bool loading = true;
  bool error = false;

  List<Carga> orderCargaByTodaySchedule(Status unorderedStatus) {
    List<Carga> orderedCarga = unorderedStatus.carga.map((a) => a).toList();
    orderedCarga.sort((a, b) {
      int aVal = int.parse(a.getTodaySchedule().from.replaceAll(':', ''));
      int bVal = int.parse(b.getTodaySchedule().from.replaceAll(':', ''));
      return aVal.compareTo(bVal);
    });
    return orderedCarga;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (loading && !error)
      APIService.getStatus(_authenticationService.currentUser)
          .then((Status result) {
        setState(() {
          if (result != null) {
            _status = result;
            _orderedCarga = orderCargaByTodaySchedule(result);
            loading = false;
          }
        });
      }).catchError((var err) {
        setState(() {
          error = true;
        });
      });

    if (loading && _status == null) return CircularProgressLoader();

    return Scaffold(
        body: Column(children: <Widget>[
      SvgPicture.asset(
        "assets/icons/now.svg",
        height: size.height * 0.35,
      ),
      Container(
          height: size.height / 2.5,
          width: size.width,
          alignment: Alignment.center,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              // return Image.network("http://via.placeholder.com/350x150",fit: BoxFit.fill,);
              final Carga cargaSelected = _orderedCarga[index];
              return ScreenNowCard(carga: cargaSelected);
            },
            viewportFraction: 0.75,
            itemCount: _status.carga.length,
            itemWidth: size.width,
            itemHeight: size.height / 3,
            pagination: SwiperPagination(
              alignment: Alignment.centerLeft,
              builder: new DotSwiperPaginationBuilder(
                  color: Colors.white24, activeColor: Colors.white),
            ),
            control: SwiperControl(
                iconPrevious: Icons.chevron_left,
                iconNext: Icons.chevron_right,
                size: 30,
                padding: EdgeInsets.all(0),
                color: Colors.white
                // color: Colors.white
                ),
            autoplay: false,
            loop: true,
            scrollDirection: Axis.vertical,
            // layout: SwiperLayout.CUSTOM,
            // customLayoutOption:
            //     new CustomLayoutOption(startIndex: -1, stateCount: 3)
            //         .addRotate([-45.0 / 180, 0.0, 45.0 / 180]).addTranslate([
            //   new Offset(-340.0, -40.0),
            //   new Offset(0.0, 0.0),
            //   new Offset(340.0, -40.0)
            // ]),
          ))
    ]));
  }
}

class CircularProgressLoader extends StatelessWidget {
  const CircularProgressLoader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              height: 100.0,
              width: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
