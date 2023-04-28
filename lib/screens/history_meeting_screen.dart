import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zoom_app/resources/firestore_methods.dart';
import 'package:intl/intl.dart';


class HistoryMeetingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestoremethods().meetingsHistory,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount:(snapshot.data! as dynamic).docs.length ,
          itemBuilder: (context, index)=>  ListTile( title:
            Text('room name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}'),
          subtitle: Text(
            'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdAt'].toDate())}',
          ),
),
            
        );
      },
    );
  }
}
