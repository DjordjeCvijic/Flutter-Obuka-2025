import 'package:ed_tech/helpers/custom_colors.dart';
import 'package:ed_tech/helpers/custom_icons.dart';
import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:ed_tech/main_navigation/courses/courses_provider.dart';
import 'package:ed_tech/main_navigation/courses/search_results/search_results_provider.dart';
import 'package:ed_tech/main_navigation/courses/search_results/search_results_screen.dart';
import 'package:ed_tech/main_provider.dart';
import 'package:ed_tech/widgets/et_circle_button.dart';
import 'package:ed_tech/widgets/et_course_box.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../widgets/input_fields/et_search_input_field.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainProvider mainProvider =
        Provider.of<MainProvider>(context, listen: false);
    final CoursesProvider coursesProvider =
        Provider.of<CoursesProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      mainProvider.loggedUser.name,
                      style: ownTheme(context)
                          .heading3!
                          .copyWith(color: CustomColors.dark),
                    ),
                  ],
                ),
              ),
              ETCircleButton(
                padding: 12,
                iconPath: CustomIcons.notificationIcon,
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
              )
            ],
          ),
          EtSearchInputField(
            hintText: 'Search courses',
            textEditingController: coursesProvider.searchQueryController,
            onSearchIconTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    create: (context) => SearchResultsProvider(
                        searchQuery:
                            coursesProvider.searchQueryController.text),
                    child: SearchResultsScreen(),
                  ),
                ),
              );
            },
          ),
          FutureBuilder(
            future: coursesProvider.fetchAllCourses(),
            builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? CircularProgressIndicator()
                    : Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.only(bottom: 20),
                          separatorBuilder: (context, index) => Gap(16),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => ETCourseBox(
                              courseModel: snapshot.data!.elementAt(index)),
                        ),
                      ),
          )
        ],
      ),
    );
  }
}
