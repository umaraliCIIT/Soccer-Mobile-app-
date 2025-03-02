import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_mobile_app/Provider/home_provider.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/app_bar.dart';
import 'package:soccer_mobile_app/core/components/extensions.dart';
import 'package:soccer_mobile_app/core/constants/app_constant.dart';

class PitchScreen extends StatefulWidget {
  const PitchScreen({super.key});

  @override
  State<PitchScreen> createState() => _PitchScreenState();
}

class _PitchScreenState extends State<PitchScreen> {
  late HomeProvider homeProviders;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeProviders = Provider.of(context, listen: false);
    homeProviders.getMySession();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.actionColor600,
      appBar: CommonAppBar(
        title: 'MY SESSIONS',
        onLeftPressed: () {},
        onRightPressed: () {},
      ),
      body: Consumer<HomeProvider>(
        builder: (c, homeProvider, child) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 30, 16, 0),
            child: homeProvider.mySessionData?.data != null
                ? ListView.builder(
                    itemCount: homeProvider.mySessionData?.data?.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 24.0, right: 16),
                        child: Container(
                          width: 343,
                          height: 355,
                          decoration: BoxDecoration(
                            color: AppColors.secondaryColor450, // Same as android:fillColor
                            borderRadius: BorderRadius.circular(24), // Approximating corner rounding
                          ),
                          child: Column(
                            children: [
                              Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(24),
                                  topLeft: Radius.circular(24),
                                ) // Adjust the radius as needed
                                    ),
                                child: Image.network(
                                  homeProvider.mySessionData?.data?[index].image ?? "",
                                  fit: BoxFit.fill,
                                  width: double.maxFinite,
                                  height: 210,
                                  // Ensures the image covers the entire container
                                ),
                              ),
                              8.height,
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        homeProvider.mySessionData?.data?[index].title ?? "",
                                        maxLines: 2,
                                        softWrap: true,
                                        style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600, color: AppColors.secondaryColor25),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "\$${homeProvider.mySessionData?.data?[index].price}",
                                        textAlign: TextAlign.end,
                                        style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600, color: AppColors.primaryColor600),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              6.height,
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Text(
                                  homeProvider.mySessionData?.data?[index].description ?? "",
                                  maxLines: 2,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.headlineSmall?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.secondaryColor25,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                              18.height,
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.location_on_rounded,
                                      color: AppColors.primaryColor600,
                                      size: 14,
                                    ),
                                    10.width,
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        homeProvider.mySessionData?.data?[index].location ?? "",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: textTheme.bodySmall?.copyWith(color: AppColors.secondaryColor25, fontSize: 13),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        homeProvider.mySessionData?.data?[index].durationStart ?? "",
                                        textAlign: TextAlign.end,
                                        style: textTheme.titleSmall?.copyWith(color: AppColors.secondaryColor25, fontSize: 12),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              18.height,
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CircleAvatar(
                                      radius: 12,
                                      // backgroundImage: NetworkImage("${homeProvider.mySessionData.data[index].sessionHost.image}"),
                                      backgroundImage: AssetImage('${AppConstant.assetImages}footballer.png'),
                                    ),
                                    10.width,
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        "${homeProvider.mySessionData?.data?[index].sessionHost?.firstName ?? ""} ${homeProvider.mySessionData?.data?[index].sessionHost?.lastName ?? ""}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: textTheme.bodySmall?.copyWith(color: AppColors.secondaryColor25, fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Center(
                      child: Text(
                        'No Enrolled Session Found',
                        style: textTheme.headlineSmall?.copyWith(color: AppColors.secondaryColor150),
                      ),
                    ),
                  ),

            /*Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    '${AppConstant.assetImages}sessions.png',
                    width: double.maxFinite,
                  ),
                  Positioned(
                    top: MediaQuery.paddingOf(context).top,
                    left: 8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Consumer<HomeProvider>(builder: (c, homeProvider, child) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'RWDM ACADEMIE TEST',
                              style: textTheme.headlineSmall?.copyWith(
                                color: AppColors.actionColor600,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            6.height,
                            Text(
                              'Saturday, 12 Dec 2024',
                              style: textTheme.headlineMedium?.copyWith(
                                color: AppColors.actionColor600,
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            6.height,
                            Text(
                              '2:00 PM - 04:00 PM',
                              style: textTheme.headlineSmall?.copyWith(
                                color: AppColors.actionColor600,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            (MediaQuery.sizeOf(context).height * 0.09).height,
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Player Name',
                                      style: textTheme.bodySmall?.copyWith(
                                        color: AppColors.actionColor600,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'David liz',
                                      textAlign: TextAlign.end,
                                      style: textTheme.bodySmall?.copyWith(
                                        color: AppColors.actionColor600,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            6.height,
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Email',
                                      style: textTheme.bodySmall?.copyWith(
                                        color: AppColors.actionColor600,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'David@gmail.com',
                                      textAlign: TextAlign.end,
                                      style: textTheme.bodySmall?.copyWith(
                                        color: AppColors.actionColor600,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            6.height,
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Phone Number',
                                      style: textTheme.bodySmall?.copyWith(
                                        color: AppColors.actionColor600,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '+938 283 8827',
                                      textAlign: TextAlign.end,
                                      style: textTheme.bodySmall?.copyWith(
                                        color: AppColors.actionColor600,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            (MediaQuery.sizeOf(context).height * 0.08).height,
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Price',
                                      style: textTheme.bodySmall?.copyWith(
                                        color: AppColors.actionColor600,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '\$85',
                                      textAlign: TextAlign.end,
                                      style: textTheme.bodySmall?.copyWith(
                                        color: AppColors.actionColor600,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            12.height,
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.8,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Total',
                                      style: textTheme.bodySmall?.copyWith(
                                        color: AppColors.actionColor600,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '\$85',
                                      textAlign: TextAlign.end,
                                      style: textTheme.bodySmall?.copyWith(
                                        color: AppColors.actionColor600,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  )
                ],
              ),*/
          );
        },
      ),
    );
  }
}
