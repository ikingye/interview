---
weight: 10
title: "设计模式"
bookCollapseSection: true
---

# 设计模式

## 适配器模式、装饰模式、代理模式有哪些异同？

- 适配器模式
  - 适配器模式**实现新接口**
- 代理模式
  - 代理模式的特点在于**隔离**，隔离调用类和被调用类的关系，通过一个代理类去调用。
  - 代理模式是与原对象**实现同一个接口**
  - 代理模式一定是自身持有这个对象，不需要从外部传入。而装饰模式的一定是从外部传入。
- 装饰器模式
  - 原有的不能满足现有的需求，对原有的进行增强。
  - 装饰器模式特点在于**增强**，他的特点是被装饰类和所有的装饰类必须实现同一个接口，而且必须持有被装饰的对象，可以无限装饰。

---

  - 装饰器模式与代理模式实现原接口
- 都持有原对象
  - 装饰器模式构造函数**接收老对象**
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
    SourceOrderApi sourceOrderApi;
    public ProxySourceOrderApiImpl(){
        sourceOrderApi = new SourceOrderApiImpl();
    }

    @Override
    public void updateDate(String orderId, String date, String client) {
        //进行判断，如果是admin则更新否则让其输入账号密码
        if("admin".equals(client)){
            sourceOrderApi.updateDate(orderId, date, client);
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
