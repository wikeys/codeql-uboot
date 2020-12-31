import cpp

from Function f  //f是一个数据集合,也就是将C/C++的lib抽取出来变成一个抽象的列表
where f.getName() = "strlen" //选择查询，getName是获取f集合中name为strlen的
select f, "a function named strlen" //查询所有f，并表明注释