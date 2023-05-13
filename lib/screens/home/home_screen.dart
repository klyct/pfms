import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:profinmovtser/firebase/firebase_DB.dart';
import 'package:profinmovtser/models/post_model.dart';
import 'package:profinmovtser/screens/profile/components/post_card.dart';
import 'package:profinmovtser/screens/profile/post_detail_page.dart';
import 'package:theme_provider/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PostFirebase _Post = PostFirebase();

  int selectedPostType = 0;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.background),
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          title: Text(
            '"Hi, ${user!.displayName}"',
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
                const SizedBox(height: 20),
                StreamBuilder(
                  stream: _Post.getAllPost(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Text(
                              snapshot.data!.docs[index].get('userName'));
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text('Error en la peticion, intente de nuevo'),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
/*ListView.separated(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
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
                    itemCount: dummyPosts.length) */