package com.ktds.pingpong.util;

import java.util.List;
import java.util.Map;

import com.ktds.pingpong.chat.vo.ChatRate;

public class AnalysisCharacter {
	
	private final int chendarae_index = 0;
	private final int calmleader_index = 1;
	private final int dictator_index = 2;
	private final int buddha_index = 3;
	private final int slicker_index = 4;
	
	private final String chendarae = "츤데레";
//	private final String calmleader = "온화한 리더";
	private final String calmleader = "분위기 메이커";
	private final String dictator = "독재자";
	private final String buddha = "부처";
	private final String slicker = "깍쟁이";

	// 평균값을 가지고 있다.
	double avg = 0;
	// 정색비율
	double anglyRate = 0; 
	// 멤버별 채팅 비율
	double memChatRate = 0;
	// 반응 채팅 비율
	double fastTalkRate = 0;
	// 선톡 비율
	double firstTalkRate = 0;
	// 푼수 비율 ^^
	double idiotRate = 0;
	// 올빼미 확률
	double nightTalkRate = 0;
	


	public Map<String, ChatRate> setFirstRate(Map<String, ChatRate> totalRates, List<String> nickNames) {
	
		int maxMorningChatCount=0;
		int maxNightChatCount=0;
		int maxFirstChatCount=0;
		int maxFirstReplyCount=0;
		int maxSmileChatCount=0;
		int maxAngryChatCount=0;
		
		for(String nickName : nickNames){
			ChatRate chatRate = totalRates.get(nickName);
			
			if(maxMorningChatCount < chatRate.getMorningChatCount()){
				maxMorningChatCount = chatRate.getMorningChatCount();
			}
			if(maxNightChatCount < chatRate.getNightChatCount()){
				maxNightChatCount = chatRate.getNightChatCount();
			}
			if(maxFirstChatCount < chatRate.getFirstChatCount()){
				maxFirstChatCount = chatRate.getFirstChatCount();
			}
			if(maxFirstReplyCount < chatRate.getFirstReplyCountTalk()){
				maxFirstReplyCount = chatRate.getFirstReplyCountTalk();
			}
			if(maxSmileChatCount < chatRate.getSmileChatCount()){
				maxSmileChatCount = chatRate.getSmileChatCount();
			}
			if(maxAngryChatCount < chatRate.getAngryChatCount()){
				maxAngryChatCount = chatRate.getAngryChatCount();
			}
		}
		for(String nickName : nickNames){
			totalRates.get(nickName).setMaxMorningChatCount(maxMorningChatCount);
			totalRates.get(nickName).setMaxNightChatCount(maxNightChatCount);
			totalRates.get(nickName).setMaxFirstChatCount(maxFirstChatCount);
			totalRates.get(nickName).setMaxFirstReplyCount(maxFirstReplyCount);
			totalRates.get(nickName).setMaxSmileChatCount(maxSmileChatCount);
			totalRates.get(nickName).setMaxAngryChatCount(maxAngryChatCount);
		}
		
		return totalRates;
	}
	
	
	public Map<String, ChatRate> setCharacter(Map<String, ChatRate> totalRates, List<String> nickNames) {

		for(String nickName : nickNames){
			System.out.println(nickName);
			ChatRate chatRate = totalRates.get(nickName);
			System.out.println(	chatRate.getDayChatCount());

			System.out.println("totlaRate의 사이즈는"+totalRates.size());
			avg = 1.0 / totalRates.size();
			
			double chenRate = getChendaeraeRate(chatRate, avg);
			double calmleaderRate = getCalmleaderRate(chatRate, avg);
			double dictatorRate = getDictatorRate(chatRate, avg);
			double buddhaRate = getBuddhaRate(chatRate,avg); 
			double slickerRate = getSlickerRate(chatRate, avg);
			
			double[] rates = {0,0,0,0,0};
			rates[chendarae_index] = chenRate;
			rates[calmleader_index] = calmleaderRate;
			rates[dictator_index] = dictatorRate;
			rates[buddha_index] = buddhaRate;
			rates[slicker_index] = slickerRate;
			
			double max = 0;
			double max_index = 0;
			System.out.println("rates길이"+rates.length);
			for(int i = 0 ; i< rates.length ; i++){
				
				if(max < rates[i]){
					max = rates[i];
					max_index = i;
				}
			}
/*			System.out.println("츤데레"+rates[0]);
			System.out.println("온화한리더"+rates[1]);
			System.out.println("독재자"+rates[2]);
			System.out.println("부처"+rates[3]);
			System.out.println("푼수"+rates[4]);
			System.out.println("이사람유형"+max);*/
			
			max = Math.round(max);
			if(max_index == chendarae_index){
				totalRates.get(nickName).setCharacter(chendarae);
				totalRates.get(nickName).setSimilarity(max);
			}else if(max_index == calmleader_index){
				totalRates.get(nickName).setCharacter(calmleader);
				totalRates.get(nickName).setSimilarity(max);
			}else if(max_index == dictator_index){
				totalRates.get(nickName).setCharacter(dictator);
				totalRates.get(nickName).setSimilarity(max);
			}else if(max_index == buddha_index){
				totalRates.get(nickName).setCharacter(buddha);
				totalRates.get(nickName).setSimilarity(max);
			}else if(max_index == slicker_index ){
				totalRates.get(nickName).setCharacter(slicker);
				totalRates.get(nickName).setSimilarity(max);
			}
			
		}

		return totalRates;
	}


