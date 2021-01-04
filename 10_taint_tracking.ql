/**
 * @kind path-problem
 */

import cpp
import semmle.code.cpp.dataflow.TaintTracking
import DataFlow::PathGraph

class NetworkByteSwap extends Expr {
  NetworkByteSwap() {
    exists(MacroInvocation mi |
      mi.getMacroName().regexpMatch("ntoh(s|l|ll)") and
      this = mi.getExpr()
    )
  }
}  //如之前的一样，这个类会查找所以包含ntoh*的，并返回表达式

class Config extends TaintTracking::Configuration {
  Config() { this = "NetworkToMemFuncLength" }  //config配置信息

  override predicate isSource(DataFlow::Node source) { source.asExpr() instanceof NetworkByteSwap }
//定义isSource，这个可以理解成污点的源头，从ntoh*源头出发
  override predicate isSink(DataFlow::Node sink) {  //污点的去处，去memcpy
    exists(FunctionCall call |
      call.getTarget().getName() = "memcpy"  //判断是否去处为memcpy
      and sink.asExpr() = call.getArgument(2) //且去处是否为第三个参数
     // and not call.getArgument(1).isConstant()//同时判断memcpy第二个参数是否为常数
    )
  }
}

from Config cfg, DataFlow::PathNode source, DataFlow::PathNode sink
where cfg.hasFlowPath(source, sink)//开始执行
select sink, source, sink, "Network byte swap flows to memcpy"


