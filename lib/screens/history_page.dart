import 'package:flutter/material.dart';
import 'package:turf_upp_user/theme/app_theme.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  String selectedFilter = 'All';

  // Sample booking data
  final List<Map<String, dynamic>> bookings = [
    {
      "id": "BK001",
      "turfName": "Kannur Turf Arena",
      "location": "Kannur Town",
      "date": "2026-01-05",
      "timeSlot": "6:00 PM - 7:00 PM",
      "amount": 800,
      "status": "completed",
    },
    {
      "id": "BK002",
      "turfName": "Goal Zone Turf",
      "location": "Thazhe Chovva, Kannur",
      "date": "2026-01-08",
      "timeSlot": "7:00 PM - 8:00 PM",
      "amount": 1000,
      "status": "upcoming",
    },
    {
      "id": "BK003",
      "turfName": "Malabar Sports Turf",
      "location": "Talap, Kannur",
      "date": "2025-12-28",
      "timeSlot": "5:00 PM - 6:00 PM",
      "amount": 900,
      "status": "completed",
    },
    {
      "id": "BK004",
      "turfName": "KickOff Football Turf",
      "location": "Pallikunnu, Kannur",
      "date": "2025-12-20",
      "timeSlot": "8:00 PM - 9:00 PM",
      "amount": 850,
      "status": "cancelled",
    },
  ];

  List<Map<String, dynamic>> get filteredBookings {
    if (selectedFilter == 'All') return bookings;
    return bookings
        .where((booking) => booking['status'] == selectedFilter.toLowerCase())
        .toList();
  }

  Color getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'upcoming':
        return secondaryColor;
      case 'cancelled':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  IconData getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Icons.check_circle;
      case 'upcoming':
        return Icons.schedule;
      case 'cancelled':
        return Icons.cancel;
      default:
        return Icons.info;
    }
  }

  // Build header section
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            "Booking History",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Track your turf bookings",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  // Build filter chips section
  Widget _buildFilterChips() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = 'All';
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: selectedFilter == 'All'
                    ? secondaryColor
                    : Colors.grey[900],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selectedFilter == 'All'
                      ? secondaryColor
                      : Colors.grey[800]!,
                ),
              ),
              child: Center(
                child: Text(
                  'All',
                  style: TextStyle(
                    color: selectedFilter == 'All'
                        ? Colors.black
                        : Colors.white,
                    fontWeight: selectedFilter == 'All'
                        ? FontWeight.w500
                        : FontWeight.normal,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = 'Upcoming';
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: selectedFilter == 'Upcoming'
                    ? secondaryColor
                    : Colors.grey[900],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selectedFilter == 'Upcoming'
                      ? secondaryColor
                      : Colors.grey[800]!,
                ),
              ),
              child: Center(
                child: Text(
                  'Upcoming',
                  style: TextStyle(
                    color: selectedFilter == 'Upcoming'
                        ? Colors.black
                        : Colors.white,
                    fontWeight: selectedFilter == 'Upcoming'
                        ? FontWeight.w500
                        : FontWeight.normal,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = 'Completed';
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: selectedFilter == 'Completed'
                    ? secondaryColor
                    : Colors.grey[900],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selectedFilter == 'Completed'
                      ? secondaryColor
                      : Colors.grey[800]!,
                ),
              ),
              child: Center(
                child: Text(
                  'Completed',
                  style: TextStyle(
                    color: selectedFilter == 'Completed'
                        ? Colors.black
                        : Colors.white,
                    fontWeight: selectedFilter == 'Completed'
                        ? FontWeight.w500
                        : FontWeight.normal,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedFilter = 'Cancelled';
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: selectedFilter == 'Cancelled'
                    ? secondaryColor
                    : Colors.grey[900],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: selectedFilter == 'Cancelled'
                      ? secondaryColor
                      : Colors.grey[800]!,
                ),
              ),
              child: Center(
                child: Text(
                  'Cancelled',
                  style: TextStyle(
                    color: selectedFilter == 'Cancelled'
                        ? Colors.black
                        : Colors.white,
                    fontWeight: selectedFilter == 'Cancelled'
                        ? FontWeight.w500
                        : FontWeight.normal,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Build empty state
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history, size: 80, color: Colors.grey[700]),
          const SizedBox(height: 16),
          Text(
            'No ${selectedFilter == 'All' ? '' : selectedFilter.toLowerCase()} bookings',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Your booking history will appear here',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 14,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  // Build booking card
  Widget _buildBookingCard(Map<String, dynamic> booking) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[800]!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Badge and Turf Name Row
            Row(
              children: [
                Expanded(
                  child: Text(
                    booking['turfName'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: getStatusColor(booking['status']).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: getStatusColor(booking['status']),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        getStatusIcon(booking['status']),
                        size: 16,
                        color: getStatusColor(booking['status']),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        booking['status'].toUpperCase(),
                        style: TextStyle(
                          color: getStatusColor(booking['status']),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Location
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.grey[500]),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    booking['location'],
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Date, Time, ID, and Amount Row
            Row(
              children: [
                // Date and Time
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 14,
                            color: Colors.grey[500],
                          ),
                          const SizedBox(width: 6),
                          Text(
                            booking['date'],
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 13,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: Colors.grey[500],
                          ),
                          const SizedBox(width: 6),
                          Text(
                            booking['timeSlot'],
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 13,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Booking ID and Amount
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.confirmation_number,
                            size: 14,
                            color: Colors.grey[500],
                          ),
                          const SizedBox(width: 6),
                          Text(
                            booking['id'],
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 13,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: secondaryColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: secondaryColor, width: 1),
                        ),
                        child: Text(
                          '₹${booking['amount']}',
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filtered = filteredBookings;

    return SafeArea(
      child: Container(
        color: Colors.black,
        child: filtered.isEmpty
            ? Column(
                children: [
                  _buildHeader(),
                  _buildFilterChips(),
                  const SizedBox(height: 16),
                  Expanded(child: _buildEmptyState()),
                ],
              )
            : ListView.builder(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
                itemCount:
                    filtered.length + 2, // +2 for header and filter chips
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return _buildHeader();
                  } else if (index == 1) {
                    return Column(
                      children: [
                        _buildFilterChips(),
                        const SizedBox(height: 16),
                      ],
                    );
                  } else {
                    final bookingIndex = index - 2;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _buildBookingCard(filtered[bookingIndex]),
                    );
                  }
                },
              ),
      ),
    );
  }
}
