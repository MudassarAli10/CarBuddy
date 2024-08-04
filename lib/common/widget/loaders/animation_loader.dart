import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TAnimationLoadingWidget extends StatelessWidget {
  const TAnimationLoadingWidget(
      {super.key,
      required this.text,
      required this.animation,
      required this.showAction,
      this.actionText,
      this.onActionPressed});

  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * 0.5),
          const SizedBox(
            height: TSizes.defaultSpace,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: TSizes.defaultSpace,
          ),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    child: Text(actionText!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: TColors.light)),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
