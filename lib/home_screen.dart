import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  bool inProgress = false;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _first = TextEditingController();
  final TextEditingController _last = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  GlobalKey<FormState> _formState = GlobalKey<FormState>();

  Future postResponse() async {
    Response response = await post(
      Uri.parse("https://task.teamrabbil.com/api/v1/registration"),
      headers: {'Content-type': 'application/json'},
      body: jsonEncode(
        {
          "email": _email.text.trim(),
          "firstName": _first.text.trim(),
          "lastName": _last.text.trim(),
          "mobile": _phone.text.trim(),
          "password": _pass.text.trim(),
          "photo": ""
        },
      ),
    );

    print(response.statusCode);
  }

  // void addProduct() async {
  //   inProgress = true;
  //   setState(() {});
  //   Response response = await post(
  //     Uri.parse("https://task.teamrabbil.com/api/v1/registration"),
  //     headers: {'Content-type': 'application/json'},
  //     body: jsonEncode(
  //       {
  //         "email": _email.text.trim(),
  //         "firstName": _first.text.trim(),
  //         "lastName": _last.text.trim(),
  //         "mobile": _phone.text.trim(),
  //         "password": _pass.text.trim(),
  //         "photo": ""
  //       },
  //     ),
  //   );
  //   inProgress = false;
  //   setState(() {});
  //   if (response.statusCode == 200) {
  //     final decodeBody = jsonDecode(response.body);
  //     if (decodeBody['status'] == 'success') {
  //       if (mounted) {
  //         _email.clear();
  //         _first.clear();
  //         _last.clear();
  //         _phone.clear();
  //         _pass.clear();

  //         ScaffoldMessenger.of(context)
  //             .showSnackBar(SnackBar(content: Text("Registration success!!")));
  //       }
  //       print(decodeBody);
  //     } else {
  //       if (mounted) {
  //         ScaffoldMessenger.of(context)
  //             .showSnackBar(SnackBar(content: Text("Registration faild")));
  //       }
  //     }
  //   }
  // }

  final size = SizedBox(
    height: 10,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formState,
          child: Column(
            children: [
              TextFormField(
                controller: _email,
                decoration: InputDecoration(hintText: "email"),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter Your Product Name";
                  }
                  return null;
                },
              ),
              size,
              TextFormField(
                controller: _first,
                decoration: InputDecoration(hintText: "first"),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter Your Product Code";
                  }
                  return null;
                },
              ),
              size,
              TextFormField(
                controller: _last,
                decoration: InputDecoration(hintText: "last"),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter Your Product Price";
                  }
                  return null;
                },
              ),
              size,
              TextFormField(
                controller: _phone,
                decoration: InputDecoration(hintText: "phone"),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter Your Product Quantity";
                  }
                  return null;
                },
              ),
              size,
              TextFormField(
                controller: _pass,
                decoration: InputDecoration(hintText: "pass"),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter Total Price";
                  }
                  return null;
                },
              ),
              size,
              size,
              SizedBox(
                  width: double.infinity,
                  child: inProgress
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: () async {
                            if (!_formState.currentState!.validate()) {
                              return;
                            }
                            postResponse();
                          },
                          child: Text("Registration"))),
            ],
          ),
        ),
      ),
    );
  }
}
