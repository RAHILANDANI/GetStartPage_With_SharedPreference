import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stepperwithmap/provider/counter_provider.dart';
import 'package:stepperwithmap/provider/theme_provider.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  void initState() {
    super.initState();
    data();
    Provider.of<themeprovider>(context).themeeee.isdark = fetchTheme;
  }

  bool fetchTheme = false;

  data() async {
    SharedPreferences res = await SharedPreferences.getInstance();

    fetchTheme = res.getBool('isdark')!;
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<themeprovider>(context);
    var providerFalse = Provider.of<themeprovider>(context, listen: false);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Provider.of<counterprovider>(context, listen: false).increament();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              Provider.of<counterprovider>(context, listen: false).decreament();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      appBar: AppBar(
        leading: const Icon(
          Icons.access_time_outlined,
          color: Colors.black,
        ),
        title: const Center(child: Text("Counter")),
        actions: [
          InkWell(
              onTap: () async {
                SharedPreferences pref = await SharedPreferences.getInstance();
                providerFalse.changeTheme();
                pref.setBool('isdark', providerFalse.themeeee.isdark);
              },
              child: const Icon(Icons.circle))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "${Provider.of<counterprovider>(context, listen: true).Counter.count}",
              style: const TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
