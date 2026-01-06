import 'package:flutter/material.dart';
import 'package:turf_upp_user/common_widget/custom_text_form_field.dart';
import 'package:turf_upp_user/common_widget/turf_card.dart';
import 'package:turf_upp_user/screens/slot_page.dart';
import 'package:turf_upp_user/theme/app_theme.dart';

class TurfListPage extends StatefulWidget {
  const TurfListPage({super.key});

  static const List<Map<String, String>> turfs = [
    {
      "name": "Kannur Turf Arena",
      "location": "Kannur Town",
      "images": "assets/images/turf1.jpg",
    },
    {
      "name": "Goal Zone Turf",
      "location": "Thazhe Chovva, Kannur",
      "images": "assets/images/turf1.jpg",
    },
    {
      "name": "Malabar Sports Turf",
      "location": "Talap, Kannur",
      "images": "assets/images/turf1.jpg",
    },
    {
      "name": "KickOff Football Turf",
      "location": "Pallikunnu, Kannur",
      "images": "assets/images/turf1.jpg",
    },
    {
      "name": "ProKick Arena",
      "location": "Dharmadam Road, Kannur",
      "images": "assets/images/turf1.jpg",
    },
    {
      "name": "Elite Play Turf",
      "location": "Ancharakandi, Kannur",
      "images": "assets/images/turf1.jpg",
    },
    {
      "name": "Coastal Sports Turf",
      "location": "Azhikkode Beach Side, Kannur",
      "images": "assets/images/turf1.jpg",
    },
    {
      "name": "Victory Football Arena",
      "location": "Iritty Road, Kannur",
      "images": "assets/images/turf1.jpg",
    },
    {
      "name": "Northern Star Turf",
      "location": "Muzhappilangad, Kannur",
      "images": "assets/images/turf1.jpg",
    },
    {
      "name": "Unity Turf Ground",
      "location": "Mayyil, Kannur",
      "images": "assets/images/turf1.jpg",
    },
  ];

  @override
  State<TurfListPage> createState() => _HomePageState();
}

class _HomePageState extends State<TurfListPage> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  Future<void> _openSlotPage(Map<String, String> turf) async {
    // Close keyboard before navigation
    FocusScope.of(context).unfocus();

    await Future.delayed(const Duration(milliseconds: 100));

    // Navigate
    if (mounted) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              SlotPage(turfName: turf["name"]!, location: turf["location"]!),
        ),
      );

      // Close keyboard again when coming back
      if (mounted) {
        FocusScope.of(context).unfocus();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                // APP BAR
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: Colors.black,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "TurfUpp",
                        style: TextStyle(
                          height: 1,
                          color: secondaryColor,
                          fontSize: 26,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        "Chase the Goal",
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.2,
                          color: Colors.grey[600],
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  centerTitle: false,
                ),

                // SEARCH
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: CustomTextFormField(
                      controller: searchController,
                      labelText: "Search turf...",
                      prefixImagePath: "assets/icons/search.png",
                      focusNode: searchFocusNode,
                      isLoading: false,
                    ),
                  ),
                ),

                // TURF LIST
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final turf = TurfListPage.turfs[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TurfCard(
                          turf: turf,
                          ontap: () {
                            _openSlotPage(turf);
                          },
                        ),
                      );
                    }, childCount: TurfListPage.turfs.length),
                  ),
                ),

                // Bottom spacing
                const SliverToBoxAdapter(child: SizedBox(height: 90)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
