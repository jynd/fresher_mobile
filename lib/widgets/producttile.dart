import 'package:flutter/material.dart';

class ProductTile extends StatefulWidget {
  const ProductTile({Key? key}) : super(key: key);

  @override
  State<ProductTile> createState() => _ProductTileState();
}

class _ProductTileState extends State<ProductTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2, bottom: 2),
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
      color: Colors.white,
      child: ListTile(
        leading: Image.network(
            'https://s3-alpha-sig.figma.com/img/fd35/d369/5ff6a0c489df0124175fbc8653452572?Expires=1665964800&Signature=ZsuCy79OBMKYo9X5guNo5t7pjGjfFgB7bz-M0zyaptNfijY47ITSx6TvEApG4XkyWzxokWPM9HBgfZYTeyU4AdTJuoBLnZfOzC4qfeWakLJvsQWS6ZsAsx~vIBpVIavH5CRI6iazuK9tSI~wG8-ZSZNWsjaDCGMnY~FKY3RWeDj-3aYX0drW93WuYOK9sgUX0LkGi361ldZi~~Yd8n26QiS3D1U8oJKvgKLbwnYiAQdPBo4fW9gWO2Syl-XQNNNFDlyadaXea05D4RiPOS2DK7QIM0OF1pFHfW0~wRA2irmOcIy2s1w27wibsw9aR1KaMCYvE6YDIcObEeeDGocmdQ__&Key-Pair-Id=APKAINTVSUGEWH5XD5UA'),
        title: const Text(
          'Bột dinh dưỡng Hipp hoa quả, sữa và bắp 250g (Trên 6 tháng)',
          style: TextStyle(
            fontSize: 16.0,
          ),
          textAlign: TextAlign.left,
          maxLines: 2,
        ),
      ),
    );
  }
}