	private double getChendaeraeRate(ChatRate chatRate, double avg) {
		if(chatRate.getAngrySumChatCount() == 0){
			chatRate.setAngrySumChatCount(1);
		}
		if(chatRate.getDaySumChatCount() == 0){
			chatRate.setDaySumChatCount(1);
		}
		if(chatRate.getFirstReplySumTalk() == 0 ){
			chatRate.setFirstReplySumTalk(1);
		}
		if(chatRate.getSumFirstChatCount() == 0 ){
			chatRate.setSumFirstChatCount(1);
		}
		if(chatRate.getSmileSumChatCount() == 0 ){
			chatRate.setSmileSumChatCount(1);
		}
		
		anglyRate = chatRate.getAngryChatCount()/(double)chatRate.getAngrySumChatCount();
		memChatRate = chatRate.getDayChatCount()/(double)chatRate.getDaySumChatCount();
		fastTalkRate = chatRate.getFirstReplyCountTalk()/(double)chatRate.getFirstReplySumTalk();
		firstTalkRate = chatRate.getFirstChatCount()/ (double)chatRate.getSumFirstChatCount();
		idiotRate = chatRate.getSmileChatCount() / (double)chatRate.getSmileSumChatCount();
		
/*		System.out.println("a"+chatRate.getDayChatCount());
		System.out.println("b"+chatRate.getDaySumChatCount());
		System.out.println(chatRate.getDayChatCount()/(double)chatRate.getDaySumChatCount()  );
		*/
		// 정색형이 평균보다 클 시 유사도 1 아닐시 그대로 가져간다.
		if(anglyRate > avg){
			anglyRate = 1;
		}else{
			anglyRate = chatRate.getAngryChatCount()/(double)chatRate.getAngrySumChatCount();
		}
		// 채팅 비율이 평균보다 작을 시 
		if(memChatRate < avg){
			memChatRate = 1;
		}else{ // 평균 채팅 나누기 자신의 채팅 비율 평균보다 높으면 높을 수록 확률이 낮아짐
			memChatRate = avg / (chatRate.getDayChatCount()/(double)chatRate.getDaySumChatCount());
/*			System.out.println(avg);
			System.out.println((chatRate.getDayChatCount()/chatRate.getDaySumChatCount()));*/
		}
		// 빨리 답장한게 평균보다 높을 시 유사도 1 
		if(fastTalkRate > avg){
			fastTalkRate = 1;
		}else{
			fastTalkRate = chatRate.getFirstReplyCountTalk()/(double)chatRate.getFirstReplySumTalk();
		}
		// 선톡한게 평균보다 낮을시 유사도 1
		if(firstTalkRate < avg){
			firstTalkRate = 1;
		}else{
			firstTalkRate = avg / (chatRate.getFirstReplyCountTalk()/(double)chatRate.getFirstReplySumTalk());
		}
		// 푼수형이 평균보다 낮을 시 유사도 1 
		if(idiotRate < avg ){
			idiotRate = 1;
		}else{
			idiotRate = avg / (chatRate.getSmileChatCount() / (double)chatRate.getSmileSumChatCount());
		}
		
		System.out.println("부처 부정채팅비율"+anglyRate);
		System.out.println("부처 채팅비율"+memChatRate);
		System.out.println("부처 빠른답장 비율"+fastTalkRate);
		System.out.println("부처 선톡 비율"+firstTalkRate);
		System.out.println("부처 긍정채팅비율"+firstTalkRate);
		
		return anglyRate * memChatRate * fastTalkRate * firstTalkRate * idiotRate *100;
	}

