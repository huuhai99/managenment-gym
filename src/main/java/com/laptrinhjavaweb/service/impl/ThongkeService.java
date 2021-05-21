package com.laptrinhjavaweb.service.impl;

import java.util.ArrayList;
import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.laptrinhjavaweb.service.IBillService;

@Service("thongkeService")
public class ThongkeService {
	
	@Autowired
	private IBillService billService;
	
	
	public ArrayList<String> setLabelsOfBarChartByDay(String day){
		int d = Integer.parseInt(day);
		ArrayList<String> arr = new ArrayList<String>();
		for(int i=d;i>=1&&i>=d-6;i--) {
			arr.add("'Ngày "+i+"'");
		}
		Collections.reverse(arr);
		return arr;
		
	}
	public ArrayList<String> setLabelsOfBarChartByMonth(String month){
		int m = Integer.parseInt(month);
		ArrayList<String> arr = new ArrayList<String>();
		for(int i=1;i<=m;i++) {
			arr.add("'Tháng "+i+"'");
		}
		return arr;
		
	}
	public ArrayList<String> setLabelsOfBarChartByYear(String year){
		int y = Integer.parseInt(year)-2;
		ArrayList<String> arr = new ArrayList<String>();
		for(int i=0;i<3;i++) {
			arr.add("'năm "+y+"'");
			y++;
		}
		return arr;
	}
	
	
	public ArrayList<String> setDatasOfBarChartByDay(String time, String year, String month, String day){
		Long y = Long.parseLong(year);
		Long m = Long.parseLong(month);
		int da = Integer.parseInt(day);
		ArrayList<String> arr = new ArrayList<String>();
		for(int i=da-6;i<=da;i++) {
			int sum = billService.getTotalRevenue(time, y, m,(long) i);
			arr.add(""+sum);
		}
		return arr;
		
	}
	public ArrayList<String> setDatasOfBarChartByMonth(String time, String year, String month){
		Long y = Long.parseLong(year);
		/* Long m = Long.parseLong(month); */
		int mo = Integer.parseInt(month);
		ArrayList<String> arr = new ArrayList<String>();
		for(int i=1;i<=mo;i++) {
			int sum = billService.getTotalRevenue(time, y,(long) i, (long) 1);
			arr.add(""+sum);
		}
		return arr;
		
	}
	public ArrayList<String> setDatasOfBarChartByYear(String time, String year){
		/* Long y = Long.parseLong(year); */
		Long ye = Long.parseLong(year)-2;
		ArrayList<String> arr = new ArrayList<String>();
		
		for(int i=0;i<3;i++) {
			int sum = billService.getTotalRevenue(time, ye,(long) 1,(long) 1);
			arr.add(""+sum);
			ye++;
		}
		return arr;
	}
	
	
}
