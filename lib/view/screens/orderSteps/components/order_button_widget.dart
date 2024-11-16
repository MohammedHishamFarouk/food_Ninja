import 'package:flutter/material.dart';

class OrderButtonWidget extends StatelessWidget {
  const OrderButtonWidget({
    super.key,
    this.editMode = false,
    required this.text,
    required this.hintTitle,
    required this.image,
    required this.imageScale,
  });
  final bool editMode;
  final String text, hintTitle, image;
  final double imageScale;

  @override
  Widget build(BuildContext context) {
    //ToDo change color
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: FilledButton(
        onPressed: () {},
        style: FilledButton.styleFrom(
          minimumSize: const Size(double.infinity, 80),
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(
            top: editMode ? 14 : 30,
            bottom: 20,
            left: 14,
            right: 18,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (editMode)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    hintTitle,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      textStyle:
                          const TextStyle(decoration: TextDecoration.none),
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerRight,
                      overlayColor: Colors.transparent,
                    ),
                    child: const Text('Edit'),
                  ),
                ],
              ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: SizedBox(
                      child: Image(
                        image: ExactAssetImage(image, scale: imageScale),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      text,
                      style: const TextStyle(
                        fontSize: 15.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
