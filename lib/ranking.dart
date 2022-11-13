import 'package:flutter/material.dart';

const double hour = 60 * 60;
const double minute = 60;
List<double> ranklist = [0*hour+50*minute+30, 0*hour+30*minute+35, 10*minute+45,15*minute+55];

class MyRankingApp extends StatelessWidget {
  const MyRankingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //sort
    //ranklist.sort((a, b) => b.compareTo(-a));
    //sort of Mr.Takamasa's code
    ranklist.sort((a, b){
      if(a != b && (a~/(60*60)) != (b~/(60*60))){//時間を比較
        return (a~/(60*60)).compareTo((b~/(60*60)));

      }else if(a != b && (a~/(60*60)) == (b~/(60*60)) && (a~/60) != (b~/60)){//分を比較
        return (a~/60).compareTo((b~/60));

      }else if(a != b && (a~/(60*60)) == (b~/(60*60)) && (a~/60) == (b~/60)){//秒を比較
        return (a).compareTo(b);
      }else{
        return a.toString().length.compareTo(b.toString().length);//何か値を返す必要があるため文字列の長さを比較
      }
    }
    );

    return MaterialApp(
      title: "ランキング",
      home: Scaffold(
        appBar: AppBar(title: Text("ランキング")),
        body: const MyTableWidget(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
            BottomNavigationBarItem(icon: Icon(Icons.timer), label: "timer"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "chat"),
          ],
        ),
      ),
    );
  }
}

class MyTableWidget extends StatelessWidget {
  const MyTableWidget({Key? key}) : super(key: key);

  Widget _Time(index){
    int time = ranklist[index].toInt();
    int h = (ranklist[index] / (60*60)).toInt();
    time -= h *60*60;
    int min = (time / 60).toInt();
    time -= min*60;
    int sec = (time).toInt();
    //for_test
    // print("h:${h}");
    // print("min:${min}");
    // print("sec:${sec}");
    if(h == 0){
      return Text("${index+1}：${min}分${sec}秒");
    }else{
      return Text("${index+1}：${h}時間${min}分${sec}秒");
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 40, color: Colors.grey),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                //child: TextField(),
                ),
              ListView.builder(
                itemCount: ranklist.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index){
                  return Card(
                    child: ListTile(
                      title: _Time(index),
                          //"${index+1}：${ranklist[index]/60}分${ranklist[index]%60}秒"),
                    ),
                 );
               },
              ),
            ],
          ),
          //テーブル作成
          // child: Table(
          //   border: TableBorder.all(color: Colors.black, width: 2),
          //   columnWidths: const {0: FlexColumnWidth(0.5)},
          //   children: List.generate(
          //     ranklist.length,
          //     (index) =>
          //         TableRow(children: [Text((index+1).toString()), Text(ranklist[index])]),
          //   ),
          // ),
        ),
      ),
    );
  }
}