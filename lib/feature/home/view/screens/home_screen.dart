import 'package:edunexus/core/helper/app_images.dart';
import 'package:edunexus/core/helper/shared_pref_helper.dart';
import 'package:edunexus/core/theme/app_color.dart';
import 'package:edunexus/core/theme/app_text_style.dart';
import 'package:edunexus/feature/courses/views/screens/course_details.dart';
import 'package:edunexus/feature/home/cubit/home_cubit.dart';
import 'package:edunexus/feature/home/data/model/all_courses.dart';
import 'package:edunexus/feature/home/view/widgets/gride_view_cousre.widget.dart';
import 'package:edunexus/feature/home/view/widgets/home_screen_skeleton.dart';
import 'package:edunexus/feature/home/view/widgets/information_of_user_widget.dart';
import 'package:edunexus/feature/home/view/widgets/list_view_categories_widgets.dart';
import 'package:edunexus/feature/notification/presentation/screens/notificatios_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<AllCoursesModel> _filterCourses(List<AllCoursesModel> courses) {
    if (_searchQuery.isEmpty) return courses;

    return courses.where((course) {
      return (course.title?.toLowerCase().contains(
                _searchQuery.toLowerCase(),
              ) ??
              false) ||
          (course.description?.toLowerCase().contains(
                _searchQuery.toLowerCase(),
              ) ??
              false) ||
          (course.category?.toLowerCase().contains(
                _searchQuery.toLowerCase(),
              ) ??
              false);
    }).toList();
  }

  Widget _buildSearchResults(List<AllCoursesModel> filteredCourses) {
    if (filteredCourses.isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.search_off, size: 64, color: Colors.grey),
            SizedBox(height: 16.h),
            Text(
              'No courses found for "$_searchQuery"',
              style: AppTextStyle.poppins14BoldprimaryColor.copyWith(
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      itemCount: filteredCourses.length,
      itemBuilder: (context, index) {
        final course = filteredCourses[index];
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              course.thumbnail ?? 'https://via.placeholder.com/60',
              width: 60.w,
              height: 60.h,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    width: 60.w,
                    height: 60.h,
                    color: Colors.grey[200],
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
            ),
          ),
          title: Text(
            course.title ?? 'No title',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            course.category ?? 'No category',
            style: TextStyle(fontSize: 12.sp, color: Colors.grey),
          ),
          trailing: Text(
            course.price != null ? '\$${course.price}' : 'Free',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.primaryColor,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourseDetails(allCoursesModel: course),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const HomeScreenSkeleton();
          } else if (state is HomeError) {
            return Center(
              child: Text(
                state.errorMessage,
                style: AppTextStyle.poppins14BoldprimaryColor,
              ),
            );
          } else if (state is HomeSuccess) {
            final courses = state.allCoursesList;
            final filteredCourses = _filterCourses(courses);

            CacheHelper().saveData(
              key: 'id',
              value:
                  courses
                      .map((course) => course.sId ?? 'Unknown')
                      .toSet()
                      .toList(),
            );

            return SafeArea(
              child: Column(
                children: [
                  // Search Bar
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 10.h,
                    ),
                    color: AppColor.backGroundColor,
                    child: Row(
                      children: [
                        if (!_isSearching) ...[
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => const NotificatiosScreen(),
                                ),
                              );
                            },
                            child: Image.asset(AppImages.notificationIcon),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(
                              Icons.search,
                              color: AppColor.primaryColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _isSearching = true;
                              });
                            },
                          ),
                        ],
                        if (_isSearching) ...[
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: AppColor.primaryColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _isSearching = false;
                                _searchQuery = "";
                                _searchController.clear();
                              });
                            },
                          ),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: 'Search courses...',
                                hintStyle: TextStyle(color: Colors.grey),
                                border: InputBorder.none,
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _searchQuery = value;
                                });
                              },
                            ),
                          ),
                          if (_searchQuery.isNotEmpty)
                            IconButton(
                              icon: const Icon(Icons.clear, color: Colors.grey),
                              onPressed: () {
                                setState(() {
                                  _searchQuery = "";
                                  _searchController.clear();
                                });
                              },
                            ),
                        ],
                      ],
                    ),
                  ),

                  // Main Content
                  Expanded(
                    child:
                        _isSearching
                            ? _buildSearchResults(filteredCourses)
                            : SingleChildScrollView(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20.w,
                                  vertical: 20.h,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const InformationOfUserWidget(),
                                    SizedBox(height: 50.h),
                                    Image.asset(AppImages.learn),
                                    SizedBox(height: 20.h),
                                    Text(
                                      'Top Categories',
                                      style:
                                          AppTextStyle.poppins20BoldblackColor,
                                    ),
                                    SizedBox(height: 20.h),
                                    ListViewCategoriesWidgets(
                                      categories:
                                          courses
                                              .map(
                                                (course) =>
                                                    course.category ??
                                                    'Unknown',
                                              )
                                              .toSet()
                                              .toList(),
                                    ),
                                    SizedBox(height: 20.h),
                                    Text(
                                      'Top Courses',
                                      style:
                                          AppTextStyle.poppins20BoldblackColor,
                                    ),
                                    SizedBox(height: 20.h),
                                    courses.isEmpty
                                        ? const Center(
                                          child: Text('No courses available'),
                                        )
                                        : GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: courses.length,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 10.w,
                                                mainAxisSpacing: 10.h,
                                                childAspectRatio: 0.65,
                                              ),
                                          itemBuilder: (context, index) {
                                            final course = courses[index];
                                            final isInCart = context
                                                .watch<HomeCubit>()
                                                .isInCart(course);

                                            return Stack(
                                              children: [
                                                GrideViewCousre(
                                                  course: course,
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder:
                                                            (
                                                              context,
                                                            ) => CourseDetails(
                                                              allCoursesModel:
                                                                  course,
                                                            ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Positioned(
                                                  right: 8,
                                                  bottom: 8,
                                                  child: ElevatedButton.icon(
                                                    onPressed: () {
                                                      BlocProvider.of<
                                                        HomeCubit
                                                      >(
                                                        context,
                                                      ).toggleCartCourse(
                                                        course,
                                                      );
                                                    },
                                                    icon: Icon(
                                                      isInCart
                                                          ? Icons
                                                              .remove_shopping_cart
                                                          : Icons
                                                              .add_shopping_cart,
                                                      size: 16,
                                                      color: Colors.white,
                                                    ),
                                                    label: Text(
                                                      isInCart
                                                          ? 'Remove'
                                                          : 'Add to Cart',
                                                      style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          isInCart
                                                              ? Colors.redAccent
                                                              : AppColor
                                                                  .primaryColor,
                                                      elevation: 4,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 12.w,
                                                            vertical: 8.h,
                                                          ),
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              30.r,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                  ],
                                ),
                              ),
                            ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Please wait...'));
          }
        },
      ),
    );
  }
}
