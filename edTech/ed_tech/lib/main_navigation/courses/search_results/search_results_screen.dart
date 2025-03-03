import 'package:ed_tech/helpers/custom_colors.dart';
import 'package:ed_tech/helpers/custom_themes.dart';
import 'package:ed_tech/main_navigation/courses/search_results/search_results_provider.dart';
import 'package:ed_tech/main_navigation/courses/search_results/widgets/no_results_info.dart';
import 'package:ed_tech/widgets/et_circle_button.dart';
import 'package:ed_tech/widgets/et_course_box.dart';
import 'package:ed_tech/widgets/input_fields/et_search_input_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchResultsProvider searchResultsProvider =
        Provider.of<SearchResultsProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            children: [
              Row(
                children: [
                  ETCircleButton(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Gap(8),
                  Expanded(
                    child: EtSearchInputField(
                      hintText: 'Search courses',
                      textEditingController:
                          searchResultsProvider.searchQueryController,
                      onChangeSearchQuery: searchResultsProvider.onSearch,
                    ),
                  ),
                ],
              ),
              Consumer<SearchResultsProvider>(
                builder: (context, value, child) => FutureBuilder(
                  future: searchResultsProvider.fetchCourses(),
                  builder: (context, snapshot) => snapshot.connectionState ==
                          ConnectionState.waiting
                      ? CircularProgressIndicator()
                      : snapshot.data!.isEmpty
                          ? NoResultsInfo()
                          : Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${snapshot.data!.length} Results",
                                    style: ownTheme(context)
                                        .heading4!
                                        .copyWith(color: CustomColors.dark),
                                  ),
                                  Gap(16),
                                  Expanded(
                                    child: ListView.separated(
                                      keyboardDismissBehavior:
                                          ScrollViewKeyboardDismissBehavior
                                              .onDrag,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
                                      itemBuilder: (context, index) =>
                                          ETCourseBox(
                                        courseModel:
                                            snapshot.data!.elementAt(index),
                                      ),
                                      separatorBuilder: (context, index) =>
                                          Gap(16),
                                      itemCount: snapshot.data!.length,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
