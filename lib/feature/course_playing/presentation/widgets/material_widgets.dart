// نفس الاستيرادات التي وضعتها، لا تغيير هنا

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class MaterialWidgets extends StatelessWidget {
  final String summary;
  final String pdfUrl;
  final String title;

  const MaterialWidgets({
    super.key,
    required this.summary,
    required this.pdfUrl,
    required this.title,
  });

  Future<void> _downloadPDF(BuildContext context, String url) async {
    try {
      if (Platform.isAndroid) {
        final status = await Permission.storage.request();
        if (!status.isGranted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Storage permission denied')),
          );
          return;
        }
      }

      Directory? directory;
      if (Platform.isAndroid) {
        directory = await getExternalStorageDirectory();
      } else {
        directory = await getApplicationDocumentsDirectory();
      }

      if (directory == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not access storage directory')),
        );
        return;
      }

      final fileName = url.split('/').last;
      final filePath = '${directory.path}/$fileName';

      final file = File(filePath);
      if (await file.exists()) {
        final shouldRedownload = await _showFileExistsDialog(context, fileName);
        if (!shouldRedownload) return;
      }

      final downloadProgress = _showDownloadProgressDialog(context);

      try {
        await Dio().download(
          url,
          filePath,
          options: Options(headers: {'ngrok-skip-browser-warning': 'true'}),
        );
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Downloaded: $fileName'),
            action: SnackBarAction(
              label: 'Open',
              onPressed: () {
                // Add file opening logic here
              },
            ),
          ),
        );
      } catch (e) {
        Navigator.of(context).pop();
        throw e;
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Download failed: ${e.toString().split('\n')[0]}'),
        ),
      );
    }
  }

  Future<bool> _showFileExistsDialog(
    BuildContext context,
    String fileName,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('File Already Exists'),
            content: Text('$fileName already exists. Download again?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Download Again'),
              ),
            ],
          ),
    );
    return result ?? false;
  }

  Future<void> _showDownloadProgressDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder:
          (context) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                SizedBox(height: 16.h),
                const Text('Downloading PDF...'),
              ],
            ),
          ),
    );
  }

  Future<void> _downloadAllPDFs(BuildContext context, List<String> urls) async {
    final shouldDownload = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Download All'),
            content: Text('Download all ${urls.length} PDF files?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Download'),
              ),
            ],
          ),
    );

    if (shouldDownload == true) {
      for (final url in urls) {
        await _downloadPDF(context, url);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cleanedPdfUrl = pdfUrl.replaceAll('[', '').replaceAll(']', '');
    final urls =
        cleanedPdfUrl
            .split(',')
            .map((e) => e.trim())
            .where((url) => url.isNotEmpty)
            .toList();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyle.poppins20BoldblackColor),
              SizedBox(height: 20.h),
              Text(
                '6h 14min · 24 Lessons',
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
              ),
              SizedBox(height: 30.h),
              if (urls.isEmpty)
                Text(
                  'No materials uploaded yet!',
                  style: AppTextStyle.poppins14w300blackColor,
                )
              else
                ...urls.map(
                  (url) => Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: Container(
                      width: double.infinity,
                      height: 80.h,
                      decoration: BoxDecoration(
                        color: AppColor.secondaryColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: SvgPicture.asset(AppImages.fileIcone),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(url.split('/').last),
                                SizedBox(height: 5.h),
                                Text(
                                  'PDF File',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () => _downloadPDF(context, url),
                            icon: Icon(
                              Icons.download,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (urls.length > 1)
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: ElevatedButton.icon(
                    onPressed: () => _downloadAllPDFs(context, urls),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 48.h),
                    ),
                    icon: const Icon(Icons.download_rounded),
                    label: const Text('Download All PDFs'),
                  ),
                ),
              SizedBox(height: 20.h),
              Text('Summary', style: AppTextStyle.poppins20BoldblackColor),
              if (summary.isNotEmpty) SizedBox(height: 8.h),
              ..._splitSummaryIntoLines(summary).map(
                (line) => Padding(
                  padding: EdgeInsets.only(bottom: 6.h),
                  child: Text(
                    line,
                    style: AppTextStyle.poppins14w300blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<String> _splitSummaryIntoLines(String summary) {
    final regex = RegExp(r'(?=\d+\.\s)');
    return summary
        .split(regex)
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
  }
}
