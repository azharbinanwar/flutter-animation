/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/image_1.png
  AssetGenImage get image1 => const AssetGenImage('assets/images/image_1.png');

  /// File path: assets/images/image_2.png
  AssetGenImage get image2 => const AssetGenImage('assets/images/image_2.png');

  /// File path: assets/images/image_3.png
  AssetGenImage get image3 => const AssetGenImage('assets/images/image_3.png');

  /// File path: assets/images/image_4.png
  AssetGenImage get image4 => const AssetGenImage('assets/images/image_4.png');

  /// List of all assets
  List<AssetGenImage> get values => [image1, image2, image3, image4];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/buliding.svg
  String get buliding => 'assets/svgs/buliding.svg';

  /// File path: assets/svgs/fav.svg
  String get fav => 'assets/svgs/fav.svg';

  /// File path: assets/svgs/filters.png
  AssetGenImage get filters => const AssetGenImage('assets/svgs/filters.png');

  /// File path: assets/svgs/home.svg
  String get home => 'assets/svgs/home.svg';

  /// File path: assets/svgs/location.svg
  String get location => 'assets/svgs/location.svg';

  /// File path: assets/svgs/message.svg
  String get message => 'assets/svgs/message.svg';

  /// File path: assets/svgs/person.svg
  String get person => 'assets/svgs/person.svg';

  /// File path: assets/svgs/search.svg
  String get search => 'assets/svgs/search.svg';

  /// File path: assets/svgs/search_filled.svg
  String get searchFilled => 'assets/svgs/search_filled.svg';

  /// File path: assets/svgs/send.svg
  String get send => 'assets/svgs/send.svg';

  /// List of all assets
  List<dynamic> get values => [
        buliding,
        fav,
        filters,
        home,
        location,
        message,
        person,
        search,
        searchFilled,
        send
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
