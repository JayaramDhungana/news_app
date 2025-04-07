import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/pages/first_ui.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/pages/second_ui.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/pages/third_ui.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/provider/page_view_provider.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/widgets/next_container_widget.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/pages/registration_ui/registration_first_screen.dart';

class HomeScreenSecondDesign extends ConsumerStatefulWidget {
  HomeScreenSecondDesign({super.key});

  @override
  _HomeScreenSecondDesignState createState() => _HomeScreenSecondDesignState();
}

class _HomeScreenSecondDesignState
    extends ConsumerState<HomeScreenSecondDesign> {
  final List<StatelessWidget> pages = [FirstUi(), SecondUi(), ThirdUi()];

  final PageController pageController = PageController();
  bool isLastPage = false;

  void goToNextPage() {
    if (isLastPage) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RegistrationFirstScreen()),
      );
    } else {
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final pageFromProvider = ref.watch(pageViewProvider).page;
    isLastPage = (pageFromProvider == 2) ? true : false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
     
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              onPageChanged: (index) {
                ref.read(pageViewProvider).changePage(index);
              },

              itemBuilder: (context, index) {
                return Container(
                  height: 700.h,
                  width: 380.w,
                  child: Center(child: pages[index]),
                );
              },
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  onTap: goToNextPage,
                  borderRadius: BorderRadius.circular(50),
                  child: NextContainerWidget(
                    text: "Next",
                    width: isLastPage ? 330 : 150,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    pageController.jumpToPage(3);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => ThirdUi()),
                    // );
                  },
                  child:
                      !isLastPage
                          ? NextContainerWidget(text: "Skip", width: 150)
                          : SizedBox(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
