import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/components/backgroundPattterns/background_angled_pattern.dart';
import 'package:food_ninja/core/components/custom_textfield_widget.dart';
import 'package:food_ninja/core/constants/assets.dart';
import 'package:food_ninja/modelView/searchCubit/search_cubit.dart';
import 'package:food_ninja/view/screens/homePageSections/component/filter_button.dart';
import 'package:food_ninja/view/screens/homePageSections/component/notification_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Stack(
        children: [
          const BackGroundAngledPattern(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Row(
                    children: [
                      Flexible(
                        flex: screenWidth <= 344 ? 9 : 5,
                        child: const Text(
                          'Find Your Favourite Food',
                          style: TextStyle(
                            fontSize: 31,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const NotificationButton(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    children: [
                      BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          return SizedBox(
                            height: 60,
                            width: state is FilterLoadingState
                                ? screenWidth - 50
                                : screenWidth - 120,
                            //ToDo color switch
                            child: CustomTextFieldWidget(
                              hintText: ' What do you want to order?',
                              formKey: context.read<SearchCubit>().searchKey,
                              controller: context.read<SearchCubit>().search,
                              prefixImage: AssetFolder.searchIcon,
                              addPrefix: true,
                              imageScale: 0.9,
                            ),
                          );
                        },
                      ),
                      const Spacer(),
                      BlocBuilder<SearchCubit, SearchState>(
                        builder: (context, state) {
                          return state is FilterLoadingState
                              ? const SizedBox()
                              : const FilterButton();
                        },
                      ),
                    ],
                  ),
                ),
                BlocBuilder<SearchCubit, SearchState>(
                  buildWhen: (previous, current) =>
                      current is ChangeHomeSectionState,
                  builder: (context, state) {
                    Widget currentSection =
                        context.read<SearchCubit>().currentHomeSection;
                    return Expanded(child: currentSection);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
