import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:soccer_mobile_app/Provider/home_provider.dart';
import 'package:soccer_mobile_app/config/routes/app_navigation.dart';
import 'package:soccer_mobile_app/config/theme/app_colors.dart';
import 'package:soccer_mobile_app/core/components/app_bar.dart';
import 'package:soccer_mobile_app/core/components/custom_svg.dart';
import 'package:soccer_mobile_app/core/constants/app_constant.dart';

class StudentRequests extends StatefulWidget {
  final arguments;
  const StudentRequests({super.key, this.arguments});

  @override
  State<StudentRequests> createState() => _StudentRequestsState();
}

class _StudentRequestsState extends State<StudentRequests> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      Provider.of<HomeProvider>(context, listen: false).fetchSessionsParticipants(id: widget.arguments['sId']);
    });
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.actionColor600,
      appBar: CommonAppBar(
        title: 'Soccer',
        isProfile: true,
        onLeftPressed: () {
          AppNavigation.goBack();
        },
        onRightPressed: () {},
      ),
      body: Consumer<HomeProvider>(builder: (x, homeProvider, y) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 23),
              child: Text(
                'Student Requests',
                style: textTheme.headlineSmall?.copyWith(color: AppColors.secondaryColor150),
              ),
            ),
            Expanded(
              child: homeProvider.participantsModel.pendingParticipantsDetails?.isNotEmpty != null
                  ? ListView.builder(
                      itemCount: homeProvider.participantsModel.pendingParticipantsDetails?.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppColors.secondaryColor450, // Same as android:fillColor
                              borderRadius: BorderRadius.circular(24), // Approximating corner rounding
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                              leading: Container(
                                clipBehavior: Clip.antiAlias,
                                decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                                width: 50,
                                child: CachedNetworkImage(
                                  imageUrl: homeProvider.participantsModel.pendingParticipantsDetails![index].profilePicture ?? "",
                                  fit: BoxFit.fill,
                                  height: 100,
                                  placeholder: (context, url) => const LinearProgressIndicator(color: AppColors.neutralColor400),
                                  errorWidget: (context, url, error) => const Icon(
                                    Icons.hide_image_outlined,
                                    color: AppColors.neutralColor500,
                                  ),
                                ),
                              ),
                              title: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                child: Text(
                                  "${homeProvider.participantsModel.pendingParticipantsDetails![index].firstName ?? " "}"
                                  " ${homeProvider.participantsModel.pendingParticipantsDetails![index].lastName ?? " "}",
                                  maxLines: 2,
                                  softWrap: true,
                                  style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600, color: AppColors.secondaryColor25),
                                ),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Map<String, dynamic> map = {};
                                      map['sessionId'] = widget.arguments['sId'];
                                      map['userId'] = homeProvider.participantsModel.pendingParticipantsDetails![index].sId;
                                      homeProvider.acceptParticipant(map);
                                    },
                                    child: const SvgAsset(
                                      svgName: "${AppConstant.assetImages}check.svg",
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  InkWell(
                                    onTap: () {
                                      Map<String, dynamic> map = {};
                                      map['sessionId'] = widget.arguments['sId'];
                                      map['userId'] = homeProvider.participantsModel.pendingParticipantsDetails![index].sId;
                                      homeProvider.rejectParticipant(map);
                                    },
                                    child: const SvgAsset(
                                      svgName: "${AppConstant.assetImages}cross.svg",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'No Session Found',
                        style: textTheme.headlineSmall?.copyWith(color: AppColors.secondaryColor150),
                      ),
                    ),
            )
          ],
        );
      }),
    );
  }
}
