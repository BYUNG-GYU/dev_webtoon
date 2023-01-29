import 'package:flutter/material.dart';
import 'package:dev_webtoon/models/webtoon_model.dart';
import 'package:dev_webtoon/services/api_service.dart';
import 'package:dev_webtoon/widgets/webtoon_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 빨간맛",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot))
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
  return ListView.separated(
    scrollDirection: Axis.horizontal,
    itemCount: snapshot.data!.length,
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    itemBuilder: (context, index) {
      var webtoon = snapshot.data![index];
      return Webtoon(
          title: webtoon.title, thumb: webtoon.thumb, id: webtoon.id);
    },
    separatorBuilder: (context, index) => const SizedBox(width: 40),
  );
}
