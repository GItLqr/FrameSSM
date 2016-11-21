package com.lqr.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lqr.domain.Items;
import com.lqr.service.ItemsService;

@Controller
@RequestMapping("/items")
public class ItemsController {

	@Resource
	private ItemsService itemsService;

	// ================== 商品操作 ==================
	@RequestMapping("list")
	public String list(Model model) {

		List<Items> list = itemsService.findAll();
		model.addAttribute("itemsList", list);

		return "itemsList";
	}

	@RequestMapping("edit")
	public String edit(Integer id, Model model) {

		Items items = itemsService.findById(id);
		model.addAttribute("item", items);

		return "editItem";
	}

	@RequestMapping("update")
	public String update(Items items) {

		itemsService.update(items);

		return "redirect:list.do";
	}

	@RequestMapping("delete")
	public String delete(Integer id) {

		itemsService.delete(id);

		return "redirect:list.do";
	}

	@RequestMapping("deleteIds")
	public String deleteIds(Integer[] id) {
		for (Integer integer : id) {
			itemsService.delete(integer);
		}
		return "redirect:list.do";
	}

	// ================== 得到json数据 ==================
	@RequestMapping("itemsJson")
	public @ResponseBody
	List<Items> itemsJson() {
		return itemsService.findAll();
	}

	@RequestMapping("itemsJson1")
	public @ResponseBody
	Items itemsJson1(@RequestBody Integer id) {// 这种就需要前端发来json数据（不常用）
		return itemsService.findById(id);
	}

	@RequestMapping("itemsJson2")
	public @ResponseBody
	Items itemsJson2(Integer id) {// 这种就需要前端发来pojo数据(就是普通的表单提交或get参数，常用)
		return itemsService.findById(id);
	}
}
