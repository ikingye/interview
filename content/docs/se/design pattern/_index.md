---
weight: 10
title: "设计模式"
bookCollapseSection: true
---

# 设计模式

## 适配器模式、装饰模式、代理模式有哪些异同？

- 适配器模式
  - 允许因为接口不兼容而不能在一起工作的类工作在一起，做法是将类自己的接口包裹在一个已存在的类中。
  - 适配器模式是将一个类 (a) 通过某种方式转换成另一个类 (b)。
  - 适配器的特点在于**兼容**，从代码上的特点来说，适配类与原有的类具有相同的接口，并且持有新的目标对象。就如同一个三孔转 2 孔的适配器一样，他有三孔的插头，可以插到三孔插座里，又有两孔的插座可以被 2 孔插头插入。适配器模式是在于对原有 3 孔的改造。在使用适配器模式的时候，我们必须**同时持有原对象，适配对象，目标对象**。
- 装饰器模式
  - 原有的不能满足现有的需求，对原有的进行增强。
  - 装饰模式是在一个原有类 (a) 的基础之上增加了某些新的功能变成另一个类 (b)。
  - 装饰器模式特点在于**增强**，他的特点是被装饰类和所有的装饰类必须实现同一个接口，而且必须持有被装饰的对象，可以无限装饰。
- 代理模式
  - 同一个类而去调用另一个类的方法，不对这个方法进行直接操作。
  - 代理模式是将一个类 (a) 转换成具体的操作类 (b)。
  - 代理模式的特点在于**隔离**，隔离调用类和被调用类的关系，通过一个代理类去调用。
  - 代理模式是与原对象**实现同一个接口**，而适配器是实现一个新的接口。
  - 代理模式一定是自身持有这个对象，不需要从外部传入。而装饰模式的一定是从外部传入。

---

- 适配器模式**实现新接口**
  - 装饰器模式与代理模式实现原接口
- 都持有原对象
  - 装饰器模式构造函数接收老对象
  - 适配器模式与代理模式自己 new 老对象

```java
/**
 * 原接口，需要传入 orderId，时间
 */
public interface SourceOrderApi {
    public void updateDate(String orderId, String date, String client);
}

public class SourceOrderApiImpl implements SourceOrderApi{
    @Override
    public void updateDate(String orderId, String date, String client) {
        System.out.println(client+"已将订单"+orderId+"的有效期延长至"+date);
    }
}

public class Test {
    public static void main(String[] args) {
        SourceOrderApi sourceOrderApi = new SourceOrderApiImpl();
        sourceOrderApi.updateDate("123456", "2014-10-15", "user");
    }
}


/**
 * 适配器模式
 */
public interface AppOrderApi {
    //只需要传入订单Id即可
    public void updateDate(String orderId, String client);
}

public class AppOrderApiImpl implements AppOrderApi{
    SourceOrderApi sourceOrderApi;
    public AppOrderApiImpl(){
        sourceOrderApi = new SourceOrderApiImpl();
    }

    @Override
    public void updateDate(String orderId,String client) {
        //这里适配的方式随意，但是保证是要完全兼容原有的，就是保证调用原有的接口
        sourceOrderApi.updateDate(orderId, "9999-12-31", client);
    }
}

public class Test {
    public static void main(String[] args) {
        AppOrderApi appOrderApi = new AppOrderApiImpl();
        appOrderApi.updateDate("123456", "user");
    }
}


/**
 * 代理模式
 */
public class ProxySourceOrderApiImpl implements SourceOrderApi {
    SourceOrderApi sourceOrderApiImpl;
    public ProxySourceOrderApiImpl(){
        sourceOrderApiImpl = new SourceOrderApiImpl();
    }

    @Override
    public void updateDate(String orderId, String date, String client) {
        //进行判断，如果是admin则更新否则让其输入账号密码
        if("admin".equals(client)){
            sourceOrderApiImpl.updateDate(orderId, date, client);
        }else{
            System.out.println("账号不是admin，没有查询权限，请输入以admin操作");
        }
    }
}


/**
 * 装饰器模式
 */
public class NewSourceOrderApiImpl implements SourceOrderApi {
    SourceOrderApi sourceOrderApi;
    public NewSourceOrderApiImpl(SourceOrderApi sourceOrderApi){
        this.sourceOrderApi = sourceOrderApi;
    }
    @Override
    public void updateDate(String orderId, String date, String client) {
        sourceOrderApi.updateDate(orderId, date, client);
        System.out.println(client+"已将订单"+orderId+"的退款期延长至"+date);

    }
}
```

---
