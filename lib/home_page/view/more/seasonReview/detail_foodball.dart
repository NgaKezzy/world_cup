import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/more/widgets/item_detail_tab.dart';
import 'package:worldcup_app/home_page/view/more/widgets/item_stack_detail.dart';

class DetailFoodbal extends StatelessWidget {
  const DetailFoodbal({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SafeArea(
        child: Column(
          children: [
            HeaderBase(text: 'Season Review'),
            Container(
              color: AppColors.white,
              child: Column(
                children: [
                  SizedBox(
                    height: AppSize.sizeHeightApp- 105,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 90,
                              width: AppSize.sizeWidthApp,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/ngoaihang.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                                height: 90,
                                width: AppSize.sizeWidthApp,
                                color: AppColors.purple.withOpacity(0.6)),
                            const TextCustom(
                              text: 'The Foodball',
                              color: AppColors.pink,
                              fontSize: AppSize.size18,
                              weight: FontFamily.semiBold,
                            )
                          ],
                        ),
                        Container(
                            height: 5, width: AppSize.sizeWidthApp, color: AppColors.pink),
                        Container(
                          width: AppSize.sizeWidthApp,
                          color: AppColors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.size15,
                              vertical: AppSize.size30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const TextCustom(
                                text: 'Ongoing action against discrimination',
                                color: AppColors.black,
                                fontSize: AppSize.size18,
                              ),
                              const SizedBox(
                                height: AppSize.size20,
                              ),
                              const TextCustom(
                                text:
                                    'The Premier League and our clubs are committed to eradicating prejudice and continue to promote equality and diversity in all we do.',
                                fontSize: AppSize.size15,
                                color: AppColors.black,
                              ),
                              const SizedBox(
                                height: AppSize.size15,
                              ),
                              Container(
                                height: AppSize.size100 * 2,
                                width: AppSize.sizeWidthApp,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/thumb_image.jpg'),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                height: AppSize.size15,
                              ),
                              const TextCustom(
                                  text:
                                      'The commitment of the Premier League and our clubs to promoting equality, diversity and inclusion was more evident than ever this season, as we collectively demonstrated the importance of tackling all forms of discrimination.',
                                  color: AppColors.black,
                                  fontSize: AppSize.size15),
                              const SizedBox(
                                height: AppSize.size10,
                              ),
                              const TextCustom(
                                color: AppColors.black,
                                text:
                                    'The announcement of the League’s No Room For Racism Action Plan in February outlined a series of commitments aimed at creating greater access to opportunities and career progression for Black, Asian and minority ethnic groups in football, along with actions to eradicate racial prejudice.',
                              ),
                              const SizedBox(
                                height: AppSize.size10,
                              ),
                              const TextCustom(
                                color: AppColors.black,
                                text:
                                    'These build on the existing year-round action taken by the League and clubs.',
                              ),
                              const SizedBox(
                                height: AppSize.size10,
                              ),
                              const TextCustom(
                                color: AppColors.black,
                                text:
                                    'Players and match officials once again wore the No Room For Racism sleeve badge on their shirts throughout the season.',
                              ),
                              const SizedBox(
                                height: AppSize.size10,
                              ),
                              const TextCustom(
                                color: AppColors.black,
                                text:
                                    'The League also continued to support players who took a knee at fixtures and there were more dedicated match rounds than ever to the No Room For Racism initiative, during which fans were urged to challenge and report racism.',
                              ),
                              const SizedBox(
                                height: AppSize.size10,
                              ),
                              const TextCustom(
                                text:
                                    'The No Room For Racism Action Plan is underpinned by the following six commitments:',
                                color: AppColors.black,
                              ),
                              const TextCustom(
                                color: AppColors.black,
                                text:
                                    '- Increasing diversity in leadership positions in all areas, creating a workforce which reflects the diversity of our industry and communities.',
                              ),
                              const SizedBox(
                                height: AppSize.size10,
                              ),
                              const TextCustom(
                                color: AppColors.black,
                                text:
                                    '- Increasing the representation of coaches from Black, Asian and minority ethnic backgrounds, addressing the historic under-representation of Black former players in coaching and other technical roles at senior levels in football.',
                              ),
                              const SizedBox(
                                height: AppSize.size10,
                              ),
                              const TextCustom(
                                color: AppColors.black,
                                text:
                                    '- Ensuring every player has the opportunity to achieve their potential at Premier League Academies and in their future careers, whether in football or elsewhere, regardless of ethnicity or background.',
                              ),
                              const SizedBox(
                                height: AppSize.size10,
                              ),
                              const TextCustom(
                                color: AppColors.black,
                                text:
                                    '- Using the appeal and reach of the League and clubs, working together to help children and young people reach their potential by promoting aspiration, education and pathways to opportunities.',
                              ),
                              const SizedBox(
                                height: AppSize.size10,
                              ),
                              const TextCustom(
                                color: AppColors.black,
                                text:
                                    '- Continuing to take action against all forms of racism so that football is a welcoming and safe environment for all participants and fans.',
                              ),
                              const SizedBox(
                                height: AppSize.size10,
                              ),
                              const TextCustom(
                                color: AppColors.black,
                                text:
                                    '- Providing clubs with a clear framework for achieving and reporting progress against agreed equality, diversity and inclusion targets.',
                              ),
                              const SizedBox(
                                height: AppSize.size10,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: AppSize.size35,
                              width: AppSize.sizeWidthApp * 0.4,
                              decoration: BoxDecoration(
                                  color: AppColors.pink,
                                  borderRadius:
                                      BorderRadius.circular(AppSize.size5)),
                              child: const TextCustom(
                                text: 'The Foodball',
                                weight: FontFamily.semiBold,
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.size15),
                          child: Column(children: const [
                            ItemDetailTab(),
                            ItemDetailTab(),
                            ItemDetailTab(),
                            ItemDetailTab(),
                            ItemDetailTab(),
                          ]),
                        ),
                        const SizedBox(
                          height: AppSize.size18,
                        ),
                        Container(
                          width: AppSize.sizeWidthApp,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10,
                          ),
                          child: Column(children: [
                            // ItemStackDetail(cl: AppColors.pink, name: "The Foodball"),
                            ItemStackDetail(
                                cl: AppColors.purple,
                                name: "No Room For Racism"),
                            ItemStackDetail(
                                cl: AppColors.green, name: "The Fans"),
                            ItemStackDetail(
                                cl: AppColors.aqua, name: 'Force For Good'),
                            const SizedBox(
                              height: AppSize.size50,
                            )
                          ]),
                        )
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
