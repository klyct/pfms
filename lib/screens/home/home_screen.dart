import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:profinmovtser/models/post_model.dart';
import 'package:profinmovtser/models/story_model.dart';
import 'package:profinmovtser/screens/home/components/my_story_upload_card.dart';
import 'package:profinmovtser/screens/home/components/story_card.dart';
import 'package:profinmovtser/screens/profile/components/post_card.dart';
import 'package:profinmovtser/screens/profile/components/post_type_chips.dart';
import 'package:profinmovtser/screens/profile/post_detail_page.dart';
import 'package:profinmovtser/utils/post_type.dart';
import 'package:theme_provider/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPostType = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.background),
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          title: Text(
            'Hi Lorena',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 18,
            ),
          ),
          actions: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Theme.of(context).colorScheme.secondary,
                            Theme.of(context).primaryColor,
                          ])),
                  child: CycleThemeIconButton(),
                )),
            Padding(
              padding: const EdgeInsets.all(14.0),
            ),
          ],
        ),
        body: AnimationLimiter(
          child: ListView(
            children: AnimationConfiguration.toStaggeredList(
              duration: const Duration(milliseconds: 375),
              childAnimationBuilder: (widget) => SlideAnimation(
                horizontalOffset: MediaQuery.of(context).size.width / 2,
                child: FadeInAnimation(child: widget),
              ),
              children: [
                const SizedBox(height: 10),
                //Story Card
                SizedBox(
                  height: 80,
                  child: ListView.separated(
                      itemCount: dummyStories.length + 1,
                      padding: const EdgeInsets.only(left: 24),
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: 10),
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return const StoryUploadCard();
                        }
                        Story stories = dummyStories[index - 1];
                        return StoryCard(
                          story: stories,
                        );
                      }),
                ),

                const SizedBox(height: 20),
                ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return PostCard(
                        post: dummyPosts[index],
                        onTap: () {
                          Get.to(() => PostDetailPage(
                                post: dummyPosts[index],
                              ));
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10),
                    itemCount: dummyPosts.length)
              ],
            ),
          ),
        ));
  }
}