	private double getCalmleaderRate(ChatRate chatRate, double avg) {
		
		idiotRate = chatRate.getSmileChatCount() / (double)chatRate.getSmileSumChatCount();
		anglyRate = chatRate.getAngryChatCount()/(double)chatRate.getAngrySumChatCount();
		memChatRate = chatRate.getDayChatCount()/(double)chatRate.getDaySumChatCount();
		fastTalkRate = chatRate.getFirstReplyCountTalk()/(double)chatRate.getFirstReplySumTalk();

		// 채팅비율이 평균이상일시 유사도 1
		if(memChatRate > avg){
			memChatRate = 1;
		}else{ // 아닐시
			memChatRate = chatRate.getDayChatCount()/(double)chatRate.getDaySumChatCount();
		}
		// 푼수가 평균보다 높을시 1 아닐 시 비율 그대로
		if(idiotRate > avg){
			idiotRate = 1;
		}else{
			idiotRate = chatRate.getSmileChatCount() /(double) chatRate.getSmileSumChatCount();
		}
		// 정색 비율이 평균보다 낮을시 유사도 1
		if(anglyRate < avg){
			anglyRate = 1;
		}else{
			anglyRate = avg /  (chatRate.getAngryChatCount()/(double)chatRate.getAngrySumChatCount());
		}
		// 선택을 빨리할시 유사도 1 아닐시 비율 그대로
		if(fastTalkRate > avg){
			fastTalkRate = 1;
		}else{
			fastTalkRate = chatRate.getFirstReplyCountTalk()/(double)chatRate.getFirstReplySumTalk();
		}
		
		System.out.println("조용리더 전체채팅비율"+memChatRate);
		System.out.println("조용리더 부정채팅비율"+anglyRate);
		System.out.println("조용리더 빠른답장 비율"+fastTalkRate);
		System.out.println("조용리더 긍정채팅"+idiotRate);
		
		return memChatRate * idiotRate * anglyRate * fastTalkRate*100;
	}
	
	private double getDictatorRate(ChatRate chatRate, double avg) {
		
		nightTalkRate = chatRate.getNightChatCount()/(double)chatRate.getSumNightChatCount();
		firstTalkRate = chatRate.getFirstChatCount()/(double)chatRate.getSumFirstChatCount();
		memChatRate = chatRate.getDayChatCount()/(double)chatRate.getDaySumChatCount();
		fastTalkRate = chatRate.getFirstReplyCountTalk()/(double)chatRate.getFirstReplySumTalk();

		if(nightTalkRate > avg){
			nightTalkRate = 1;
		}else{
			nightTalkRate = chatRate.getNightChatCount()/(double)chatRate.getSumNightChatCount();
		}
		if(firstTalkRate > avg){
			firstTalkRate = 1;
		}else{
			firstTalkRate = chatRate.getFirstChatCount()/(double)chatRate.getSumFirstChatCount();
		}
		if(memChatRate > avg){
			memChatRate = 1;
		}else{
			memChatRate = chatRate.getDayChatCount()/(double)chatRate.getDaySumChatCount();
		}
		if(fastTalkRate < avg){
			fastTalkRate = 1;
		}else{
			fastTalkRate = avg / (chatRate.getFirstReplyCountTalk()/(double)chatRate.getFirstReplySumTalk());
		}

		System.out.println("독재자 전체채팅비율"+nightTalkRate);
		System.out.println("독재자 선톡비율"+firstTalkRate);
		System.out.println("독재자 전체채팅 비율"+memChatRate);
		System.out.println("독재자 빠른답장비율"+fastTalkRate);
		
		
		return nightTalkRate * firstTalkRate * memChatRate * fastTalkRate*100;
	}
	
