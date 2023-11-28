import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev7/data/entity/to_do.dart';
import 'package:odev7/ui/cubit/detay_sayfa_cubit.dart';

class DetaySayfa extends StatefulWidget {
  ToDos todo;
  DetaySayfa({required this.todo});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  var tfYapilacak = TextEditingController();

  @override
  void initState() {
    super.initState();
    var todo = widget.todo;
    tfYapilacak.text = todo.name;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yapılacak"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfYapilacak,decoration: const InputDecoration(hintText: "Görevinizi giriniz."),),
              ElevatedButton(onPressed: (){
                context.read<DetaySayfaCubit>().guncelle(widget.todo.id, tfYapilacak.text);
              }, child: const Text("Güncelle")),
            ],
          ),
        ),
      ),
    );
  }
}
