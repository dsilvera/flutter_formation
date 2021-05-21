import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/recipeBox.dart';

import 'recipe.dart';

class RecipeFormScreen extends StatefulWidget {
  @override
  _RecipeFormScreenState createState() => _RecipeFormScreenState();
}

class _RecipeFormScreenState extends State<RecipeFormScreen> {
  static const String IMAGE_URL = "https://image.jimcdn.com/app/cms/image/transf/dimension=1000x10000:format=png/path/s2438491d518fdaa9/image/i3add59b945903421/version/1553695597/image.png";
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final userController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    userController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nouvelle recette"),
      ),
      body: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 5,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  controller: userController,
                  decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0)))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter an username';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(height: 8.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      Recipe recipe = Recipe(
                          titleController.value.text,
                          userController.value.text,
                          IMAGE_URL,
                          descriptionController.value.text,
                          false,
                          new Random().nextInt(100));

                      RecipeBox.box?.put(recipe.key(), recipe);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Save'),
                ),
              )
            ],
          )),
    );
  }
}
