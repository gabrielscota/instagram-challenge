import 'package:flutter/material.dart';

import '../../../../domain/entities/entities.dart';

class Storie extends StatelessWidget {
  final StorieEntity storieEntity;
  final bool isFirst;

  const Storie({required this.storieEntity, required this.isFirst});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.0),
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.orange,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32.0),
            ),
            padding: const EdgeInsets.all(2.0),
            child: CircleAvatar(
              child: Image.asset(storieEntity.user.avatar),
              radius: 28,
            ),
          ),
        ),
        Container(
          width: 64,
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(
            (isFirst ? 'Seu story' : storieEntity.user.username),
            style: Theme.of(context).textTheme.caption?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).primaryColor,
                ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
