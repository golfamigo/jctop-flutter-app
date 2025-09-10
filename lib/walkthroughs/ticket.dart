import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/walkthrough/ticket1/ticket1_widget.dart';

// Focus widget keys for this walkthrough
final iconButtonTgk2jddb = GlobalKey();

/// ticket
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: iconButtonTgk2jddb,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            builder: (context, __) => Ticket1Widget(),
          ),
        ],
      ),
    ];
