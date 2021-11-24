a: 0;
func(b:0):(
  c: 0;
  if(1, (
    c <= 1;
    d: 0;
  ));
);

func_layer = 0
funcVars = [[]...]
起初：
funcVars_push("a") => [["a"],[]...]
进入func
func_layer++ => 1
funcVars_pushParams() => [["a"],["b"],[]...]
funcVars_push("c") => [["a"],["b","c"],[]...]
进入if
func_layer++ => 2
funcVars_find("c") => 1 => tmp_layer
code_appendPartPrefixes(tmp_layer) // 只在call中有
funcVars_push("d") => [["a"],["b","c"],["d"],[]...]
离开if
funcVars_pop() => [["a"],["b","c"],[]...]
func_layer-- => 1
离开func
funcVars_pop() => [["a"],[]...]
func_layer-- => 0

if部分能转到func吗？毕竟序号已经不一样了
不行，这样if的序号就会不连续

