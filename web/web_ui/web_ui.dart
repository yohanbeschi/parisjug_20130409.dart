import 'dart:html';
import 'xclickcounter.dart';
import 'package:web_ui/web_ui.dart';
import 'package:web_ui/watcher.dart' as watchers;

void main() {
  var counter = new CounterComponent()
   ..host = (new Element.html('<x-click-counter id="click_counter"></x-click-counter>'))
   ..count = 25;
  
  var lifecycleCaller = new ComponentItem(counter)..create();
  query('body').append(counter.host);
  lifecycleCaller.insert();
  
  var button = new ButtonElement()
    ..text = 'Update'
    ..onClick.listen((e) {
      counter.count = 100;
      
      watchers.dispatch();
    });
  query('body').append(button);
}