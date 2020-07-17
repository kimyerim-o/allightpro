package com.all.light.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.all.light.dto.DiaryDTO;
import com.all.light.service.DiaryService;

@Controller
public class DiaryController {
	@Autowired
	private DiaryService diaSVC;
	
	//메인화면
	@RequestMapping("/main")
	public ModelAndView main(HttpServletRequest request, ModelAndView mv, DiaryDTO ddto) {
		
		Calendar cal = Calendar.getInstance();
		DiaryDTO calendarData;
		
		//검색 날짜
		if(ddto.getDay().equals("")&&ddto.getMonth().equals("")){
			ddto = new DiaryDTO(String.valueOf(cal.get(Calendar.YEAR)),String.valueOf(cal.get(Calendar.MONTH)),String.valueOf(cal.get(Calendar.DATE)),null);
		}

		Map<String, Integer> today_info =  ddto.today_info(ddto);
		List<DiaryDTO> dateList = new ArrayList<DiaryDTO>();
		
		//실질적인 달력 데이터 리스트에 데이터 삽입 시작.
		//일단 시작 인덱스까지 아무것도 없는 데이터 삽입
		for(int i=1; i<today_info.get("start"); i++){
			calendarData= new DiaryDTO(null, null, null, null);
			dateList.add(calendarData);
		}
		
		//날짜 삽입
		for (int i = today_info.get("startDay"); i <= today_info.get("endDay"); i++) {
			if(i==today_info.get("today")){
				calendarData= new DiaryDTO(String.valueOf(ddto.getYear()), String.valueOf(ddto.getMonth()), String.valueOf(i), "today");
			}else{
				calendarData= new DiaryDTO(String.valueOf(ddto.getYear()), String.valueOf(ddto.getMonth()), String.valueOf(i), "normal_date");
			}
			dateList.add(calendarData);
		}

		//달력 빈곳 빈 데이터로 삽입
		int index = 7-dateList.size()%7;
		
		if(dateList.size()%7!=0){
			for (int i = 0; i < index; i++) {
				calendarData= new DiaryDTO(null, null, null, null);
				dateList.add(calendarData);
			}
		}
		System.out.println(dateList);
		
		// 로그인 했으면 메인에 띄울 정보 가져오기
		String mid = (String)request.getSession().getAttribute("MID");
		if(mid!=null && !mid.equals("")) {
			dateList = diaSVC.main(dateList,mid,today_info.get("search_year"),today_info.get("search_month"));
		}
		
		mv.addObject("dateList", dateList);		//날짜 데이터 배열
		mv.addObject("today_info", today_info);
		mv.setViewName("/index");
		return mv;
	}
	
	
}
