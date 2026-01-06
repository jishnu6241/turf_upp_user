import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:turf_upp_user/common_widget/custom_button.dart';
import 'dart:async';

import 'package:turf_upp_user/screens/booking_success_page.dart';

class SlotPage extends StatefulWidget {
  final String turfName;
  final String location;

  const SlotPage({super.key, required this.turfName, required this.location});

  @override
  State<SlotPage> createState() => _SlotPageState();
}

class _SlotPageState extends State<SlotPage> {
  DateTime selectedDate = DateTime.now();
  late final PageController _pageController;
  int _currentPage = 0;
  Timer? _autoPlayTimer;

  final List<String> turfImages = [
    "https://images.unsplash.com/photo-1574629810360-7efbbe195018?w=800",
    "https://images.unsplash.com/photo-1529900748604-07564a03e7a6?w=800",
    "https://images.unsplash.com/photo-1551958219-acbc608c6377?w=800",
  ];

  final Map<String, Map<String, dynamic>> slots = {
    "6:00 - 7:00": {"status": "available", "price": "₹500"},
    "7:00 - 8:00": {"status": "booked", "price": "₹500"},
    "8:00 - 9:00": {"status": "blocked", "price": "₹500"},
    "9:00 - 10:00": {"status": "available", "price": "₹600"},
    "10:00 - 11:00": {"status": "available", "price": "₹600"},
    "16:00 - 17:00": {"status": "available", "price": "₹700"},
    "17:00 - 18:00": {"status": "available", "price": "₹800"},
    "18:00 - 19:00": {"status": "available", "price": "₹800"},
  };

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _autoPlayTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_currentPage + 1) % turfImages.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoPlayTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  /// THE BOTTOM SHEET REPLACING THE DIALOG
  void _showBookingBottomSheet(String time, String price) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Required for custom shape/glass
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handlebar for visual cues
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: const EdgeInsets.only(bottom: 24),
              ),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle_rounded,
                  color: Colors.green[400],
                  size: 48,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Confirm Booking",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 24),

              // Info Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white10),
                ),
                child: Column(
                  children: [
                    _buildDetailRow(
                      Icons.sports_soccer,
                      "Turf",
                      widget.turfName,
                    ),
                    const Divider(color: Colors.white12, height: 24),
                    _buildDetailRow(
                      Icons.calendar_today,
                      "Date",
                      DateFormat('EEEE, MMM dd').format(selectedDate),
                    ),
                    const Divider(color: Colors.white12, height: 24),
                    _buildDetailRow(
                      Icons.access_time_rounded,
                      "Time Slot",
                      time,
                    ),
                    const Divider(color: Colors.white12, height: 24),
                    _buildDetailRow(
                      Icons.payments_outlined,
                      "Total Price",
                      price,
                      isPrice: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.pop(context),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontFamily: 'Poppins',

                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[600],
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BookingSuccessPage(
                              turfName: widget.turfName,
                              location: widget.location,
                              date: selectedDate,
                              slot: time,
                              price: price,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "Confirm",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(
    IconData icon,
    String label,
    String value, {
    bool isPrice = false,
  }) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.green[400], size: 18),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(fontSize: 12, color: Colors.grey[400]),
            ),
            Text(
              value,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isPrice ? Colors.green[400] : Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: GestureDetector(
              child: Icon(Icons.arrow_back, color: Colors.white),
              onTap: () => Navigator.pop(context),
            ),
            expandedHeight: 240,
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: turfImages.length,
                    onPageChanged: (index) =>
                        setState(() => _currentPage = index),
                    itemBuilder: (context, index) =>
                        Image.network(turfImages[index], fit: BoxFit.cover),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black54,
                          Colors.transparent,
                          Colors.black87,
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 6,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        turfImages.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentPage == index ? 20 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.green
                                : Colors.white54,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.turfName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.white70,
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              widget.location,
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: 14,
                    itemBuilder: (context, index) {
                      final date = DateTime.now().add(Duration(days: index));
                      final isSelected = date.day == selectedDate.day;
                      return GestureDetector(
                        onTap: () => setState(() => selectedDate = date),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          width: 65,
                          margin: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.green[700]
                                : Colors.grey[900],
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: Colors.green.withOpacity(0.3),
                                      blurRadius: 10,
                                      offset: const Offset(0, 4),
                                    ),
                                  ]
                                : [],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                DateFormat('EEE').format(date).toUpperCase(),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: isSelected
                                      ? Colors.white70
                                      : Colors.grey[200],
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                date.day.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Select Time Slot",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: slots.length,
                  itemBuilder: (context, index) {
                    String time = slots.keys.elementAt(index);
                    var data = slots[time]!;
                    bool isAvailable = data["status"] == "available";
                    bool isBlocked = data["status"] == "blocked";
                    bool isBooked = data["status"] == "booked";

                    Color timeColor;
                    Color statusColor;
                    Color badgeColor;

                    if (isBlocked) {
                      timeColor = Colors.red[700]!; // Red for blocked
                      statusColor = Colors.red[700]!;
                      badgeColor = Colors.red[200]!;
                    } else if (isBooked) {
                      timeColor = Colors.amber; // Orange for booked
                      statusColor = Colors.orange;
                      badgeColor = Colors.amber[200]!;
                    } else {
                      timeColor = Colors.white;
                      statusColor = Colors.grey;
                      badgeColor = Colors.white;
                    }

                    return Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isAvailable
                              ? Colors.green.withOpacity(0.3)
                              : badgeColor,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            color: isAvailable ? Colors.green : timeColor,
                            size: 24,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              time,
                              style: TextStyle(
                                color: timeColor,
                                fontSize: 16,
                                fontFamily: 'Poppins',

                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          if (isAvailable) ...[
                            Text(
                              data["price"],
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.green,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(width: 12),

                            CustomButton(
                              onPressed: () =>
                                  _showBookingBottomSheet(time, data["price"]),
                              label: 'Book Now',
                              color: badgeColor,
                            ),
                          ] else
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: badgeColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                data["status"].toUpperCase(),
                                style: TextStyle(
                                  color: statusColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
