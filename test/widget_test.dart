import 'dart:io';

void main() {
  showData();
}

void showData() {
  startTask();
  accessData();
  fetchData();
}

void startTask() {
  String info1 = '요청수행 시작';
  print(info1);
}

void accessData() {
  Duration time = Duration(seconds: 3);

  String info2 = '데이터에 접속중';
  if (time.inSeconds > 2) {
    //sleep(time);
    Future.delayed(time, () {
      //Future.delayed메서드는 듀레이션 값과 그후 실행할 함수를 받는다.
      info2 = '데이터에 처리 완료';
      print(info2);
    });
  } else {
    info2 = '데이터를 가져왔습니다.';
    print(info2);
  }
}

void fetchData() {
  String info3 = '잔액은 8,500만원 입니다.';
  print(info3);
}
