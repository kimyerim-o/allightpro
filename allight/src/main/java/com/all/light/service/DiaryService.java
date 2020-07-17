package com.all.light.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.all.light.dao.DiaryDAO;
import com.all.light.dto.DiaryDTO;

public class DiaryService {
	
	@Autowired
	private DiaryDAO diaDAO;
	
	/* String to Date
		String from = "2013-04-08 10:10:10";
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date to = transFormat.parse(from);
		
		// Date to String
		Date from = new Date();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String to = transFormat.format(from);
	*/
	
	public List<DiaryDTO> main(List<DiaryDTO> dateList, String mid, Integer year, Integer month) {
		System.out.println("서비스");
		List<DiaryDTO> list = diaDAO.main(mid,year,month);
		
		for(int i=0; i<dateList.size();i++) {
			for(int j=0;j<list.size();j++) {
				if(list.get(j).getDay().equals(dateList.get(i).getDay())) {
					System.out.println(list.get(j).getDay());
					dateList.get(i).setDexercal(list.get(j).getDexercal());
					dateList.get(i).setDfoodcal(list.get(j).getDfoodcal());
					dateList.get(i).setDweight(list.get(j).getDweight());
					dateList.get(i).setDimage(list.get(j).getDimage());
					dateList.get(i).setDdiary(list.get(j).getDdiary());
				}
			}
		}
		return dateList;
	}
}




