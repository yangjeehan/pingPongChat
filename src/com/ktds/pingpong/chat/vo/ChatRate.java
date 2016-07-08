package com.ktds.pingpong.chat.vo;

public class ChatRate extends ChatVO{
	
	private double memberChatRate;
	private int nightChatCount;
	private int sumNightChatCount;
	private int sumMorningChatCount;
	private int morningChatCount;
	private int firstChatCount;
	private int sumFirstChatCount;
	private int firstReplyCountTalk;
	private int firstReplySumTalk;
	private int firstReplyAvgTalk;
	private int howManySumText;
	private int howManyAvgText;
	private int howMnayTotalCount;
	private int smileChatCount;
	private int smileSumChatCount;
	private int angryChatCount;
	private int angrySumChatCount;
	private int dayChatCount;
	private String chatDay;
	private int daySumChatCount;
	
	private String character;
	private double similarity; 
	
	private int maxNightChatCount;
	private int maxMorningChatCount;
	private int maxFirstChatCount;
	private int maxFirstReplyCount;
	private int maxSmileChatCount;
	private int maxAngryChatCount;
	
	private int addFileCount;
	private int sumAddFileCount;
	
	public int getSumNightChatCount() {
		return sumNightChatCount;
	}
	public void setSumNightChatCount(int sumNightChatCount) {
		this.sumNightChatCount = sumNightChatCount;
	}
	public int getSumMorningChatCount() {
		return sumMorningChatCount;
	}
	public void setSumMorningChatCount(int sumMorningChatCount) {
		this.sumMorningChatCount = sumMorningChatCount;
	}
	public double getMemberChatRate() {
		return memberChatRate;
	}
	public void setMemberChatRate(double memberChatRate) {
		this.memberChatRate = memberChatRate;
	}
	public int getNightChatCount() {
		return nightChatCount;
	}
	public void setNightChatCount(int nightChatCount) {
		this.nightChatCount = nightChatCount;
	}
	public int getMorningChatCount() {
		return morningChatCount;
	}
	public void setMorningChatCount(int morningChatCount) {
		this.morningChatCount = morningChatCount;
	}
	public int getFirstChatCount() {
		return firstChatCount;
	}
	public void setFirstChatCount(int firstChatCount) {
		this.firstChatCount = firstChatCount;
	}
	public int getSumFirstChatCount() {
		return sumFirstChatCount;
	}
	public void setSumFirstChatCount(int sumFirstChatCount) {
		this.sumFirstChatCount = sumFirstChatCount;
	}
	public int getFirstReplyCountTalk() {
		return firstReplyCountTalk;
	}
	public void setFirstReplyCountTalk(int firstReplyCountTalk) {
		this.firstReplyCountTalk = firstReplyCountTalk;
	}
	public int getFirstReplySumTalk() {
		return firstReplySumTalk;
	}
	public void setFirstReplySumTalk(int firstReplySumTalk) {
		this.firstReplySumTalk = firstReplySumTalk;
	}
	public int getFirstReplyAvgTalk() {
		return firstReplyAvgTalk;
	}
	public void setFirstReplyAvgTalk(int firstReplyAvgTalk) {
		this.firstReplyAvgTalk = firstReplyAvgTalk;
	}
	public int getHowManySumText() {
		return howManySumText;
	}
	public void setHowManySumText(int howManySumText) {
		this.howManySumText = howManySumText;
	}
	public int getHowManyAvgText() {
		return howManyAvgText;
	}
	public void setHowManyAvgText(int howManyAvgText) {
		this.howManyAvgText = howManyAvgText;
	}
	public int getHowMnayTotalCount() {
		return howMnayTotalCount;
	}
	public void setHowMnayTotalCount(int howMnayTotalCount) {
		this.howMnayTotalCount = howMnayTotalCount;
	}
	public int getSmileChatCount() {
		return smileChatCount;
	}
	public void setSmileChatCount(int smileChatCount) {
		this.smileChatCount = smileChatCount;
	}
	public int getSmileSumChatCount() {
		return smileSumChatCount;
	}
	public void setSmileSumChatCount(int smileSumChatCount) {
		this.smileSumChatCount = smileSumChatCount;
	}
	public int getAngryChatCount() {
		return angryChatCount;
	}
	public void setAngryChatCount(int angryChatCount) {
		this.angryChatCount = angryChatCount;
	}
	public int getAngrySumChatCount() {
		return angrySumChatCount;
	}
	public void setAngrySumChatCount(int angrySumChatCount) {
		this.angrySumChatCount = angrySumChatCount;
	}
	public int getDayChatCount() {
		return dayChatCount;
	}
	public void setDayChatCount(int dayChatCount) {
		this.dayChatCount = dayChatCount;
	}
	public String getChatDay() {
		return chatDay;
	}
	public void setChatDay(String chatDay) {
		this.chatDay = chatDay;
	}
	public int getDaySumChatCount() {
		return daySumChatCount;
	}
	public void setDaySumChatCount(int daySumChatCount) {
		this.daySumChatCount = daySumChatCount;
	}
	public String getCharacter() {
		return character;
	}
	public void setCharacter(String character) {
		this.character = character;
	}
	public double getSimilarity() {
		return similarity;
	}
	public void setSimilarity(double similarity) {
		this.similarity = similarity;
	}
	public int getAddFileCount() {
		return addFileCount;
	}
	public void setAddFileCount(int addFileCount) {
		this.addFileCount = addFileCount;
	}
	public int getSumAddFileCount() {
		return sumAddFileCount;
	}
	public void setSumAddFileCount(int sumAddFileCount) {
		this.sumAddFileCount = sumAddFileCount;
	}
	public int getMaxNightChatCount() {
		return maxNightChatCount;
	}
	public void setMaxNightChatCount(int maxNightChatCount) {
		this.maxNightChatCount = maxNightChatCount;
	}
	public int getMaxMorningChatCount() {
		return maxMorningChatCount;
	}
	public void setMaxMorningChatCount(int maxMorningChatCount) {
		this.maxMorningChatCount = maxMorningChatCount;
	}
	public int getMaxFirstChatCount() {
		return maxFirstChatCount;
	}
	public void setMaxFirstChatCount(int maxFirstChatCount) {
		this.maxFirstChatCount = maxFirstChatCount;
	}
	public int getMaxFirstReplyCount() {
		return maxFirstReplyCount;
	}
	public void setMaxFirstReplyCount(int maxFirstReplyCount) {
		this.maxFirstReplyCount = maxFirstReplyCount;
	}
	public int getMaxSmileChatCount() {
		return maxSmileChatCount;
	}
	public void setMaxSmileChatCount(int maxSmileChatCount) {
		this.maxSmileChatCount = maxSmileChatCount;
	}
	public int getMaxAngryChatCount() {
		return maxAngryChatCount;
	}
	public void setMaxAngryChatCount(int maxAngryChatCount) {
		this.maxAngryChatCount = maxAngryChatCount;
	}
	
}
