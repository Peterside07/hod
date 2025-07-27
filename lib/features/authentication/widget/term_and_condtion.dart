
import 'package:flutter/material.dart';

class TermAndCondition extends StatelessWidget {
  const TermAndCondition({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          children: [
            Text.rich(
              TextSpan(
                text: "By providing your email, you agree to our ",
                style: Theme.of(context).textTheme.bodySmall,
                children: [
                  TextSpan(
                    text: "privacy policy",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.blue,
                        ),
                  ),
                 const TextSpan(text: " and "),
                  TextSpan(
                    text: "Community Guidelines.",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.blue,
                        ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 2/9),

          ],
        ),
      ),
    );
  }
}
