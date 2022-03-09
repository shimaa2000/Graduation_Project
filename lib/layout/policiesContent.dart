import 'package:flutter/material.dart';
import 'package:graduation_project/layout/policyField.dart';
import 'package:graduation_project/shared/boxtextfield.dart';

class PoliciesContent extends StatelessWidget {
  const PoliciesContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PoliciesText(
            hint:
                '''Your agreement with us includes these Terms and our Privacy Policy. 
You acknowledge that you have read and understood Agreements, and agree to be bound of them.
If you do not agree with them, then you may not use the Service.'''),
        PoliciesText(
            hint:
                '''• Our service allows you to post you clothes as a post, you are responsible for content you post or through service's legality.
You also can rent item, favourite or rate it, in addition to follow and chat owners.'''),
        PoliciesText(
            hint:
                '''• Half of the amount is paid online and the rest upon receipt.'''),
        PoliciesText(
            hint:
                '• Delivery by a shipping company, which in turn checks the validity of the product upon receipt and upon delivery.'),
        PoliciesText(
            hint:
                '• You can display your bracelets for rent, sale, or even donate at a lower price You can also rent clothes from other people'),
        PoliciesText(
            hint:
                '''• When you do not receive after ordering or do not deliver the displayed product if you are the owner, in these cases you will not be able to use the app again.'''),
        PoliciesText(
          hint:
              '• In the event that the product is damaged, the tenant will have to pay compensation to the owner.',
        ),
        PoliciesText(
            hint:
                '• The money is delivered to the owner after the rental process is completed.'),
      ],
    );
  }
}

