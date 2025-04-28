import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  bool _termsAccepted = true;
  bool _organisationExpanded = true;
  bool _factoryDetailsExpanded = false;
  bool _productCapacityExpanded = false;
  bool _financialInfoExpanded = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFD84727),
        title: const Text(
          'Vendor Onboarding',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {},
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _buildExpansionSection(
                title: 'Organisation',
                isExpanded: _organisationExpanded,
                onToggle: () {
                  setState(() {
                    _organisationExpanded = !_organisationExpanded;
                  });
                },
                children: [
                  _buildInfoItem(
                    title: 'Primary Info', 
                    icon: Icons.check_circle, 
                    iconColor: Colors.green,
                    showArrow: false,
                  ),
                  _buildInfoItem(
                    title: 'Contact Info', 
                    icon: Icons.info_outline,
                    iconColor: const Color(0xFFF9C4AB),
                  ),
                  _buildInfoItem(
                    title: 'Workplace & Workforce Info', 
                    icon: Icons.info_outline,
                    iconColor: const Color(0xFFF9C4AB),
                  ),
                  _buildInfoItem(
                    title: 'Quality Assurance Info',
                    icon: Icons.info_outline,
                    iconColor: const Color(0xFFF9C4AB),
                  ),
                  _buildInfoItem(
                    title: 'Bank Details',
                    icon: Icons.info_outline,
                    iconColor: const Color(0xFFF9C4AB),
                  ),
                  _buildInfoItem(
                    title: 'Sub Vendors Details',
                    icon: Icons.info_outline,
                    iconColor: const Color(0xFFF9C4AB),
                  ),
                  _buildInfoItem(
                    title: 'Additional Information',
                    icon: Icons.info_outline,
                    iconColor: const Color(0xFFF9C4AB),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildExpansionSection(
                title: 'Factory Details',
                isExpanded: _factoryDetailsExpanded,
                onToggle: () {
                  setState(() {
                    _factoryDetailsExpanded = !_factoryDetailsExpanded;
                  });
                },
                children: [],
              ),
              const SizedBox(height: 16),
              _buildExpansionSection(
                title: 'Product Capacity',
                isExpanded: _productCapacityExpanded,
                onToggle: () {
                  setState(() {
                    _productCapacityExpanded = !_productCapacityExpanded;
                  });
                },
                children: [],
              ),
              const SizedBox(height: 16),
              _buildExpansionSection(
                title: 'Financial Info',
                isExpanded: _financialInfoExpanded,
                onToggle: () {
                  setState(() {
                    _financialInfoExpanded = !_financialInfoExpanded;
                  });
                },
                children: [],
              ),
              const SizedBox(height: 16),
              _buildTermsAndConditions(),
              const SizedBox(height: 16),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpansionSection({
    required String title,
    required bool isExpanded,
    required VoidCallback onToggle,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: onToggle,
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
          if (isExpanded && children.isNotEmpty)
            Column(children: children),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required String title,
    required IconData icon,
    required Color iconColor,
    bool showArrow = true,
  }) {
    return Column(
      children: [
        const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: iconColor,
                ),
                child: Icon(
                  icon,
                  color: iconColor == Colors.green ? Colors.white : Colors.white70,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              if (showArrow)
                const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTermsAndConditions() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: const Color(0xFFD84727),
            borderRadius: BorderRadius.circular(2),
          ),
          child: Checkbox(
            value: _termsAccepted,
            onChanged: (value) {
              setState(() {
                _termsAccepted = value!;
              });
            },
            activeColor: Colors.transparent,
            checkColor: Colors.white,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            visualDensity: VisualDensity.compact,
            side: BorderSide.none,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Terms & Conditions',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD84727),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: const Text(
          'Submit for Review',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}