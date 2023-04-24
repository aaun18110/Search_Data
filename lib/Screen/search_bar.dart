// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_bar/Provider/search_provider.dart';

class SeacrhData extends StatefulWidget {
  const SeacrhData({super.key});

  @override
  State<SeacrhData> createState() => _SeacrhDataState();
}

class _SeacrhDataState extends State<SeacrhData> {
  TextEditingController searchController = TextEditingController();
  // String search = "";

  @override
  Widget build(BuildContext context) {
    print("build");
    // final searchProviders = Provider.of<SearchProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Search Data"),
      ),
      body: Column(
        children: [
          Consumer<SearchProvider>(builder: (context, value, child) {
            return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: TextFormField(
                  controller: searchController,
                  decoration: InputDecoration(
                      labelText: "Search",
                      hintText: "  Search here....",
                      suffixIcon: const Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                          borderSide: const BorderSide(color: Colors.black))),
                  onChanged: (val) {
                    print("onChanges");
                    value.getValue(val);
                  },
                ));
          }),
          Consumer<SearchProvider>(builder: (context, value, child) {
            return Expanded(
              child: ListView.builder(
                itemCount: 100,
                itemBuilder: (BuildContext context, int index) {
                  final String position = index.toString();
                  if (searchController.text.isEmpty) {
                    return ListTile(
                      title: Text("Jhon Wick $index"),
                      subtitle: const Text("Hi! Welcome to Jhon Wick World"),
                      leading: const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage("images/img.jpg")),
                    );
                  } else if (position
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase())) {
                    return ListTile(
                      title: RichText(
                          text: TextSpan(
                              text: "Jhon Wick ",
                              style: DefaultTextStyle.of(context).style,
                              children: [
                            TextSpan(
                                text: index.toString(),
                                style: const TextStyle(color: Colors.red))
                          ])),
                      subtitle: const Text("Hi! Welcome to Jhon Wick World"),
                      leading: const CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage("images/img.jpg")),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            );
          })
        ],
      ),
    );
  }
}
