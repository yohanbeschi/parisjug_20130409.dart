import '../../lib/parisjug_20130410.dart';

void main() {
  final Tree tree = new Tree(
                             [new TreeConfig((School s) => s.schoolName, (School s) => s.grades),
                              new TreeConfig((Grade g) => g.schoolGrade, (Grade g) => g.students),
                              new TreeConfig((Student s) => '${s.firstname} ${s.lastname}')]
                             );
  tree.setData(schools);
  tree.addTo('body', 'afterBegin');
}

class Tree {
  List<TreeConfig> treeConfigs;
  
  Element tree;
  
  Tree(this.treeConfigs);
  
  Element setData(final List data) {
    this.tree = buildOneLevelTree(data, this.treeConfigs);
    return this.tree;
  }
  
  void addTo(String selector, [String where = 'afterEnd']) {
    query(selector).insertAdjacentElement(where, this.tree);
  }
  
  Element buildOneLevelTree(final List data, final List<TreeConfig> treeNodes, [final int depth = 0]) {
    Element tree;
    
    if (data != null && !data.isEmpty) {
      final TreeConfig treeNode = treeNodes[depth];
      
      tree = new UListElement();
        
      for (dynamic element in data) {
        final LIElement li = new LIElement();
        li.text = treeNode.value(element);
        
        if (treeNode.children != null) {
          final UListElement ulChild = buildOneLevelTree(treeNode.children(element), treeNodes, depth + 1);
          
          if (ulChild != null) {
            li.append(ulChild);
          }
        }
        
        tree.append(li);
      }
    }
    
    return tree;
  }
}

typedef dynamic Accessor(dynamic data);

class TreeConfig {
  //---- Data
  Accessor _value;
  Accessor _children;

  TreeConfig(Accessor this._value, [Accessor this._children]);
  
  Accessor get value => _value;
  Accessor get children => _children;
}