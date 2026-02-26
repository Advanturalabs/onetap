import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../AppTheme/app_theme.dart';
import '../constants/app_assets.dart';

class CustomImageHandler extends StatelessWidget {
  final String? imagePath;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final String? placeholderAsset;
  final String? errorAsset;
  final Color? loaderColor;
  final double? loaderSize;

  const CustomImageHandler({
    Key? key,
    required this.imagePath,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.placeholderAsset,
    this.errorAsset,
    this.loaderColor,
    this.loaderSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if imagePath is null or empty
    if (imagePath == null || imagePath!.isEmpty) {
      return _buildErrorWidget();
    }

    if (imagePath!.startsWith('http://') || imagePath!.startsWith('https://')) {
      return CachedNetworkImage(
        imageUrl: imagePath!,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        placeholder: (context, url) => _buildPlaceholder(),
        errorWidget: (context, url, error) => _buildErrorWidget(),
      );
    } else {
      // Asset image
      return Image.asset(
        imagePath!,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildErrorWidget(),
      );
    }
  }

  /// Builds placeholder widget while image is loading
  Widget _buildPlaceholder() {
    if (placeholderAsset != null) {
      return Image.asset(
        placeholderAsset!,
        width: width,
        height: height,
        fit: fit ?? BoxFit.cover,
      );
    }

    return Center(
      child: SizedBox(
        width: loaderSize ?? 24,
        height: loaderSize ?? 24,
        child: CircularProgressIndicator(
          color: loaderColor ?? AppTheme.secondaryColor,
          strokeWidth: 2,
        ),
      ),
    );
  }

  /// Builds error widget when image fails to load
  Widget _buildErrorWidget() {
    return Image.asset(
      errorAsset ?? AppAssets.upload_icon,
      width: width,
      height: height,
      fit: fit ?? BoxFit.cover,
    );
  }
}