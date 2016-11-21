<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>FrameSSM框架说明</title>
</head>

<body>
	<a href="${pageContext.request.contextPath }/items/list.do">入口（查看商品列表）</a>
	<br>

	<h1>使用说明</h1>
	<h3>1、正常运行该项目，需要创建一个数据库并运行config目录下的crm.sql创建表和数据</h3>

	<h3>2、使用前需要修改jdbc.properties中的数据库连接信息</h3>

	<h3>3、spring的组件扫描配置</h3>
	<h5>①开发时需要根据项目的实际情况修改bean.xml中context:component-scan的base-package属性</h5>
	<h5>①开发时需要根据项目的实际情况修改springmvc.xml中context:component-scan的base-package属性</h5>

	<h3>4、mybatis的mapper扫描器配置</h3>
	<h5>①开发时需要根据项目的实际情况修改bean.xml中MapperScannerConfigurer的basePackage属性</h5>

	<h3>5、事务拦截配置</h3>
	<h5>①开发时需要根据项目的实际情况修改bean.xml中aop:advisor的pointcut属性</h5>

	<h3>6、viewResolver视图解析器配置</h3>
	<h5>①该项目配置了视图解析器，用于在controller中返回逻辑视图，正确找到要显示的jsp页面</h5>
	<h5>②物理视图：return "/WEB-INF/jsps/editItem.jsp"</h5>
	<h5>③逻辑视图：return "editItem"</h5>
	<h5>④在springmvc.xml中可以修改视图解析器的前缀（prefix）和后缀（suffix）规则。</h5>

	<h3>7、Controller中的转发重定向</h3>
	<h5>①转发</h5>
	<ul>
		<li>同类中转发：return "forward:list.do";</li>
		<li>同类中转发：return "forward:/items/list.do";</li>
		<li>跨类转发（从itemsController跳转到userController）：return
			"forward:/user/list.do"</li>
	</ul>
	<h5>②重定向</h5>
	<ul>
		<li>同类中重定向：return "redirect:list.do";</li>
		<li>同类中重定向：return "redirect:/items/list.do";</li>
		<li>跨类重定向（从itemsController跳转到userController）：return
			"redirect:/user/list.do"</li>
	</ul>

	<h3>8、mybatis逆向工程</h3>
	<h5>①可以使用另一个工程项目实现数据库表逆向生成POJO的Mapper，具体请看mybatis_generate项目。</h5>

	<h3>9、oscache页面缓存配置</h3>
	<h5>①使用oscache页面缓存对指定访问的页面进行缓存，以便下次在缓存过期时间内访问时不再动态生成页面，而是直接从缓存中将页面拿出来显示。配置oscache页面缓存有2种，一种是在jsp页面导入其taglib，并使用oscache标签；另一种是在web.xml中配置（该框架使用的是配置web.xml文件）</h5>
	<h5>①内存缓存：具体配置请查看web.xml中oscache过滤器的配置，在开发时需要根据项目实际情况修改过滤器的url-pattern，指定对某类页面进行缓存。</h5>
	<h5>③本地缓存：使用本地缓存只需在classpath目录下创建一个名为oscache.properties文件，并配置参数，具体配置请查看config/oscache.properties文件。注意：当cache.memory=false时，内存缓存无效。</h5>

	<h3>10、springmvc拦截器配置</h3>
	<h5>①自定义拦截器需要实现HandlerInterceptor接口，可实现登录过滤（该框架没有该功能实现）。开发时需要根据实际项目修改springmvc.xml拦截器的mapping和bean。</h5>
	<h5>②当有多个拦截器时，方法的执行顺序是：preHandle是正序，postHandle和afterCompletion是反序，详情顺序可以运行框架后查看控制台。</h5>
	<h5>③springmvc规定，当preHandle返回true时（放行），afterCompletion一定会被调用。</h5>
</body>
</html>
