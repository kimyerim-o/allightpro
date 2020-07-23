package com.all.light.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.all.light.dao.CaldictionaryDAO;

@Service
public class CaldictionaryService {

	@Autowired
	CaldictionaryDAO calDAO;
	
	
}
