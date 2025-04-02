import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_using_clean_architecture/ui_design_second/presentation/provider/mobile_number_provider.dart';

class DialogueWidget extends ConsumerWidget {
  const DialogueWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mobileNumberFromProvider =
        ref.watch(mobileNumberProvider).mobileNumber;
    return SimpleDialog(
      backgroundColor: Colors.white,

      title: Column(
        children: [
          Row(
            children: [
              Spacer(),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },

                child: Icon(Icons.close),
              ),
            ],
          ),
          Image(image: AssetImage('assets/dialogue_image1.png')),
          Text(
            "Verify your phone number before we send code",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Is this correct?",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                mobileNumberFromProvider,
                style: Theme.of(
                  context,
                ).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
      children: [
        SimpleDialogOption(
          child: Container(
            height: 60,
            width: 40,
            decoration: BoxDecoration(
              color: Color(0xFF304FFE),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: Text("Yes", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
        SimpleDialogOption(
          child: Container(
            height: 60,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xFF304FFE)),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: Text("NO", style: TextStyle(color: Color(0xFF304FFE))),
            ),
          ),
        ),
      ],
    );
  }
}
