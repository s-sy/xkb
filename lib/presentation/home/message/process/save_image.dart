import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

/**
 * 分享接口需要先下载图片
 */
class AppUtil {
  // 默认为下载网络图片，如需下载资源图片，需要指定 [isAsset] 为 `true`。
  static Future<void> saveImage(String imageUrl, {bool isAsset: false}) async {
    try {
      if (imageUrl == null) throw '保存失败，图片不存在！';
      if (await Permission.storage.request().isGranted) {
      } else {
        // openAppSettings();
        print('无法存储图片，请先授权！');
      }
      Uint8List imageBytes;
      if (isAsset == true) {
        ByteData bytes = await rootBundle.load(imageUrl);
        imageBytes = bytes.buffer.asUint8List();
      } else {
        // 保存网络图片
        CachedNetworkImage image = CachedNetworkImage(imageUrl: imageUrl);
        DefaultCacheManager manager =
            image.cacheManager ?? DefaultCacheManager();
        Map<String, String> headers = image.httpHeaders;
        File file = await manager.getSingleFile(
          image.imageUrl,
          headers: headers,
        );
        imageBytes = await file.readAsBytes();
      }
      final result = await ImageGallerySaver.saveImage(imageBytes);
      if (result == null || result == '') throw '图片保存失败';
      print(result);
      print("保存成功");
    } catch (e) {
      print(e.toString());
    }
  }
}
