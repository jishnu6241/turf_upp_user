import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class BookingSuccessPage extends StatefulWidget {
  final String turfName;
  final String location;
  final DateTime date;
  final String slot;
  final String price;

  const BookingSuccessPage({
    super.key,
    required this.turfName,
    required this.location,
    required this.date,
    required this.slot,
    required this.price,
  });

  @override
  State<BookingSuccessPage> createState() => _BookingSuccessPageState();
}

class _BookingSuccessPageState extends State<BookingSuccessPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late String bookingId;

  @override
  void initState() {
    super.initState();

    bookingId =
        'TRF${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}${Random().nextInt(100)}';

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inviteText =
        '''
⚽ Turf Booking Confirmed!

📍 Turf: ${widget.turfName}
📍 Location: ${widget.location}
📅 Date: ${DateFormat('dd MMM yyyy').format(widget.date)}
⏰ Time: ${widget.slot}
💰 Amount: ${widget.price}

🆔 Booking ID: $bookingId
''';

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40),
              decoration: const BoxDecoration(color: Colors.green),
              child: Column(
                children: const [
                  Icon(Icons.check_circle, color: Colors.white, size: 72),
                  SizedBox(height: 16),
                  Text(
                    "Booking Confirmed",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Your turf is reserved",
                    style: TextStyle(color: Colors.white70),
                  ),
                ],
              ),
            ),

            /// BOOKING CARD WITH INTEGRATED BUTTONS
            ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// TURF INFO
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.sports_soccer,
                            color: Colors.green,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.turfName,
                                style: const TextStyle(
                                  color: Colors.white,

                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 14,
                                    color: Colors.green,
                                  ),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      widget.location,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                    const Divider(thickness: 0.2),
                    const SizedBox(height: 16),

                    /// DATE
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, color: Colors.green),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Date",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              DateFormat(
                                'EEEE, dd MMM yyyy',
                              ).format(widget.date),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,

                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// TIME
                    Row(
                      children: [
                        const Icon(Icons.access_time, color: Colors.green),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Time Slot",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              widget.slot,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    /// PRICE
                    Row(
                      children: [
                        const Icon(Icons.currency_rupee, color: Colors.green),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Amount Paid",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              widget.price,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    /// BOOKING ID
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.confirmation_number,
                            color: Colors.green,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Booking ID",
                                style: TextStyle(color: Colors.grey),
                              ),
                              Text(
                                bookingId,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),
                    const Divider(thickness: 0.2),
                    const SizedBox(height: 20),

                    /// ACTION BUTTONS (INTEGRATED)
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton.icon(
                        onPressed: () => Share.share(inviteText),
                        icon: const Icon(Icons.share),
                        label: const Text("Share Invitation"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        icon: Image(
                          color: Colors.green,
                          height: 20,
                          image: AssetImage('assets/icons/home.png'),
                        ),
                        label: const Text("Back to Home"),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.green,
                          side: const BorderSide(
                            color: Colors.white,
                            width: 0.5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Add some bottom padding for better spacing
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
