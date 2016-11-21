package com.lqr.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lqr.dao.ItemsMapper;
import com.lqr.domain.Items;
import com.lqr.service.ItemsService;

@Service
public class ItemsServiceImpl implements ItemsService {

	@Resource
	private ItemsMapper itemsMapper;

	@Override
	public List<Items> findAll() {
		return itemsMapper.findAll();
	}

	@Override
	public Items findById(Integer id) {
		return itemsMapper.selectByPrimaryKey(id);
	}

	@Override
	public void update(Items items) {
		itemsMapper.updateByPrimaryKey(items);
	}

	@Override
	public void delete(Integer id) {
		itemsMapper.deleteByPrimaryKey(id);
	}

}
