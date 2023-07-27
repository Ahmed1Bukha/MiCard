import 'package:business_card/src/app.dart';
import 'package:business_card/src/common_widgets/snackbar.dart';
import 'package:business_card/src/constants/text_constants.dart';
import 'package:business_card/src/features/bottomsheet/bottom_sheet.dart';
import 'package:business_card/src/features/genetate_links/generate_links.dart';
import 'package:business_card/src/models_classes/cloud_store.dart';
import 'package:business_card/src/models_classes/shared.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../common_widgets/cards/type1_card.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  late List<dynamic> ids;
  List<Widget> addedCards = [];
  @override
  void initState() {
    getIds();
    super.initState();
  }

  void getIds() async {
    ids = await Shared().getIds();

    if (ids.whereType() == List<dynamic>) {
      return;
    }

    for (var id in ids) {
      Map<dynamic, dynamic> infoCards = await ColudStore().readCard(id);
      if (infoCards['cardType'] == 1) {
        addedCards.add(Type1Card(
            infoCards["fullName"],
            infoCards["jobTitle"],
            infoCards["email"],
            infoCards["web"],
            infoCards["phone"],
            infoCards["mobile"]));
      }
    }
    ids = await Shared().getIds();

    for (var id in ids) {
      Map<dynamic, dynamic> infoCards = await ColudStore().readCard(id);
      print(infoCards);
      if (infoCards['CardType'] == "1") {
        addedCards.add(Type1Card(
            infoCards["fullName"],
            infoCards["jobTitle"],
            infoCards["email"],
            infoCards["web"],
            infoCards["phone"],
            infoCards["mobile"]));
      }
      print(addedCards);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    Widget homeCard = ref.watch(userCard);
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.black,
        onPressed: () {
          context.go('/home/scan');
        },
        label: Text("Scan QR"),
        icon: const Icon(Icons.camera),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/BackGround.png"),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: const Icon(Icons.logout),
                  onTap: () async {
                    // await Auth().signOut();
                    context.go("/");
                  },
                ),
                Center(
                  child: Text(
                    "Home Page",
                    style: h1.copyWith(fontSize: 65),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Card(
                    elevation: 8,
                    child: QrImageView(
                      data: user!.uid,
                      version: QrVersions.auto,
                      size: 180,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text("Image"),
                          CircleAvatar(
                            child: GestureDetector(
                              onTap: () async {
                                await GenerateLinks().convertToImage(homeCard);
                                print("Clicked");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  MySnackBar().getSnackBar("Image saved"),
                                );
                              },
                              child: const Icon(Icons.image),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text("PDF"),
                          GestureDetector(
                            onTap: () async {
                              // await GenerateLinks().convertToPdf();
                              // there's not time to implement this shit sorry.
                              print("pdf done ");
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.document_scanner),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                homeCard
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy < 0) {
            showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return MyBottomSheet(addedCards);
                });
          }
        },
        onTap: () async {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return MyBottomSheet(addedCards);
              });
        },
        child: Container(
          padding: EdgeInsets.all(12),
          height: 70,
          color: Colors.teal,
          child: Column(
            children: [
              const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
              Text(
                'Show Cards',
                style: h4.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
