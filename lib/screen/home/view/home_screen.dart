import 'package:advanced_update_delete_insert/screen/home/modal/modal_class.dart';
import 'package:advanced_update_delete_insert/screen/home/provider/modal_.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  TextEditingController txtName=TextEditingController();
  TextEditingController txtID=TextEditingController();
  TextEditingController txtStd=TextEditingController();

  TextEditingController dtxtname = TextEditingController();
  TextEditingController dtxtid =TextEditingController();
  TextEditingController dtxtstd =TextEditingController();
  HomeProvider?homeProvider;
  @override
  Widget build(BuildContext context) {

    homeProvider = Provider.of<HomeProvider>(context,listen:false);

    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: txtName,
              decoration: InputDecoration(
                label: Text("Name"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: txtID,
              decoration: InputDecoration(
                label: Text("ID"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 15),
            TextField(
              controller: txtStd,
              decoration: InputDecoration(
                label: Text("Std"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(onPressed: (){
              StdModel s1 = StdModel(
                name:txtName.text,id:txtID.text,std:txtStd.text);
              homeProvider!.AddData(s1);
            }, child: Text("Add"),),
            Consumer<HomeProvider>(
              builder: (context,value,child)=>Expanded (
                child: ListView.builder(
                  itemCount: homeProvider!.l1.length,
                    itemBuilder:(context, index){
                      return ListTile(
                        leading: Text("${homeProvider!.l1[index].name}"),
                        title: Text("${homeProvider!.l1[index].id}"),
                        subtitle: Text("${homeProvider!.l1[index].std}"),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: (){
                              homeProvider!.deleteData(index);
                            }, icon: Icon(Icons.delete),),

                            IconButton(onPressed: (){
                               dtxtname = TextEditingController(text: homeProvider!.l1[index].name);
                               dtxtid = TextEditingController(text:homeProvider!.l1[index].id);
                               dtxtstd = TextEditingController(text: homeProvider!.l1[index].std);

                               showDialog(context: context, builder: (context)=>AlertDialog(
                                 content: Column(
                                   mainAxisSize: MainAxisSize.min,
                                   children: [
                                     TextField(controller: dtxtname),
                                     SizedBox(height: 10),
                                     TextField(controller: dtxtid),
                                     SizedBox(height: 10),
                                     TextField(controller: dtxtstd),
                                     SizedBox(height: 10),
                                     ElevatedButton(onPressed: (){
                                       StdModel s1 =StdModel(
                                         std:dtxtstd.text,
                                         id:dtxtid.text,
                                         name:dtxtname.text,
                                       );
                                       homeProvider!.upadatedata(index, s1);
                                     }, child: Text("Update"))
                                   ],
                                 ),
                               ),);
                            }, icon: Icon(Icons.edit),),
                          ],
                        ),
                      );
                },
                ),
              ),
            ),
              ],
        ),
      ),
    ),
    );
  }
}
