import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/provider/app_provider.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  SuraDetailsArguments arg;
  DetailsScreen({required this.arg});

  @override
  State<DetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<DetailsScreen> {
  List<String> listt = [];

  @override
  void initState() {
    super.initState();
    widget.arg.isQuran ? loadFilesQuran(widget.arg.index) : loadFiles(widget.arg.index);
  }

  @override
  Widget build(BuildContext context) {
    AppProvider provider = Provider.of<AppProvider>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          widget.arg.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image:  DecorationImage(
            image:provider.isDark ? const AssetImage('assets/images/dark_bg.png') : const AssetImage('assets/images/default_bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: listt.isEmpty ? const Center(child: CircularProgressIndicator()) : Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: ((context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: provider.isDark ? Color(0xff141A2E) : Color(0xffF8F8F8)
                      ),
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        listt[index],
                        textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: provider.isDark ? Color(0xffFACC1D) :  Colors.black,
                        ),
                      ),
                    );
                  }),
                  itemCount: listt.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadFilesQuran(int indexx) async {
    String content = await rootBundle.loadString(
        'assets/files/${indexx + 1}.txt');
    List<String> lines = content.split('\n');
    setState(() {
      listt = lines;
    });
  }

  void loadFiles(int indexx) async {
    String content = await rootBundle.loadString(
        'assets/files/hadeeth/h${indexx + 1}.txt');
    List<String> lines = content.split('\n');
    setState(() {
      listt = lines;
    });
  }
}

class SuraDetailsArguments {
  final String name;
  final int index;
  final bool isQuran;
  SuraDetailsArguments({required this.name, required this.index , required this.isQuran});
}
