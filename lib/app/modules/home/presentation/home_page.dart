import 'package:change_notifier_example/app/modules/home/presentation/widgets/bloc_tab.dart';
import 'package:change_notifier_example/app/modules/home/presentation/widgets/change_notifier_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC Vs ChangeNotifier'),
        bottom: TabBar(
          controller: tabController,
          labelColor: Colors.white,
          indicatorColor: Colors.white,
          labelPadding: const EdgeInsets.all(16),
          unselectedLabelColor: Colors.white54,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: const [
            Text('BLoC'),
            Text('ChangeNotifier'),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: const [
          BlocTab(),
          ChangeNotifierTab(),
        ],
      ),
    );
  }
}
