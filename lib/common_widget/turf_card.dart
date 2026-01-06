import 'package:flutter/material.dart';

class TurfCard extends StatelessWidget {
  const TurfCard({super.key, required this.turf, required this.ontap});

  final Map<String, String> turf;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.grey[900]!, Colors.black],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.25),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // IMAGE HEADER WITH GRADIENT OVERLAY
          Stack(
            children: [
              Image.asset(
                turf["images"]!,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                height: 160,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
                    stops: const [0.5, 1.0],
                  ),
                ),
              ),

              // FAVORITE BUTTON
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  onPressed: () {
                    // Add your favorite logic here
                  },
                  icon: const Icon(Icons.favorite_border),
                  color: Colors.white,
                  iconSize: 24,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.all(8),
                  ),
                ),
              ),
            ],
          ),

          // DETAILS SECTION
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // TURF NAME
                Text(
                  turf["name"]!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    letterSpacing: 0.3,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),

                // LOCATION ROW
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(
                        Icons.location_on,
                        size: 14,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        turf["location"]!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins',
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // FEATURES CHIPS
                Wrap(
                  spacing: 10,
                  runSpacing: 8,
                  children: const [
                    TurfFeatureChip(
                      icon: Icons.grass,
                      label: "Artificial Grass",
                    ),
                    TurfFeatureChip(
                      icon: Icons.light_mode,
                      label: "Floodlights",
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // BOOK NOW BUTTON
                InkWell(
                  onTap: ontap,
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green[600]!, Colors.green[500]!],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TurfFeatureChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const TurfFeatureChip({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.green[200]!, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: Colors.green[400]),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: Colors.green[400],
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
