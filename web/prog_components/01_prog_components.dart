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
  
  String tree;
  
  Tree(this.treeConfigs);
  
  String setData(final List data) {
    this.tree = buildOneLevelTree(data, this.treeConfigs);
    return this.tree;
  }
  
  void addTo(String selector, [String where = 'afterEnd']) {
    query(selector).insertAdjacentHtml(where, this.tree);
  }
  
  String buildOneLevelTree(final List data, final List<TreeConfig> treeNodes, [final int depth = 0]) {
    String tree = '';
    
    if (data != null && !data.isEmpty) {
      final TreeConfig treeNode = treeNodes[depth];
      
      tree += '<ul>';
        
      for (dynamic element in data) { 
        tree += '<li>${treeNode.value(element)}';
        
        if (treeNode.children != null) {
          tree += buildOneLevelTree(treeNode.children(element), treeNodes, depth + 1);
        }
        
        tree += '</li>';
      }
      
      tree += '</ul>';
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