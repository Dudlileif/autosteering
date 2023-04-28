import 'package:flutter/material.dart';

/// A small OpenStreetMap contribution widget, to use in corner of the map.
class OSMContribution extends StatelessWidget {
  const OSMContribution({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '© ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: 'OpenStreetMap',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                // recognizer: TapGestureRecognizer()
                //   ..onTap = () async {
                //     final url =
                //         Uri.parse('https://www.openstreetmap.org/copyright');
                //     if (await canLaunchUrl(url)) {
                //       await launchUrl(url);
                //     }
                //   },
              ),
              TextSpan(
                text: ' contributors',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
