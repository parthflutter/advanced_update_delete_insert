import 'package:flutter/cupertino.dart';

import '../modal/modal_class.dart';

class HomeProvider extends ChangeNotifier
{
  List<StdModel> l1=[];

  void AddData(StdModel s1) {
    l1.add(s1);
    notifyListeners();
  }

    void deleteData(int index)
    {
      l1.removeAt(index);
      notifyListeners();
    }

    void upadatedata(int index,StdModel s1)
    {
      l1[index] =s1;
      notifyListeners();
    }
  }
