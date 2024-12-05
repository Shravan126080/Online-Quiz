package com.entity;

public class quesionentitty {
private int id;
private int quiz_id;
public void setQuiz_id(int quiz_id) {
	this.quiz_id = quiz_id;
}
private String question_text;
private String option1; 
private String option2;
private String option3;
private String option4;
private String correct_option;
public String getCorrect_option() {
	return correct_option;
}
public void setCorrect_option(String correct_option) {
	this.correct_option = correct_option;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getQuestion_text() {
	return question_text;
}
public void setQuestion_text(String question_text) {
	this.question_text = question_text;
}
public String getOption1() {
	return option1;
}
public void setOption1(String option1) {
	this.option1 = option1;
}
public String getOption2() {
	return option2;
}
public void setOption2(String option2) {
	this.option2 = option2;
}
public String getOption3() {
	return option3;
}
public void setOption3(String option3) {
	this.option3 = option3;
}
public String getOption4() {
	return option4;
}
public void setOption4(String option4) {
	this.option4 = option4;
}

}
