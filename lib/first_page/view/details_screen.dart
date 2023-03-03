import 'dart:convert';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:substring_highlight/substring_highlight.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/loading_base.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/first_page/controllers/import_details_controller.dart';
import 'package:worldcup_app/first_page/view/question_show_notification_screen.dart';
import 'package:worldcup_app/models/codeCountry.dart';
import 'package:worldcup_app/webview/view/web_view_screen.dart';

class DetailsScreen extends GetView<ImportDetailsController> {
  DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Obx(
        () => SafeArea(
          child: Column(
            children: [
              HeaderBase(
                text: 'YourDetails'.tr,
                onTap: () => Get.back(),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSize.size40),
                  child: TextCustom(
                    text: 'Toreceiveemailsplease'.tr,
                    fontSize: AppSize.size14,
                    align: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(height: AppSize.size40),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: AppSize.size15,
                    vertical: AppSize.size5,
                  ),
                  child: Form(
                    key: controller.formKey,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InputBase(
                            hintText: 'FirstName'.tr,
                            textEditingController:
                                controller.controllerFirstName,
                            validator: controller.isValidName,
                          ),
                          InputBase(
                            hintText: 'LastName'.tr,
                            textEditingController:
                                controller.controllerLastName,
                            validator: controller.isValidName,
                          ),
                          InputBase(
                            hintText: 'EmailAddress'.tr,
                            textEditingController: controller.controllerEmail,
                            validator: controller.isValidEmail,
                          ),
                          InputBase(
                            hintText: 'Number'.tr,
                            textEditingController: controller.controllerNumber,
                            isRow: true,
                            elementRow: Row(
                              children: [
                                InkWell(
                                  onTap: () => showPicker(
                                      context,
                                      'number',
                                      (index) => controller.onChange(
                                          'number', phoneCode[index])),
                                  child: Container(
                                    height: AppSize.size47,
                                    width: AppSize.size100,
                                    color: AppColors.white,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: AppSize.size12,
                                      horizontal: AppSize.size15,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextCustom(
                                          text: controller.numberCode.value,
                                          color: AppColors.black,
                                          fontSize: AppSize.size16,
                                        ),
                                        Icon(Icons.expand_more),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: AppSize.size5),
                              ],
                            ),
                          ),
                          InputBase(
                            hintText: 'Address',
                            textEditingController: controller.controllerRegion,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextCustom(text: 'Country/Region of Residence*'),
                              const SizedBox(height: AppSize.size5),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () => showPicker(
                                        context,
                                        'country',
                                        (index) => controller.onChange(
                                            'country', countryList[index])),
                                    child: Container(
                                      height: AppSize.size47,
                                      width: AppSize.size150,
                                      color: AppColors.white,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: AppSize.size12,
                                        horizontal: AppSize.size15,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextCustom(
                                            text: controller.country.value,
                                            color: AppColors.black,
                                            fontSize: AppSize.size16,
                                          ),
                                          Icon(Icons.expand_more),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: AppSize.size5),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSize.size20),
                          TextCustom(
                            text: 'PrivacyPolicy'.tr,
                            weight: FontFamily.medium,
                          ),
                          const SizedBox(height: AppSize.size10),
                          InkWell(
                            onTap: () => Get.to(
                              () => WebViewScreen(
                                  header: 'Privacy policy',
                                  url: 'https://toralarm.com/en/privacy'),
                            ),
                            child: SubstringHighlight(
                              text:
                                  'Our Privacy Policy sets out why the FootBall 2022 collects data from you and how it will be processed',
                              term: 'Privacy Policy',
                              textStyleHighlight: AppStyleCustom.getTextStyle(
                                weight: FontFamily.medium,
                              ),
                              textStyle: AppStyleCustom.getTextStyle(
                                weight: FontFamily.light,
                                fontSize: AppSize.size12,
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSize.size30),
                          controller.isLoading.value
                              ? const LoadingBase()
                              : ButtonBase.common(
                                  text: 'Continue'.tr,
                                  onPressed: () {
                                    controller.submitInfo();
                                  },
                                  fillColor: AppColors.red,
                                ),
                          const SizedBox(height: AppSize.size10),
                        ],
                      ),
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

  void showPicker(
      BuildContext context, String type, Function(dynamic)? onSubmit) {
    List<Text> list;
    if (type == 'number') {
      list = phoneCode
          .map(
            (e) => Text(
              e,
              style: TextStyle(
                fontWeight: FontFamily.medium,
                fontSize: AppSize.size22,
                height: 1.6,
              ),
            ),
          )
          .toList();
    } else {
      list = countryList
          .map(
            (e) => Text(
              e,
              style: TextStyle(
                fontWeight: FontFamily.medium,
                fontSize: AppSize.size22,
                height: 1.6,
              ),
            ),
          )
          .toList();
    }
    BottomPicker(
      items: list,
      title: '',
      buttonSingleColor: AppColors.transparent,
      buttonText: 'Choose'.tr,
      displayButtonIcon: false,
      backgroundColor: AppColors.white,
      onSubmit: onSubmit,
      itemExtent: AppSize.size50,
    ).show(context);
  }
}
