import 'package:flutter/material.dart';

class New extends StatefulWidget {
  const New({Key? key}) : super(key: key);

  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<New> {
  bool termsAccepted = true; // Pre-selected as shown in the image
  bool organisationExpanded = true; // Initially expanded
  bool factoryDetailsExpanded = false;
  bool productCapacityExpanded = false;
  bool financialInfoExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vendor Onboarding',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFFD84B2A), // Orange/red color from the image
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Organisation Section
                buildExpandableSection(
                  title: 'Organisation',
                  isExpanded: organisationExpanded,
                  onTap: () {
                    setState(() {
                      organisationExpanded = !organisationExpanded;
                    });
                  },
                  children: [
                    buildListTile(
                      title: 'Primary Info',
                      iconBackground: Colors.green,
                      icon: Icons.check,
                      iconColor: Colors.white,
                      showRightArrow: false,
                    ),
                    buildListTile(
                      title: 'Contact Info',
                      iconBackground: Color(0xFFF8D0BE), // Light orange background
                      icon: Icons.info_outline,
                      iconColor: Colors.black54,
                    ),
                    buildListTile(
                      title: 'Workplace & Workforce Info',
                      iconBackground: Color(0xFFF8D0BE),
                      icon: Icons.info_outline,
                      iconColor: Colors.black54,
                    ),
                    buildListTile(
                      title: 'Quality Assurance Info',
                      iconBackground: Color(0xFFF8D0BE),
                      icon: Icons.info_outline,
                      iconColor: Colors.black54,
                    ),
                    buildListTile(
                      title: 'Bank Details',
                      iconBackground: Color(0xFFF8D0BE),
                      icon: Icons.info_outline,
                      iconColor: Colors.black54,
                    ),
                    buildListTile(
                      title: 'Sub Vendors Details',
                      iconBackground: Color(0xFFF8D0BE),
                      icon: Icons.info_outline,
                      iconColor: Colors.black54,
                    ),
                    buildListTile(
                      title: 'Additional Information',
                      iconBackground: Color(0xFFF8D0BE),
                      icon: Icons.info_outline,
                      iconColor: Colors.black54,
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Factory Details Section
                buildExpandableSection(
                  title: 'Factory Details',
                  isExpanded: factoryDetailsExpanded,
                  onTap: () {
                    setState(() {
                      factoryDetailsExpanded = !factoryDetailsExpanded;
                    });
                  },
                  children: const [],
                ),
                
                const SizedBox(height: 16),
                
                // Product Capacity Section
                buildExpandableSection(
                  title: 'Product Capacity',
                  isExpanded: productCapacityExpanded,
                  onTap: () {
                    setState(() {
                      productCapacityExpanded = !productCapacityExpanded;
                    });
                  },
                  children: const [],
                ),
                
                const SizedBox(height: 16),
                
                // Financial Info Section
                buildExpandableSection(
                  title: 'Financial Info',
                  isExpanded: financialInfoExpanded,
                  onTap: () {
                    setState(() {
                      financialInfoExpanded = !financialInfoExpanded;
                    });
                  },
                  children: const [],
                ),
                
                const SizedBox(height: 24),
                
                // Terms & Conditions Checkbox
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Color(0xFFD84B2A),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: const Icon(
                        Icons.check,
                        size: 24,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFD84B2A),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Submit for Review',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildExpandableSection({
    required String title,
    required bool isExpanded,
    required VoidCallback onTap,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54,
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: Colors.black54,
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded) ...children,
        ],
      ),
    );
  }

  Widget buildListTile({
    required String title,
    required Color iconBackground,
    required IconData icon,
    required Color iconColor,
    bool showRightArrow = true,
  }) {
    return Column(
      children: [
        const Divider(height: 1, thickness: 1, color: Colors.black12),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          child: Row(
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: iconBackground,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: iconColor,
                  size: 18,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ),
              if (showRightArrow)
                const Icon(
                  Icons.chevron_right,
                  color: Colors.black45,
                ),
            ],
          ),
        ),
      ],
    );
  }
}