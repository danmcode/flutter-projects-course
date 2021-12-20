import 'package:fl_components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: const [
          ListTile(
            leading: Icon(
              Icons.photo_album_outlined,
              color: AppTheme.primary,
            ),
            title: Text('Soy un titulo'),
            subtitle: Text(
                'Et occaecat adipisicing consectetur in. Mollit aliquip pariatur cillum officia irure id deserunt sint duis veniam est mollit. Elit incididunt aliquip culpa ea non.'),
          )
        ],
      ),
    );
  }
}
