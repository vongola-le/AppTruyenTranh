import 'package:flutter/material.dart';
import '../models/User.dart';

class ItemRanking extends StatefulWidget {
  ItemRanking({super.key, required this.user});
  User user;
  @override
  State<ItemRanking> createState() => _ItemRankingState();
}

class _ItemRankingState extends State<ItemRanking> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // Rank
        leading: Text(
          widget.user.id.toString(),
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),

        //Imng
        title: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade200,
                backgroundImage:
                    AssetImage(widget.user.imageUrl),
              ),

              // Username
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(widget.user.name),
              ),
            ],
          ),
        ),

        // Points
        trailing: Text(
          widget.user.score.toString(),
        ),
      ),
    );
  }
}
