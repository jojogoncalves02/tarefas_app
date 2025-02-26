import 'package:flutter/material.dart';

class TarefasApp extends StatefulWidget {
  const TarefasApp({super.key});

  @override
  State<TarefasApp> createState() => _TarefasAppState();
}

class _TarefasAppState extends State<TarefasApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  List<String> tarefas =[
  "Pagar Contas",
  "Comprar Cachaca"


  ];
  String novaTarefa = "";

  void addTarefa(){
   if (novaTarefa != "") {
setState(() {
      tarefas.add(novaTarefa);
    });
   }
}

void removeTarefa(String tarefa){
  tarefas.remove(tarefa);
}


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.pink,
      title: Text("Tarefas Page"),
      centerTitle: true,
    ),
    body: Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          ...tarefas.map((tarefa)=>GestureDetector(
            onTap: (){
              removeTarefa(tarefa);
            },
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(tarefa),
              ),
            ),
          ))
          
        ],
      ),
    ),
    bottomNavigationBar: Container(
      height: 60,
      color: Colors.pink,
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 400,
              child: TextFormField(
                onChanged: (valor){
                  novaTarefa =valor;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder:OutlineInputBorder() 
                ),
              )),
            GestureDetector(
              onTap: (){
                addTarefa();
                
              },
              child: Container(
                width:50,
                height: 50,
                color: Colors.red,
                child: Icon(Icons.add),
              ),
            )
        
          ],
        ),
      ),
    ),
    );
  }
}