	private double getBuddhaRate(ChatRate chatRate, double avg){
	
		memChatRate = chatRate.getDayChatCount()/(double)chatRate.getDaySumChatCount();
		idiotRate = chatRate.getSmileChatCount() / (double)chatRate.getSmileSumChatCount();
		fastTalkRate = chatRate.getFirstReplyCountTalk()/(double)chatRate.getFirstReplySumTalk();
		firstTalkRate = chatRate.getFirstChatCount()/(double)chatRate.getSumFirstChatCount();
		
		if(memChatRate < avg){
			memChatRate = 1;
		}else{
			memChatRate = avg / (chatRate.getDayChatCount()/(double)chatRate.getDaySumChatCount());
		}
		if(idiotRate > avg){
			idiotRate = 1;
		}else{
			idiotRate = chatRate.getSmileChatCount() / (double)chatRate.getSmileSumChatCount();
		}
		if(fastTalkRate < avg){
			fastTalkRate = 1;
		}else{
			fastTalkRate = avg / (chatRate.getFirstReplyCountTalk()/(double)chatRate.getFirstReplySumTalk());
		}
		if(firstTalkRate < avg){
			firstTalkRate = 1;
		}else{
			firstTalkRate = avg / (chatRate.getFirstChatCount()/(double)chatRate.getSumFirstChatCount());
		}

		System.out.println("부처 전체채팅비율"+idiotRate);
		System.out.println("부처 선톡비율"+firstTalkRate);
		System.out.println("부처전체채팅 비율"+memChatRate);
		System.out.println("부처 빠른답장비율"+fastTalkRate);
		
		return memChatRate * idiotRate * fastTalkRate * firstTalkRate*100;
	}
	
	private double getSlickerRate(ChatRate chatRate, double avg) {
		
		firstTalkRate = chatRate.getFirstChatCount()/(double)chatRate.getSumFirstChatCount();
		fastTalkRate = chatRate.getFirstReplyCountTalk()/(double)chatRate.getFirstReplySumTalk();
		memChatRate = chatRate.getDayChatCount()/(double)chatRate.getDaySumChatCount();
	
		if(firstTalkRate > avg ){
			firstTalkRate = 1;
		}else{ 
			firstTalkRate = chatRate.getFirstChatCount()/(double)chatRate.getSumFirstChatCount();
		}
		if(fastTalkRate < avg) {
			fastTalkRate = 1;
		}else{
			fastTalkRate = avg / (chatRate.getFirstReplyCountTalk()/(double)chatRate.getFirstReplySumTalk());
		}
		if(memChatRate < avg) {
			memChatRate = 1;
		}else{
			memChatRate = avg / (chatRate.getDayChatCount()/(double)chatRate.getDaySumChatCount());
		}
		System.out.println("독재자 선톡비율"+firstTalkRate);
		System.out.println("독재자 빠른답장비율"+fastTalkRate);
		System.out.println(chatRate.getNickName());
		System.out.println(chatRate.getDayChatCount());
		System.out.println(chatRate.getDaySumChatCount());
		System.out.println("독재자 전체채팅 비율"+memChatRate);
		
		//  올빼미와 뻐꾸기면서 말이 적은 사람은 없기때문에 제외함
		return firstTalkRate*fastTalkRate*memChatRate*100;
	}

	
}
