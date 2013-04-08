library xclickcounter;

import 'dart:html';
import 'package:web_ui/web_ui.dart';

class CounterComponent extends WebComponent {
  @observable
  int count = 0;

  void increment(Event event) {
    count++;
  }
  
  void inserted() {
    this.query('button').onClick.listen(increment);
  }
}
