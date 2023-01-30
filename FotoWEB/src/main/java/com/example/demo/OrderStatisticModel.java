package com.example.demo;

public class OrderStatisticModel {

	private int doneNumber;
	
	private int inProgressNumber;
	
	private float statisticPercentage;

	public OrderStatisticModel(int doneNumber, int inProgressNumber, float statisticPercentage) {
		super();
		this.doneNumber = doneNumber;
		this.inProgressNumber = inProgressNumber;
		this.statisticPercentage = statisticPercentage;
	}

	public int getDoneNumber() {
		return doneNumber;
	}

	public void setDoneNumber(int doneNumber) {
		this.doneNumber = doneNumber;
	}

	public int getInProgressNumber() {
		return inProgressNumber;
	}

	public void setInProgressNumber(int inProgressNumber) {
		this.inProgressNumber = inProgressNumber;
	}

	public float getStatisticPercentage() {
		return statisticPercentage;
	}

	public void setStatisticPercentage(float statisticPercentage) {
		this.statisticPercentage = statisticPercentage;
	}
	
}
