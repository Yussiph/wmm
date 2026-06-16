
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class AddRecord extends StatefulWidget {
  const AddRecord({super.key});


  @override
  AddRecordState createState() => AddRecordState();
  }

class AddRecordState extends State<AddRecord> {

  final _formKey = GlobalKey<FormState>();
  final _amount = TextEditingController();

  @override
    Widget build(BuildContext context) {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            // double amount, String? note, type (income, expense), categories
            TextFormField(
              controller: _amount,
            )
          ],
        ),
      );
    }
  }
