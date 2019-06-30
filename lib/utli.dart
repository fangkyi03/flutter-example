import 'package:flutter/material.dart';

typedef mapCallBack = dynamic Function(dynamic a,int b);

class Util {

  List list;

  Util(this.list);

  Iterable<Widget> map (mapCallBack callback) {
    return getMap().map((e)=> callback(this.list[e],e));
  }

  Iterable getMap () {
    return this.list.asMap().keys;
  }

  forEach (mapCallBack callBack) {
    getMap().forEach((e)=> callBack(this.list[e],e));
  }

  fill (dynamic data) {
    this.list = this.getMap().map((e)=>data).toList();
    return this;
  }
  
}