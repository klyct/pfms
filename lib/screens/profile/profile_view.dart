import 'package:profinmovtser/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:profinmovtser/screens/profile/components/custom_icons.dart';
import 'package:profinmovtser/screens/profile/components/post_type_chips.dart';
import 'package:profinmovtser/utils/assets.dart';
import 'package:profinmovtser/utils/post_type.dart';

import 'components/post_card.dart';
import 'components/profile_card.dart';
import 'post_detail_page.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  int selectedPostType = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text("Profile",
            style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).colorScheme.onBackground)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomIcons(src: CustomAssets.kChat),
          )
        ],
      ),
      body: AnimationLimiter(
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: MediaQuery.of(context).size.width / 2,
                      child: FadeInAnimation(child: widget),
                    ),
                children: [
                  const SizedBox(height: 10),
                  const ProfileCard(),
                  const SizedBox(height: 20),
                  ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return PostCard(
                            onTap: () {
                              Get.to(() =>
                                  PostDetailPage(post: dummyPosts[index]));
                            },
                            post: dummyPosts[index]);
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10),
                      itemCount: dummyPosts.length)
                ])),
      ),
    );
  }
}
