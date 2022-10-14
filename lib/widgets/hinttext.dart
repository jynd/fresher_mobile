import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/review_controller.dart';

class RadioCustomHintText extends StatefulWidget {
  const RadioCustomHintText({Key? key}) : super(key: key);

  @override
  State<RadioCustomHintText> createState() => _RadioCustomHintTextState();
}

class _RadioCustomHintTextState extends State<RadioCustomHintText> {
  Review_Controller get _read => context.read<Review_Controller>();
  Review_Controller get _watch => context.watch<Review_Controller>();
  @override
  Widget build(BuildContext context) {
    return Consumer<Review_Controller>(
      builder: (context, _read, child){
        return Container(
          padding: EdgeInsets.only(left: 18),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.08),
                          spreadRadius: 0.1,
                          blurRadius: 10,
                          offset: const Offset(
                              0, 9), // changes position of shadow
                        ),
                      ],
                    ),
                    child: customRadiobtn(
                        'Sản phẩm chất lượng tốt', 1),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Container(
                    width: MediaQuery.of(context).size.width/3.5,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.08),
                          spreadRadius: 0.1,
                          blurRadius: 10,
                          offset: const Offset(
                              0, 7), // changes position of shadow
                        ),
                      ],
                    ),
                    child: customRadiobtn('Đóng gói tốt', 2),
                  )
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/3.9,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.08),
                          spreadRadius: 0.1,
                          blurRadius: 10,
                          offset: const Offset(
                              0, 7), // changes position of shadow
                        ),
                      ],
                    ),
                    child: customRadiobtn('Dịch vụ tốt', 3),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Container(
                    width: MediaQuery.of(context).size.width/1.6,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.08),
                          spreadRadius: 0.1,
                          blurRadius: 10,
                          offset: const Offset(
                              0, 7), // changes position of shadow
                        ),
                      ],
                    ),
                    child: customRadiobtn(
                        'Nhân viên giao hàng thân thiện', 4),
                  ),
                ],
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width/2.8,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.08),
                          spreadRadius: 0.1,
                          blurRadius: 10,
                          offset: const Offset(
                              0, 7), // changes position of shadow
                        ),
                      ],
                    ),
                    child: customRadiobtn('Giao hàng nhanh', 5),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 10)),
                  Container(
                    width: MediaQuery.of(context).size.width/2.8,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.08),
                          spreadRadius: 0.1,
                          blurRadius: 10,
                          offset: const Offset(
                              0, 7), // changes position of shadow
                        ),
                      ],
                    ),
                    child: customRadiobtn('Tư vấn nhiệt tình', 6),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Widget customRadiobtn(String text, int index) {
    return OutlinedButton(
        onPressed: () {
            _read.selected = index;
            _read.insertReviewText(text);
        },
        style: OutlinedButton.styleFrom(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor:
          (_read.selected == index) ? const Color(0xffF4F4F4) : const Color(0xffFFFFFF),
          side: BorderSide(
              color:
              (_read.selected == index) ? const Color(0xffF4F4F4) : const Color(0xffFFFFFF)),
        ),
        child: Text(
          overflow: TextOverflow.ellipsis,
          text,
          style: TextStyle(
            color: (_read.selected == index) ? Colors.grey : Colors.black,
            fontSize: 14.0,),
        ));
  }
}
