import cpp
//新建一个class，方便后续调用
//extends 是这个class返回的值
//exists是生成了一个临时变量，而不需要在query语句中使用，this就是class的指针。需要返回相同的类型，expr为抽象类型，对应getExpr返回的类型
class NetworkByteSwap extends Expr {
  NetworkByteSwap() {
    exists(MacroInvocation mi | mi.getMacroName().regexpMatch("ntoh(s|l|ll)") and this = mi.getExpr()
    )
  }   
}

from NetworkByteSwap n  //from声明这个类，然后查询
select n, "Network byte swap"


// //例子，不写class类，直接用exists，其中定义了一类型为MacroInvocation的临时变量mi，然后匹配ntoh* 并把mi赋值给p，最后返回p
// from MacroInvocation p
// where exists(MacroInvocation mi |  mi.getMacroName().regexpMatch("ntoh(s|l|ll)") and p = mi)
// select p