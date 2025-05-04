import 'package:edunexus/core/helper/app_constants.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/certificate/cubit/cubit/getusercertificate_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificateScreen extends StatefulWidget {
  const CertificateScreen({super.key});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  late GetusercertificateCubit getusercertificateCubit;

  @override
  void initState() {
    super.initState();
    _initializeCertificate();
  }

  Future<void> _initializeCertificate() async {
    final userId = await CacheHelper().getSecuredData(key: AppConstants.userId);
    if (userId != null) {
      getusercertificateCubit = BlocProvider.of<GetusercertificateCubit>(
        context,
      );
      getusercertificateCubit.getUserCertificate(
        AppConstants.getUserCertificate(userId),
      );
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _onRefresh() async {
    await _initializeCertificate();
  }

  Widget _buildCustomShimmerCard() {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: double.infinity,
                height: 100.h,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8.h),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(width: 150.w, height: 16.h, color: Colors.white),
            ),
            SizedBox(height: 4.h),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(width: 120.w, height: 12.h, color: Colors.white),
            ),
            SizedBox(height: 8.h),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 140.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Certificate',
          style: AppTextStyle.poppins16w600primaryColor,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: BlocBuilder<GetusercertificateCubit, GetusercertificateState>(
          builder: (context, state) {
            if (state is GetusercertificateLoading) {
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 6,
                itemBuilder: (context, index) => _buildCustomShimmerCard(),
              );
            } else if (state is GetusercertificateFailure) {
              return Center(child: Text(state.error ?? 'Error'));
            } else if (state is GetusercertificateSuccess) {
              final certificates =
                  state.userCertificateModel?.certificates ?? [];

              if (certificates.isEmpty) {
                return const Center(child: Text('No certificates found'));
              }

              return ListView.builder(
                itemCount: certificates.length,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final cert = certificates[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    elevation: 2,
                    child: Column(
                      children: [
                        Image.network(
                          cert.courseId?.thumbnail ?? '',
                          width: 200.w,
                          height: 100.h,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.error);
                          },
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          cert.courseId?.title ?? 'No Title',
                          style: AppTextStyle.poppins16w600primaryColor,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'Issued on: ${DateTime.tryParse(cert.issueDate ?? '')?.toLocal().toString().split('.').first ?? ''}',

                          style: AppTextStyle.poppins12greyColor,
                        ),
                        SizedBox(height: 8.h),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.primaryColor,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                          ),
                          onPressed: () {
                            _launchUrl(cert.certificateUrl ?? '');
                          },
                          child: Text(
                            'View Certificate',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
