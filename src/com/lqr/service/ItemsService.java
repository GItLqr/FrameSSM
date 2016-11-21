package com.lqr.service;

import java.util.List;

import com.lqr.domain.Items;

public interface ItemsService {

	List<Items> findAll();

	Items findById(Integer id);

	void update(Items items);

	void delete(Integer id);

}
