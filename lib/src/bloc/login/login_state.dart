part of 'login_bloc.dart';

//นิยาม
class LoginState extends Equatable {
//ไม่ควรเปลี่ยนเเปลง state โดยตรง
  final int count;
  final bool isAutthencation;
  const LoginState({this.count = 0, this.isAutthencation = false});

//clone object ป้องกันการ intefiar intefiar? ป้องกันการเปลี่ยนเปลี่ยนข้อมูลระหว่างกำลังทำงาน
  LoginState coppyWith({int? count, bool? isAutthencation}) {
    return LoginState(
        count: count ?? this.count,
        isAutthencation: isAutthencation ?? this.isAutthencation);
  }

  @override
  List<Object?> get props =>
      //ตัวแปรที่เราต้องการให้มันเปลี่ยนใน ui
      [count, isAutthencation];
}
