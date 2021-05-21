package com.laptrinhjavaweb.dto;

import java.util.ArrayList;

public class ThongKeDto extends AbstractDTO<ThongKeDto>{

	private int totalCustomer;
	private int maleCustomer;
	private int femaleCustomer;
	private ArrayList<String> labelsOfPieChart;
	private ArrayList<String> labelsOfBarChart;
	private ArrayList<String> datasOfPieChart;
	private ArrayList<String> datasOfBarChart;
	private String labelBar;
	private String dataBar;
	private String dataPie;
	
	
	public String getLabelBar() {
		return labelBar;
	}
	public void setLabelBar(String labelBar) {
		this.labelBar = labelBar;
	}
	public String getDataBar() {
		return dataBar;
	}
	public void setDataBar(String dataBar) {
		this.dataBar = dataBar;
	}
	public String getDataPie() {
		return dataPie;
	}
	public void setDataPie(String dataPie) {
		this.dataPie = dataPie;
	}
	public ArrayList<String> getDatasOfPieChart() {
		return datasOfPieChart;
	}
	public void setDatasOfPieChart(ArrayList<String> datasOfPieChart) {
		this.datasOfPieChart = datasOfPieChart;
	}
	public ArrayList<String> getDatasOfBarChart() {
		return datasOfBarChart;
	}
	public void setDatasOfBarChart(ArrayList<String> datasOfBarChart) {
		this.datasOfBarChart = datasOfBarChart;
	}
	
	
	public ArrayList<String> getLabelsOfPieChart() {
		return labelsOfPieChart;
	}
	public void setLabelsOfPieChart(ArrayList<String> labelsOfPieChart) {
		this.labelsOfPieChart = labelsOfPieChart;
	}
	public ArrayList<String> getLabelsOfBarChart() {
		return labelsOfBarChart;
	}
	public void setLabelsOfBarChart(ArrayList<String> labelsOfBarChart) {
		this.labelsOfBarChart = labelsOfBarChart;
	}
	public int getTotalCustomer() {
		return totalCustomer;
	}
	public void setTotalCustomer(int totalCustomer) {
		this.totalCustomer = totalCustomer;
	}
	public int getMaleCustomer() {
		return maleCustomer;
	}
	public void setMaleCustomer(int maleCustomer) {
		this.maleCustomer = maleCustomer;
	}
	public int getFemaleCustomer() {
		return femaleCustomer;
	}
	public void setFemaleCustomer(int femaleCustomer) {
		this.femaleCustomer = femaleCustomer;
	}
	public void arrToString() {
		String label ="[";
		for(int i=0;i<this.labelsOfBarChart.size();i++) {
			
		}
		
	}

	

}
