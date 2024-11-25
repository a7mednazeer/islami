import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/widgets/loading_indicator.dart';

class HadethScreen extends StatefulWidget {
  const HadethScreen({super.key});
  static const String routeName = '/hadeth';

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  @override
  Widget build(BuildContext context) {
    HadethScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as HadethScreenArguments;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إسلامي'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
            vertical: MediaQuery.of(context).size.height * 0.1,
          ),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    args.title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              Divider(
                height: 25,
                thickness: 2.5,
                color: Theme.of(context).primaryColor,
              ),
              Expanded(
                child: args.hadeth.isEmpty
                    ? LoadingIndicator()
                    : ListView.builder(
                        padding: EdgeInsets.only(top: 5),
                        itemBuilder: (_, index) => Text(
                          args.hadeth[index],
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        itemCount: args.hadeth.length,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
