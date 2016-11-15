/*************************************************************/
/* Takeda Actos Lunch Learn Quiz *****************************/
/* AT 15147 **************************************************/
/*************************************************************/
/*************************************************************/

package com {

	import gs.TweenLite;	
	import gs.TweenMax;
	import fl.motion.easing.*;	
	import flash.display.*;
	import flash.events.*;
	import flash.utils.*;
	import flash.text.*;
	import flash.net.*;
	import flash.media.*;
	import flash.filters.GlowFilter;
	import fl.controls.UIScrollBar;
	import fl.controls.ScrollBarDirection;
	import flash.system.fscommand;
	import flash.system.System;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	import flash.media.Video;
	import fl.motion.easing.Elastic;	
	
	public class QuizData extends Sprite {
		
		// Constant variables
		public static const STAGEWIDTH:int = 1024.0; // stage.stageWidth
		public static const STAGEHEIGHT:int = 768.0; // stage.stageHeight
		public static const TEAMNAME1:String = "Team Mighty Muscle";
		public static const TEAMNAME2:String = "Team Powerful Pancreas";
		public static const SCOREVALUE:int = 25.0;
		// The const TIEBREAKER establishes the last question as the tiebreaker question from the array
		// The number of categories in XML determines the array question quantity - by choosing one question per category 
		public static const TIEBREAKER:int = 9; 
		
		// General app variables
		private var loader:Loader;
		private var quizData:XML;
		private var quizCopy:XML;
		private var urlLoader:URLLoader;
		private var urlLoader2:URLLoader;
		private var arrAllCategories = new Array();
		private var arrAllQuestions = new Array();
		private var arrCategoryQuestions = new Array();
		private var arrQuestionAnswers = new Array();
		private var numCategories:int;
		private var quizTitle:String;
		private var quizInstructions:String;
		private var arrPlayer1Questions = new Array();
		private var arrPlayer2Questions = new Array();
		private var arrAllAnswers = new Array();
		private var arrPlayer1Answers = new Array();
		private var arrPlayer2Answers = new Array();		
		private var arrTempQuestionHolder = new Array();
		private var arrTempAnswerHolder = new Array();
		private var mcWhiteBG1:mc_whitebg_01;
		private var mcBall2BG1:mc_ball2bg_01;
		private var mcGoldBG1:mc_goldbg_01;
		private var mcBottomBG:mc_bottomBG_03;
		private var mcBorder1:mc_border_01;
		private var btnBeginGame:btn_beginGame_01;
		private var btnGameOver:btn_gameOver_01;
		private var btnPlayAgain:btn_playAgain_01;
		private var btnContinue:btn_continue_01;
		private var btnCloseApp:btn_closeapp_01;
		private var btnClosePopUp:btn_closeapp_01;
		private var btnSafetyClosePopUp:btn_closeapp_01;
		private var btnLargeImageClosePopUp:btn_closeapp_01;
		private var btnStudyInfoClosePopUp:btn_closeapp_01;
		private var btnRefsClosePopUp:btn_closeapp_01;
		private var btnYes:btn_yes_01;
		private var btnNo:btn_no_01;
		private var btnPlay:btn_play_01;
		private var btnNext:btn_next_01;
		private var btnStudyInfo:btn_studyInfo_01;
		private var btnRefs:btn_refs_01;
		private var btnMenu:btn_menu_01;
		private var btnMenuMask:btn_menumask_01;
		private var btnSafety:btn_safety_01;
		private var btnMute:btn_mute_01;
		private var btnUnMute:btn_unmute_01;
		private var muteTrueOrFalse:Boolean = false;
		private var btnPPIACTOS:btn_PPI_ACTOS;
		private var btnPPIACTOPLUSMET:btn_PPI_ACTOPLUSMET;
		private var btnPPIDUETACT:btn_PPI_DUETACT;
		private var mcMightyMuscle:mc_MightyMuscle_01;
		private var mcMightyMuscle2:mc_MightyMuscle_02;
		private var mcCheckMark1:mc_checkMark_01;
		private var mcCheckMark2:mc_checkMark_01;
		private var mcChecked1:Boolean = false;
		private var mcChecked2:Boolean = false;
		private var playerNumber:int = 1;
		private var mcQuizCopyBox:mc_quizCopyBox;
		private var mcQuizCopyBox2:mc_quizCopyBox2;
		private var mcInstructionsCopyBox:mc_instructionsCopyBox;
		private var mcTeamCopyBox:mc_teamCopyBox;
		private var mcQuestionCopyBox:mc_questionCopyBox;
		private var mcQuizCenterCopyBox:mc_quizCenterCopyBox;
		private var mcAnswerCopyBox:mc_answerCopyBox;
		private var mcAnswerCopyBox0:mc_answerCopyBox0;
		private var mcAnswerCopyBox1:mc_answerCopyBox1;
		private var mcAnswerCopyBox2:mc_answerCopyBox2;
		private var mcAnswerCopyBox3:mc_answerCopyBox3;
		private var mcAnswerCopyBox4:mc_answerCopyBox4;
		private var mcResultantAnswerCopyBox:mc_resultantAnswerCopyBox;
		private var mcStudyInfoCopyBox:mc_studyInfoCopyBox;
		private var mcRefsCopyBox:mc_refsCopyBox;
		private var questionNumber0:int = 0;
		private var questionCount1:int = 0;
		private var questionCount2:int = -1;
		private var player1Score:int = 0;
		private var player2Score:int = 0;
		private var mcHeader:mc_header_01;
		private var mcFooter:mc_footer_01;
		private var playerUp:int = 1;
		private var gf1:GlowFilter = new GlowFilter(0xFFCC00, .75, 7, 7, 5, 3, false, false);
		private var gf2:GlowFilter = new GlowFilter(0x666666, .75, 7, 7, 5, 3, false, false);
		private var mcScoreboard:mc_scoreboardBox;
		private var mcTextBlock1:mc_TextBlock1;
		private var mcTextBlock2:mc_TextBlock2;
		private var mcTextBlock3:mc_TextBlock3;
		private var mcTextBlock4:mc_TextBlock4;
		private var mcTextBlock5:mc_TextBlock5;
		private var mcTextBlock6:mc_TextBlock6;
		private var mcTextBlock7:mc_TextBlock7;
		private var mcPickYourTeam:mc_PickYourTeam;
		private var mcTeam1:mc_Team1;
		private var mcTeam2:mc_Team2;
		private var mcSmallImageHolder:mc_SmallImageHolder;
		private var mcLargeImageHolder:mc_LargeImageHolder;
		private var mcSafetyLargeImageHolder:mc_LargeImageHolder;
		private var copyWidth:int = 0;
		private var mcShadow:mc_shadow_01;
		private var mcSafetyShadow:mc_shadow_01;
		private var mcCloseAppShadow:mc_shadow_01;
		private var mcMuscles01:mc_Muscles_01;
		private var mcMuscles02:mc_Muscles_02;
		private var mcPancreas01:mc_Pancreas_01;
		private var mcPancreas02:mc_Pancreas_02;
		private var mcFinalFrameBG01:mc_finalFrameBG_01;
		private var mcMusclesAnimeRightAnswer01:mc_MusclesAnimeRightAnswer_01;
		private var mcPancreasAnimeRightAnswer01:mc_PancreasAnimeRightAnswer_01;
		private var mcDuetActLogo:mc_DuetActLogo_01;
		private var mcActosPlusMetLogo:mc_ActosPlusMetLogo_01;
		private var delay:Timer;
		private var mcSafetyScrollBox01:mc_SafetyScrollBox_01;
		private var numberOfQuestions1:int = 0;
		private var numberOfQuestions2:int = 0;
		private var questionTotal1:int = 0;
		private var questionTotal2:int = 0;
		private var numCount:int = 0;
		private var tieGame:Boolean = false;
		private var SoundURLRequest:URLRequest;
		private var AppSound:Sound;
		private var mcInvisiPanel:mc_InvisiPanel;
		private var mcSmallMagnifyingGlass:mc_SmallMagnifyingGlass;
		private var mcQuestionTally:mc_QuestionTally;
		private var letter:String;
		private var mcCellWallBG:mc_CellWallBG;
		private var fromEOG:Boolean = false;
		private var tweenDelayVar:int = 0;
		private var mcResultantAnswerFix:mc_ResultantAnswerFix;
		private var safetyOpen:Boolean = false;
		private var closeAppOpen:Boolean = false;
		private var appMusicDone:Boolean = false;
		private var menuOpen:Boolean = false;
		private var refsOpen:Boolean = false;
		private var studyInfoOpen:Boolean = false;
		private var largeImageOpen:Boolean = false;
		private var characterAnime:String;
		private var appMusicFadeTrans = new SoundTransform(0.50, 0);
		private var soundI:Number = 0;
		private var stoppedByUser:Boolean = false;

		// App music channel variables and load
		private var appMusicRequest:URLRequest = new URLRequest("music/MatchThe5_2.mp3");
		private var appMusicTrans:SoundTransform = new SoundTransform(0.50, 0);
		private var appMusic:Sound = new Sound(appMusicRequest);
		private var appMusicChannel:SoundChannel;
		private var appMusicPosition:Number = 0;
				
		// Button click sound variables and load
		private var clickSoundRequest:URLRequest = new URLRequest("sounds/button_click_2.mp3");
		private var clickSound:Sound = new Sound(clickSoundRequest);
		
		// Tick-tock tiebreaker music channel variables and load
		private var tickTockSoundRequest:URLRequest = new URLRequest("sounds/tiebreaker_ticktock_2.mp3");
		private var tickTockSound:Sound = new Sound(tickTockSoundRequest);
		private var tickTockSoundChannel:SoundChannel;
		private var tickTockSoundPosition:Number = 0;
		
		// Tiebreaker right answer sound variables and load
		private var tadaSoundRequest:URLRequest = new URLRequest("sounds/rightanswer_tiebreaker_2.mp3");
		private var tadaSound:Sound = new Sound(tadaSoundRequest);
		
		// Awe wrong answer sound variables and load
		private var aweSoundRequest:URLRequest = new URLRequest("sounds/wronganswer_awe_2.mp3");
		private var aweSound:Sound = new Sound(aweSoundRequest);
		
		// Ball ding sound variables and load
		private var ballDingSoundRequest:URLRequest = new URLRequest("sounds/ball_ding_2.mp3");
		private var ballDingSound:Sound = new Sound(ballDingSoundRequest);
		
		// Answer whoosh sound variables and load
		private var whooshSoundRequest:URLRequest = new URLRequest("sounds/bothanswers_whoosh_2.mp3");
		private var whooshSound:Sound = new Sound(whooshSoundRequest);
		
		// Finale applause sound variables and load
		private var finaleApplauseSoundRequest:URLRequest = new URLRequest("sounds/finale_applause_2.mp3");
		private var finaleApplauseSound:Sound = new Sound(finaleApplauseSoundRequest);
		
		// Question snippet sound variables and load
		private var questionSnippetSoundRequest:URLRequest = new URLRequest("sounds/question_snippet_2.mp3");
		private var questionSnippetSound:Sound = new Sound(questionSnippetSoundRequest);
		
		// Right answer applause sound variables and load
		private var answerApplauseSoundRequest:URLRequest = new URLRequest("sounds/rightanswer_applause_2.mp3");
		private var answerApplauseSound:Sound = new Sound(answerApplauseSoundRequest);
		
		// Right answer net sound variables and load
		private var answerNetSoundRequest:URLRequest = new URLRequest("sounds/rightanswer_net_2.mp3");
		private var answerNetSound:Sound = new Sound(answerNetSoundRequest);
		
		// Wrong answer ding sound variables and load
		private var answerDingSoundRequest:URLRequest = new URLRequest("sounds/wronganswer_ding_2.mp3");
		private var answerDingSound:Sound = new Sound(answerDingSoundRequest);
		
		// Anime audio channel variables
		private var animeAudioRequest:URLRequest;
		private var animeAudio:Sound;
		private var animeAudioChannel:SoundChannel;
		private var animeAudioPosition:Number = 0;	
		
		// Video channel variables
		var animeVidConnection:NetConnection;
		var animeVidStream:NetStream; 
		var animeVid:Video;
		var animeVidClient:Object;
		
	/*************************************************************/
		// Quiz data & copy constructor
		public function QuizData() {
			var urlRequest:URLRequest = new URLRequest("xml/QuizData.xml");
			urlLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, xmlCompleteListener1);
			urlLoader.load(urlRequest);	
			
			var urlRequest2:URLRequest = new URLRequest("xml/QuizCopy.xml");
			urlLoader2 = new URLLoader();
			urlLoader2.addEventListener(Event.COMPLETE, xmlCompleteListener2);
			urlLoader2.load(urlRequest2);
			
			// Set screen size display params
			fscommand("fullscreen","true");
			fscommand("allowscale","false");
	
		}
		
		// Method upon XML load completion
		private function xmlCompleteListener1(e:Event):void {
			quizData = new XML(urlLoader.data);
			setAllCategoriesAndQuestions();
			stageBeginGame();
		}
		
		// Method upon XML load completion
		private function xmlCompleteListener2(e:Event):void {
			quizCopy = new XML(urlLoader2.data);
			setQuizInstructions(quizCopy.quizinstructions.toString());
		}
		
	/*************************************************************/	
		// Application asset constructors
		
		// Method for setting and getting Ball2 BG
		public function setAndGetBall2BG1() {			
			mcBall2BG1 = new mc_ball2bg_01();
			mcBall2BG1.x = -328.0;
			mcBall2BG1.y = -141.0;				
			
			return mcBall2BG1;
		}	
		
		// Method for setting and getting Cell Wall BG
		public function setAndGetCellWallBG() {			
			mcCellWallBG = new mc_CellWallBG();
			mcCellWallBG.x = 0.0;
			mcCellWallBG.y = 67.0;				
			
			return mcCellWallBG;
		}			
		
		// Method for setting and getting Bottom BG
		public function setAndGetBottomBG() {			
			mcBottomBG = new mc_bottomBG_03();
			mcBottomBG.x = 0.0;
			mcBottomBG.y = 68.0;				
			
			return mcBottomBG;
		}				
		
		// Method for setting and getting White BG
		public function setAndGetWhiteBG1() {			
			mcWhiteBG1 = new mc_whitebg_01();
			mcWhiteBG1.x = 0.0;
			mcWhiteBG1.y = 0.0;				
			
			return mcWhiteBG1;
		}	
		
		// Method for setting and getting Gold BG
		public function setAndGetGoldBG1() {			
			mcGoldBG1 = new mc_goldbg_01();
			mcGoldBG1.x = -328.0;
			mcGoldBG1.y = -141.0;				
			
			return mcGoldBG1;
		}	
		
		// Method for setting and getting Border 1
		public function setAndGetBorder1() {			
			mcBorder1 = new mc_border_01();
			mcBorder1.x = 0.0;
			mcBorder1.y = 0.0;				
			
			return mcBorder1;
		}			
		
		// Method for setting Quiz Instructions
		public function setQuizInstructions(copy) {
			quizInstructions = copy;
		}	
		
		// Method for getting quiz instructions
		public function getQuizInstructions() {
			return quizInstructions;
		}
		
		// Method for setting and getting Close App button
		public function setAndGetCloseAppButton() {	
			btnCloseApp = new btn_closeapp_01();
			btnCloseApp.x = 986.0;
			btnCloseApp.y = 30.0;
			btnCloseApp.addEventListener(MouseEvent.CLICK, closeApp);	
			
			return btnCloseApp;
		}				
		
		// Method for setting and getting ActosPlusMet Logo
		public function setAndGetActosPlusMetLogo() {	
			mcActosPlusMetLogo = new mc_ActosPlusMetLogo_01();
			mcActosPlusMetLogo.x = 0.0;
			mcActosPlusMetLogo.y = 0.0;
			
			return mcActosPlusMetLogo;
		}	
		
		// Method for setting and getting DuetAct Logo
		public function setAndGetDuetActLogo() {	
			mcDuetActLogo = new mc_DuetActLogo_01();
			mcDuetActLogo.x = 0.0;
			mcDuetActLogo.y = 0.0;
			
			return mcDuetActLogo;
		}				
		
		// Method for setting and getting Header
		public function setAndGetHeader() {	
			mcHeader = new mc_header_01();
			mcHeader.x = 0.0;
			mcHeader.y = 0.0;
			
			return mcHeader;
		}
		
		// Method for setting and getting Footer
		public function setAndGetFooter() {	
			mcFooter = new mc_footer_01();
			mcFooter.x = 0.0;
			mcFooter.y = 648.0;			
			
			return mcFooter;
		}				
		
		// Method for setting and getting Begin Game button
		public function setAndGetBeginGameButton() {	
			btnBeginGame = new btn_beginGame_01();
			btnBeginGame.x = 405.0;
			btnBeginGame.y = 650.0;
			btnBeginGame.width = 213.5;
			btnBeginGame.height = 59.5;
			
			return btnBeginGame;
		}
		
		// Method for setting and getting Game Over button
		public function setAndGetGameOverButton() {	
			btnGameOver = new btn_gameOver_01();
			btnGameOver.x = 35.0;
			btnGameOver.y = 695.0;
			btnGameOver.width = 164.7;
			btnGameOver.height = 45.7;
			btnGameOver.addEventListener(MouseEvent.CLICK, gameOver);
			
			return btnGameOver;
		}			
		
		// Method for setting and getting Play Again button
		public function setAndGetPlayAgainButton() {	
			btnPlayAgain = new btn_playAgain_01();
			btnPlayAgain.x = 820.0;
			btnPlayAgain.y = 695.0;
			btnPlayAgain.width = 164.7;
			btnPlayAgain.height = 45.7;
			btnPlayAgain.addEventListener(MouseEvent.CLICK, playAgain);
			
			return btnPlayAgain;
		}		
		
		// Method for setting and getting Continue button
		public function setAndGetContinueButton() {			
			btnContinue = new btn_continue_01();
			btnContinue.x = 220.0;
			btnContinue.y = 690.0;
			btnContinue.width = 164.7;
			btnContinue.height = 45.7;			
			
			return btnContinue;
		}
		
		// Method for setting and getting Play button
		public function setAndGetPlayButton() {			
			btnPlay = new btn_play_01();
			btnPlay.x = 620.0;
			btnPlay.y = 690.0;
			btnPlay.width = 164.7;
			btnPlay.height = 45.7;					
			
			return btnPlay;
		}
		
		// Method for setting and getting Menu button
		public function setAndGetMenuButton() {			
			btnMenu = new btn_menu_01();
			btnMenu.x = 839.0;
			btnMenu.y = 700.0;
			btnMenu.width = 164.7;
			btnMenu.height = 45.7;					
			
			return btnMenu;
		}
		
		// Method for setting and getting Menu Mask button
		public function setAndGetMenuMaskButton() {			
			btnMenuMask = new btn_menumask_01();
			btnMenuMask.x = 839.0;
			btnMenuMask.y = 700.0;
			btnMenuMask.width = 164.7;
			btnMenuMask.height = 20.0;					
			
			return btnMenuMask;
		}									
		
		// Method for setting and getting Study Info button
		public function setAndGetStudyInfoButton() {			
			btnStudyInfo = new btn_studyInfo_01();
			btnStudyInfo.x = 105.0;
			btnStudyInfo.y = 550.0;				
			
			return btnStudyInfo;
		}		
		
		// Method for setting and getting Refs button
		public function setAndGetRefsButton() {			
			btnRefs = new btn_refs_01();
			btnRefs.x = 355.0;
			btnRefs.y = 550.0;				
			
			return btnRefs;
		}				
		
		// Method for setting and getting Next button
		public function setAndGetNextButton() {			
			btnNext = new btn_next_01();
			btnNext.x = 555.0;
			btnNext.y = 540.0;
			btnNext.width = 91.5;
			btnNext.height = 26.4;						
			
			return btnNext;
		}							
		
		// Method for setting and getting Mighty Muscle button
		public function setAndGetMightyMuscleButton() {			
			mcMightyMuscle = new mc_MightyMuscle_01();
			mcMightyMuscle.x = STAGEWIDTH/2 - 225.0;
			mcMightyMuscle.y = 391.0;
			mcMightyMuscle.scaleX = 1.30;
			mcMightyMuscle.scaleY = 1.30;
			
			return mcMightyMuscle;
		}
			
		// Method for setting and getting Mighty Muscle 2 button
		public function setAndGetMightyMuscle2Button() {						
			mcMightyMuscle2 = new mc_MightyMuscle_02();
			mcMightyMuscle2.x = STAGEWIDTH/2 + 125.0;
			mcMightyMuscle2.y = 391.0;
			mcMightyMuscle2.scaleX = 1.30;
			mcMightyMuscle2.scaleY = 1.30;			

			return mcMightyMuscle2;
		}	
		
		// Method for setting and getting Scoreboard
		public function setAndGetScoreboard() {						
			mcScoreboard = new mc_scoreboardBox();
			mcScoreboard.x = (STAGEWIDTH/2 - 512) + 20;
			mcScoreboard.y = (STAGEHEIGHT/2 - 384) + 660.0;
			
			return mcScoreboard;
		}			
		
		// Method for setting and getting InvisiPanel
		public function setAndGetInvisiPanel() {			
			mcInvisiPanel = new mc_InvisiPanel();
			mcInvisiPanel.x = 0.0;
			mcInvisiPanel.y = 0.0;
			mcInvisiPanel.width = 650;
			mcInvisiPanel.height = 500;					
			
			return mcInvisiPanel;
		}		
		
		// Method for setting all quiz categories and questions
		public function setAllCategoriesAndQuestions() {
			// Retrieve all categories
			numCategories = quizData.category.length();
			for (var i:int=0; i<numCategories; i++) {
				arrAllCategories[i] = quizData.category[i].@title.toString(); // Category Name
				//arrAllCategories[i] = quizData.category[i].@id; // Category Unique ID
			}
			// Retrieve all questions
			for (var j:int=0; j<arrAllCategories.length; j++) {
				arrAllQuestions[j] = quizData.category[j].question.copy.children(); // Question Copy
				//arrAllQuestions[j] = quizData.category[j].question.@qid; // Question Unique ID
			}
			// Parse player questions
			var player1count:int=0;
			var player2count:int=0;
			for (var k:int=0; k<arrAllCategories.length; k++) {
				var l:int=0;
				var allQuestions:XMLList = quizData.*;
				var questionsByCategoryTitle:XMLList = allQuestions.(@title == arrAllCategories[k]).children();
				var questionsByQID:XMLList = questionsByCategoryTitle.@qid;

					// Begin gathering of question sets for players
					// First get all questions for a category
					for (var m:int=0; m<questionsByCategoryTitle.copy.children().length(); m++) {
						arrTempQuestionHolder[m] = questionsByCategoryTitle.child("copy")[m];
						arrTempAnswerHolder[m] = questionsByQID[m];
					}
					
						// Pick a random quesion from that category for Player 1
						var randomNumber1:int = Math.floor(Math.random() * questionsByCategoryTitle.copy.children().length());
						arrPlayer1Questions[player1count] = arrTempQuestionHolder[randomNumber1];
						arrPlayer1Answers[player1count] = arrTempAnswerHolder[randomNumber1];
						arrTempQuestionHolder.splice(randomNumber1,1);
						arrTempAnswerHolder.splice(randomNumber1,1);
						player1count++;
							
							// Pick a random quesion from that category for Player 2
							if (questionsByCategoryTitle.copy.children().length() == 2) {
								// If question count is only 2 then choose the only other available question for Player 2
								arrPlayer2Questions[player2count] = arrTempQuestionHolder[0];
								arrPlayer2Answers[player2count] = arrTempAnswerHolder[0];
								arrTempQuestionHolder.splice(0,1);
								player2count++;
							} else {
								// If question count is greater than 2 then pull a new random question for Player 2
								var randomNumber2:int = Math.floor(Math.random() * arrTempQuestionHolder.length);
								arrPlayer2Questions[player2count] = arrTempQuestionHolder[randomNumber2];
								arrPlayer2Answers[player2count] = arrTempAnswerHolder[randomNumber2];
								arrTempQuestionHolder.splice(randomNumber2,1);
								player2count++;
							}
							
						// Clear temp question & answer holder arrays via reinstantiation
						arrTempQuestionHolder = new Array();
						arrTempAnswerHolder = new Array();
						
					// End gathering of question sets for players	
										
			}
		
		}
		
		// Method for setting all questions from a category by category id
		public function setQuestionsByCategoryID(id) {
			var allQuestions:XMLList = quizData.*;
			var questionsByCategoryID:XMLList = allQuestions.(@id == id).children();
			var catID = id;
			setAnswersByQuestionID(catID,1);
		}		
		
		// Method for setting all questions from a category by category title
		public function setQuestionsByCategoryTitle(title) {
			var allQuestions:XMLList = quizData.*;
			var questionsByCategoryTitle:XMLList = allQuestions.(@title == title).children();
			var catID = allQuestions.(@title == title).@id;
			setAnswersByQuestionID(catID,1);
			// DEV: Display question copy
			//trace(questionsByCategoryTitle.child("copy")[0]);
			// DEV: Display number of questions
			//trace(questionsByCategoryTitle.copy.children().length());			
		}
		
		// Method for setting the answers to a specific category question
		public function setAnswersByQuestionID(catID,id2) {
			var allQuestions:XMLList = quizData.*;
			var questionsByCategoryID:XMLList = allQuestions.(@id == catID).children();
			var answersByQuestionID:XMLList = questionsByCategoryID.(@id == id2).child("answer");
			// DEV: Display answers to a question
			//trace(answersByQuestionID.children());
			// DEV: Display number of answers
			//trace(answersByQuestionID.children().length());			
		}
		
		// Method for generating a random number 1-n
		public function setRandom(number) {
			var randomNumber:int = Math.floor(Math.random() * number) + 1;
		}
		
		// Method for getting all quiz categories
		public function getAllCategories() {
			return arrAllCategories;
		}
	
		// Method for getting all quiz questions
		public function getAllQuestions() {
			return arrAllQuestions;
		}
		
		// Method for removing all stage assets
		public function removeAllAssets() {
			while (numChildren > 0) {
				removeChildAt(0);	
			}
		}
		
		// Methods for the background Actos balls anime
		public function backgroundActosAnime(qty) {
			
			var mcBall:mc_ball;
			var balls:Array;
			var numBalls:Number = qty;
			var bounce:Number = -0.5;
			var spring:Number = 0.05;
			var gravity:Number = 0.0;
		
			balls = new Array();
		
			for(var i:uint = 0; i < numBalls; i++)
			{
				var ball:Ball = new Ball(Math.random() * 30 + 20);
				ball.x = Math.random() * STAGEWIDTH;
				ball.y = Math.random() * STAGEHEIGHT;
				ball.vx = Math.random() * 6 - 3;
				ball.vy = Math.random() * 6 - 3;
				addChild(ball);
				balls.push(ball);
			}
			
			this.addEventListener(Event.ENTER_FRAME, animateBalls);		
	
			function animateBalls(event:Event):void {
				
				// Load Ball Ding Sound 1
				//SoundURLRequest = new URLRequest("sounds/Ball_Ding_global.mp3");
				//AppSound = new Sound();
				//AppSound.load(SoundURLRequest);
				
				for(var i:uint = 0; i < numBalls - 1; i++)
				{
					var ball0:Ball = balls[i];
					for(var j:uint = i + 1; j < numBalls; j++)
					{
						var ball1:Ball = balls[j];
						var dx:Number = ball1.x - ball0.x;
						var dy:Number = ball1.y - ball0.y;
						var dist:Number = Math.sqrt(dx * dx + dy * dy);
						var minDist:Number = ball0.radius + ball1.radius;
						if(dist < minDist)
						{
							var angle:Number = Math.atan2(dy, dx);
							var tx:Number = ball0.x + dx / dist * minDist;
							var ty:Number = ball0.y + dy / dist * minDist;
							var ax:Number = (tx - ball1.x) * spring;
							var ay:Number = (ty - ball1.y) * spring;
							ball0.vx -= ax;
							ball0.vy -= ay;
							ball1.vx += ax;
							ball1.vy += ay;
						}
					}
				}
				
				for(i = 0; i < numBalls; i++)
				{
					var ball:Ball = balls[i];
					move(ball);
				}
			}
			
			function move(ball:Ball):void {
				ball.vy += gravity;
				ball.x += ball.vx;
				ball.y += ball.vy;
				if(ball.x + ball.radius > STAGEWIDTH)
				{
					ball.x = STAGEWIDTH - ball.radius;
					ball.vx *= bounce;
					//AppSound.play(0, 1);
				}
				else if(ball.x - ball.radius < 0)
				{
					ball.x = ball.radius;
					ball.vx *= bounce;
				}
				if(ball.y + ball.radius > STAGEHEIGHT)
				{
					ball.y = STAGEHEIGHT - ball.radius;
					ball.vy *= bounce;
					//AppSound.play(0, 1);
				}
				else if(ball.y - ball.radius < 0)
				{
					ball.y = ball.radius;
					ball.vy *= bounce;
				}
			}
		}		
		
	/*************************************************************/
		// Method for stage - Begin Game
		public function stageBeginGame() {
			
			// Play app music
			if (fromEOG == false) { 
				//appMusicChannel = appMusic.play(appMusicPosition,1);
				//appMusicChannel.addEventListener(Event.SOUND_COMPLETE, onPlaybackComplete);				
			}			
			
			// Add this screen's primary assets to stage from library
			addChild(setAndGetWhiteBG1());
			backgroundActosAnime(25);
			addChild(setAndGetHeader());
			addChild(setAndGetGoldBG1());
			addChild(setAndGetBorder1());
			addChild(setAndGetCloseAppButton());
			
			// Set and display Text Block 1
			mcTextBlock1 = new mc_TextBlock1();
			mcTextBlock1.x = STAGEWIDTH/2;
			mcTextBlock1.y = STAGEHEIGHT/2 - 100.0;	
			addChild(mcTextBlock1);

			addChild(setAndGetBeginGameButton());
			btnBeginGame.addEventListener(MouseEvent.CLICK, f_beginGame);		

		}	
		
		private function f_beginGame(e:MouseEvent):void {
			clickSound.play();	
			removeEventListener(MouseEvent.CLICK, f_beginGame);
			stagePickTeam();				
		}			
		
	/*************************************************************/
		// Method for stage - Pick Team
		public function stagePickTeam() {

			// Remove all stage assets
			removeAllAssets();
			
			// Add this screen's primary assets to stage from library
			addChild(setAndGetWhiteBG1());
			addChild(setAndGetBall2BG1());
			addChild(setAndGetHeader());
			addChild(setAndGetFooter());
			addChild(setAndGetBorder1());
			addChild(setAndGetCloseAppButton());
			
			// Set and display Text Block 2
			mcTextBlock2 = new mc_TextBlock2();
			mcTextBlock2.x = STAGEWIDTH/2;
			mcTextBlock2.y = STAGEHEIGHT/2 - 200.0;	
			addChild(mcTextBlock2);
			
			// Set and display Pick Your Team copy
			mcPickYourTeam = new mc_PickYourTeam();
			mcPickYourTeam.x = STAGEWIDTH/2;
			mcPickYourTeam.y = STAGEHEIGHT/2 - 25.0;	
			addChild(mcPickYourTeam);
			
			// Add Muscles to stage from library
			mcMuscles01 = new mc_Muscles_01();
			mcMuscles01.x = 25.0;
			mcMuscles01.y = 180.1;
			mcMuscles01.rotation = -7;
			addChild(mcMuscles01);
		
			// Add Pancreas to stage from library
			mcPancreas01 = new mc_Pancreas_01();
			mcPancreas01.x = 725.0;
			mcPancreas01.y = 257.6;
			addChild(mcPancreas01);			
			
			addChild(setAndGetMightyMuscleButton());
			addChild(setAndGetMightyMuscle2Button());
			
			// Add Checkmarks to stage from libbrary and set to initial state of invisible
			mcCheckMark1 = new mc_checkMark_01();
			mcCheckMark1.x = STAGEWIDTH/2 - 260.0;
			mcCheckMark1.y = 391.0;
			addChild(mcCheckMark1);
			mcCheckMark1.visible = false;
			mcCheckMark2 = new mc_checkMark_01();
			mcCheckMark2.x = STAGEWIDTH/2 + 85.0;
			mcCheckMark2.y = 391.0;	
			addChild(mcCheckMark2);
			mcCheckMark2.visible = false;

			mcMightyMuscle.addEventListener(MouseEvent.MOUSE_OVER, f_overMightyMuscle);
			mcMightyMuscle2.addEventListener(MouseEvent.MOUSE_OVER, f_overMightyMuscle2);			
			
		}
		
		private function f_overMightyMuscle(e:MouseEvent):void {
			mcMightyMuscle.gotoAndPlay(2);
			mcMightyMuscle.addEventListener(MouseEvent.MOUSE_OUT, f_outMightyMuscle);
			if (mcChecked1 == false) {
				mcMightyMuscle.addEventListener(MouseEvent.CLICK, f_clickMightyMuscle);
			}
		}	
		
		private function f_outMightyMuscle(e:MouseEvent):void {
			mcMightyMuscle.gotoAndStop(1);
		}
		
		private function f_clickMightyMuscle(e:MouseEvent):void {
			clickSound.play();	
			mcMightyMuscle.gotoAndStop(1);
			mcMightyMuscle.removeEventListener(MouseEvent.CLICK, f_clickMightyMuscle);
			mcMightyMuscle2.addEventListener(MouseEvent.CLICK, f_clickMightyMuscle2);
			
			// Place check mark on stage and set 1 player questions
				mcChecked1 = true;
				playerNumber = 1;
				mcCheckMark1.visible = true;
				if (mcCheckMark2.visible = true) {
					mcCheckMark2.visible = false;
				}
				
				addChild(setAndGetContinueButton());
				btnContinue.addEventListener(MouseEvent.CLICK, f_continue);
				addChild(setAndGetPlayButton());
				btnPlay.addEventListener(MouseEvent.CLICK, f_play);					
			
		}
		
		private function f_overMightyMuscle2(e:MouseEvent):void {
			mcMightyMuscle2.gotoAndPlay(2);
			mcMightyMuscle2.addEventListener(MouseEvent.MOUSE_OUT, f_outMightyMuscle2);
			if (mcChecked2 == false) {	
				mcMightyMuscle2.addEventListener(MouseEvent.CLICK, f_clickMightyMuscle2);
			}
		}	
		
		private function f_outMightyMuscle2(e:MouseEvent):void {
			mcMightyMuscle2.gotoAndStop(1);
		}		
		
		private function f_clickMightyMuscle2(e:MouseEvent):void {
			clickSound.play();	
			mcMightyMuscle2.gotoAndStop(1);
			mcMightyMuscle2.removeEventListener(MouseEvent.CLICK, f_clickMightyMuscle2);
			mcMightyMuscle.addEventListener(MouseEvent.CLICK, f_clickMightyMuscle);
			
			// Place check mark on stage and set 2 player questions
				mcChecked2 = true;
				playerNumber = 2;
				mcCheckMark2.visible = true;
				if (mcCheckMark1.visible = true) {
					mcCheckMark1.visible = false;
				}
				
				addChild(setAndGetContinueButton());
				btnContinue.addEventListener(MouseEvent.CLICK, f_continue);
				addChild(setAndGetPlayButton());
				btnPlay.addEventListener(MouseEvent.CLICK, f_play);	
		}
		
	/*************************************************************/
		// Method for stage - Instructions
		public function f_continue(e:MouseEvent):void {
			
			clickSound.play();
			
			// Remove all stage assets
			removeAllAssets();	
		
			// Add this screen's primary assets to stage from library
			addChild(setAndGetWhiteBG1());
			addChild(setAndGetBall2BG1());
			addChild(setAndGetBottomBG());
			addChild(setAndGetHeader());
			addChild(setAndGetFooter());
			
			// Add Quiz Copy Box to stage from library
			mcQuizCopyBox = new mc_quizCopyBox();
			mcQuizCopyBox.x = 275.0;
			mcQuizCopyBox.y = 110.0;
			mcQuizCopyBox.width = 600.0;
			mcQuizCopyBox.height = 350.0;
			addChild(mcQuizCopyBox);	
			
			addChild(setAndGetBorder1());
			addChild(setAndGetCloseAppButton());
			addChild(setAndGetPlayButton());
			btnPlay.x = STAGEWIDTH/2 - (btnPlay.width/2);
			btnPlay.y = 690.0;

			btnPlay.addEventListener(MouseEvent.CLICK, f_play);	
			
			// Add Muscles to stage from library
			mcMuscles01 = new mc_Muscles_01();
			mcMuscles01.x = 58.0;
			mcMuscles01.y = 145.1;
			mcMuscles01.scaleX = .75;
			mcMuscles01.scaleY = .75;
			mcMuscles01.rotation = -10;
			addChildAt(mcMuscles01, getChildIndex(mcQuizCopyBox));	
			
			// Add mc_instructionsCopyBox_01 to stage from library
			mcInstructionsCopyBox = new mc_instructionsCopyBox();
			mcInstructionsCopyBox.x = 295.0;
			mcInstructionsCopyBox.y = 115.0;
			mcInstructionsCopyBox.width = 600;
			addChild(mcInstructionsCopyBox);	
			
			var gameInstructions:String = quizCopy.quizinstructions.(@players == playerNumber).toString();
			
			mcInstructionsCopyBox.txt_InstructionsCopyBox.width = 550;
			mcInstructionsCopyBox.txt_InstructionsCopyBox.height = 400;
			mcInstructionsCopyBox.txt_InstructionsCopyBox.htmlText = gameInstructions;

		}	
		
	/*************************************************************/
		// Method for stage - Play
		public function f_play(e:MouseEvent):void {
			
			clickSound.play();	
			
			// Remove all stage assets
			removeAllAssets();
			
			PlayGame(playerUp);
		}
		
		// Method for processing a question
		public function PlayGame(playerUp):void {
			
			// Remove all stage assets
			removeAllAssets();			
			
			//questionSnippetSound.play();
			
			// Add this screen's primary assets to stage from library
			addChild(setAndGetWhiteBG1());
			addChild(setAndGetBall2BG1());
			addChild(setAndGetHeader());
			addChild(setAndGetFooter());
			addChild(setAndGetBorder1());
			addChild(setAndGetCloseAppButton());
			addChild(setAndGetScoreboard());					
			mcScoreboard.mc_redbar_01.width = mcScoreboard.mc_redbar_01.width - (player1Score * SCOREVALUE);
			mcScoreboard.mc_grnbar_01.width = mcScoreboard.mc_grnbar_01.width - (player2Score * SCOREVALUE);
			mcScoreboard.txt_Score1.htmlText = "<b>" + (100 - (player1Score * 10)) + "</b>";
			mcScoreboard.txt_Score2.htmlText = "<b>" + (100 - (player2Score * 10)) + "</b>";				
			
			// Add Quiz Copy Box to stage from library
			mcQuizCopyBox = new mc_quizCopyBox();
			mcQuizCopyBox.x = 75.0;
			mcQuizCopyBox.y = 100.0;
			mcQuizCopyBox.width = 600.0;
			addChild(mcQuizCopyBox);
			
			// Add Team Copy Box to stage from library
			mcTeamCopyBox = new mc_teamCopyBox();
			mcTeamCopyBox.x = 90.0;
			mcTeamCopyBox.y = 110.0;
			addChild(mcTeamCopyBox);
			
			// Add Question Copy Box to stage from library
			mcQuestionCopyBox = new mc_questionCopyBox();
			mcQuestionCopyBox.x = 90.0;
			mcQuestionCopyBox.y = 145.0;
			addChild(mcQuestionCopyBox);						
			
			// BEGIN GAME PLAY
			if (playerNumber == 1) {
			
			/*************************************************************/
			/* Player 1 Game Play ****************************************/
			/*************************************************************/
			
				// Add Muscles Anime to stage from library
				mcMusclesAnimeRightAnswer01 = new mc_MusclesAnimeRightAnswer_01();
				mcMusclesAnimeRightAnswer01.x = STAGEWIDTH/2 - (mcMusclesAnimeRightAnswer01.width/2);
				mcMusclesAnimeRightAnswer01.y = STAGEHEIGHT/2 - (mcMusclesAnimeRightAnswer01.height/2) - 28;
				addChildAt(mcMusclesAnimeRightAnswer01, getChildIndex(mcQuizCopyBox));	
			
				// Adjust Scoreboard display
				mcScoreboard.mc_powerfulpancreasfilter.visible = false;
				mcScoreboard.mc_scoreboardTeam2Name.visible = false;
				mcScoreboard.mc_scoreboardTeam2Grid.visible = false;
				mcScoreboard.mc_grnbar_01.visible = false;
				mcScoreboard.txt_Score2.visible = false;
				mcScoreboard.mc_pointer2.visible = false;
				mcScoreboard.mc_scoreboardGridBG_02.visible = false;
				
				numberOfQuestions1 = arrPlayer1Questions.length - 1;
				
				if (questionCount1 < numberOfQuestions1) {
										
						// Determine header logo based on question drug category
						var questionDrug:XMLList = quizData.category.question.(@qid == arrPlayer1Answers[questionCount1]).child("drug");
						if (questionDrug[0] == "ACTOPLUSMET") {
							addChild(setAndGetActosPlusMetLogo());
						} else if (questionDrug[0] == "DUETACT") {
							addChild(setAndGetDuetActLogo());
						}										
										
						questionNumber0 = questionCount1 + 1;				
										
						mcTeamCopyBox.txt_TeamNameBox.text = TEAMNAME1;
						mcQuestionCopyBox.txt_QuizQuestionBox.width = 550;
						mcQuestionCopyBox.txt_QuizQuestionBox.htmlText = "<b>" + arrPlayer1Questions[questionCount1] + "</b>";
						mcQuestionCopyBox.txt_QuizQuestionBox.height = mcQuestionCopyBox.txt_QuizQuestionBox.textHeight + 60;
						
						// Display Question Tally
						if (questionNumber0 < TIEBREAKER) {
							mcQuestionTally = new mc_QuestionTally();
							mcQuestionTally.x = 70;
							mcQuestionTally.y = 625;
							addChild(mcQuestionTally);
							mcQuestionTally.txt_QuestionTallyCopy.htmlText = "<b>" + questionNumber0 + " of " + (TIEBREAKER - 1) + "</b>";
						}
						
						//INCLUDE ANSWER LOGIC FUNCTION CALL HERE
						getAnswers1(questionCount1);
						
				// Add Menu Button to stage from library
				addChild(setAndGetMenuButton());
				btnMenu.addEventListener(MouseEvent.MOUSE_OVER, menuMouseOver);	
						
				} else {
					// End of questions code
					endOfGame();
				}
				
			} else {
				
			/*************************************************************/
			/* Player 2 Game Play ****************************************/
			/*************************************************************/
			
				if (questionTotal1 == TIEBREAKER) {
					numberOfQuestions1 = TIEBREAKER;
				} else {
					numberOfQuestions1 = arrPlayer1Questions.length - 1;
				}
				if (questionTotal2 == TIEBREAKER) {
					numberOfQuestions2 = TIEBREAKER;
				} else {
					numberOfQuestions2 = arrPlayer2Questions.length - 1;
				}
				
				if (questionCount1 < numberOfQuestions1 && questionCount2 < numberOfQuestions2) {
								
					if (playerUp == 1) {
						
						// Determine header logo based on question drug category
						var questionDrug1:XMLList = quizData.category.question.(@qid == arrPlayer1Answers[questionCount1]).child("drug");
						if (questionDrug1[0] == "ACTOPLUSMET") {
							addChild(setAndGetActosPlusMetLogo());
						} else if (questionDrug1[0] == "DUETACT") {
							addChild(setAndGetDuetActLogo());
						}						
						
						// Add Muscles Anime to stage from library
						mcMusclesAnimeRightAnswer01 = new mc_MusclesAnimeRightAnswer_01();
						mcMusclesAnimeRightAnswer01.x = STAGEWIDTH/2 - (mcMusclesAnimeRightAnswer01.width/2);
						mcMusclesAnimeRightAnswer01.y = STAGEHEIGHT/2 - (mcMusclesAnimeRightAnswer01.height/2) - 28;
						addChildAt(mcMusclesAnimeRightAnswer01, getChildIndex(mcQuizCopyBox));								
					
						// Adjust Scoreboard display
						mcScoreboard.mc_powerfulpancreasfilter.visible = false;
						mcScoreboard.mc_pointer2.visible = false;
										
							questionNumber0 = questionCount1 + 1;				
											
							if (numberOfQuestions1 == TIEBREAKER) {
								mcTeamCopyBox.txt_TeamNameBox.text = "Tiebreaker – " + TEAMNAME1;
							} else {
								mcTeamCopyBox.txt_TeamNameBox.text = TEAMNAME1;
							}
							mcQuestionCopyBox.txt_QuizQuestionBox.width = 550;
							mcQuestionCopyBox.txt_QuizQuestionBox.htmlText = "<b>" + arrPlayer1Questions[questionCount1] + "</b>";
							mcQuestionCopyBox.txt_QuizQuestionBox.height = mcQuestionCopyBox.txt_QuizQuestionBox.textHeight + 60;
							
							// Display Question Tally
							if (questionNumber0 < TIEBREAKER) {
								mcQuestionTally = new mc_QuestionTally();
								mcQuestionTally.x = 70;
								mcQuestionTally.y = 625;
								addChild(mcQuestionTally);
								mcQuestionTally.txt_QuestionTallyCopy.htmlText = "<b>" + questionNumber0 + " of " + (TIEBREAKER - 1) + "</b>";
							}
							
							//INCLUDE ANSWER LOGIC FUNCTION CALL HERE
							getAnswers1(questionCount1);	
							
					} else {
						
						// Determine header logo based on question drug category
						var questionDrug2:XMLList = quizData.category.question.(@qid == arrPlayer2Answers[questionCount2]).child("drug");
						if (questionDrug2[0] == "ACTOPLUSMET") {
							addChild(setAndGetActosPlusMetLogo());
						} else if (questionDrug2[0] == "DUETACT") {
							addChild(setAndGetDuetActLogo());
						}						
						
						// Add Pancreas Anime to stage from library
						mcPancreasAnimeRightAnswer01 = new mc_PancreasAnimeRightAnswer_01();
						mcPancreasAnimeRightAnswer01.x = STAGEWIDTH/2 - (mcPancreasAnimeRightAnswer01.width/2);
						mcPancreasAnimeRightAnswer01.y = STAGEHEIGHT/2 - (mcPancreasAnimeRightAnswer01.height/2) - 28;	
						addChildAt(mcPancreasAnimeRightAnswer01, getChildIndex(mcQuizCopyBox));	
						
						// Adjust Scoreboard display
						mcScoreboard.mc_mightymusclefilter.visible = false;	
						mcScoreboard.mc_pointer1.visible = false;
										
							questionNumber0 = questionCount2 + 1;				
											
							if (numberOfQuestions2 == TIEBREAKER) {
								mcTeamCopyBox.txt_TeamNameBox.text = "Tiebreaker – " + TEAMNAME2;
							} else {
								mcTeamCopyBox.txt_TeamNameBox.text = TEAMNAME2;
							}
							mcQuestionCopyBox.txt_QuizQuestionBox.width = 550;
							mcQuestionCopyBox.txt_QuizQuestionBox.htmlText = "<b>" + arrPlayer2Questions[questionCount2] + "</b>";
							mcQuestionCopyBox.txt_QuizQuestionBox.height = mcQuestionCopyBox.txt_QuizQuestionBox.textHeight + 60;
							
							// Display Question Tally
							if (questionNumber0 < TIEBREAKER) {
								mcQuestionTally = new mc_QuestionTally();
								mcQuestionTally.x = 70;
								mcQuestionTally.y = 625;
								addChild(mcQuestionTally);
								mcQuestionTally.txt_QuestionTallyCopy.htmlText = "<b>" + questionNumber0 + " of " + (TIEBREAKER - 1) + "</b>";
							}
							
							//INCLUDE ANSWER LOGIC FUNCTION CALL HERE
							getAnswers2(questionCount2);
							
					}
				
				// Add Menu Button to stage from library
				addChild(setAndGetMenuButton());
				btnMenu.addEventListener(MouseEvent.MOUSE_OVER, menuMouseOver);	
						
				} else {
					// End of questions code
					endOfGame();
				}		
			
			}
			// END GAME PLAY
			
			// Answer gathering for Player 1
			function getAnswers1(questionCt) {
			
				// Set Answer Copy and Correct Answer
				var answersByQID:XMLList = quizData.category.question.(@qid == arrPlayer1Answers[questionCt]).child("answer");					
				var answerValue:XMLList = quizData.category.question.(@qid == arrPlayer1Answers[questionCt]).answer.@correct;

				// Set Correct Answer copy for this question 
				var correctAnswerByQID:String = quizData.category.question.(@qid == arrPlayer1Answers[questionCt]).child("correctanswer");
				
				// Set Incorrect Answer copy for this question 
				var incorrectAnswerByQID:String = quizData.category.question.(@qid == arrPlayer1Answers[questionCt]).child("incorrectanswer");	
				
				// Set variable that determines the y position of the first displayed answer
				var answerPosY:int = mcQuestionCopyBox.y + mcQuestionCopyBox.txt_QuizQuestionBox.textHeight + 10;
				
				// Set height of Quiz Copy Box based on combined height of question and answers
				mcQuizCopyBox.height = mcQuestionCopyBox.txt_QuizQuestionBox.height + 50 + (answersByQID.length() * 40);
				
				// Add Answer Copy Boxes to stage from library (up to qty of 5)
				
				var answerRight:String = "";
				var runningHeight1:int = answerPosY;
				
				for (var a_index:int=0; a_index<answersByQID.length(); a_index++) {
					if (a_index == 0) {
						mcAnswerCopyBox0 = new mc_answerCopyBox0();
						mcAnswerCopyBox0.mc_answerHighlight.visible = false;
						mcAnswerCopyBox0.txt_QuizAnswerBox.width = 550;
						addChild(mcAnswerCopyBox0);
						mcAnswerCopyBox0.txt_QuizAnswerBox.htmlText = "<b>a.</b> " + answersByQID[a_index];
						mcAnswerCopyBox0.txt_QuizAnswerBox.height = mcAnswerCopyBox0.txt_QuizAnswerBox.textHeight + 30;
						mcAnswerCopyBox0.x = 90.0;
						mcAnswerCopyBox0.y = runningHeight1 + 10;
						runningHeight1 += mcAnswerCopyBox0.txt_QuizAnswerBox.textHeight + 5;
									
							mcAnswerCopyBox0.addEventListener(MouseEvent.MOUSE_OVER, f_answerOver1);
							mcAnswerCopyBox0.addEventListener(MouseEvent.MOUSE_OUT, f_answerOut1);
							mcAnswerCopyBox0.addEventListener(MouseEvent.CLICK, f_answerClick1);
							function f_answerOver1(e:Event) {
								mcAnswerCopyBox0.mc_answerHighlight.visible = true;
								mcAnswerCopyBox0.mc_answerHighlight.width = mcAnswerCopyBox0.txt_QuizAnswerBox.textWidth + 10; 
								mcAnswerCopyBox0.mc_answerHighlight.height = mcAnswerCopyBox0.txt_QuizAnswerBox.textHeight + 5;
							}
							function f_answerOut1(e:Event) {
								mcAnswerCopyBox0.mc_answerHighlight.visible = false;
							}
							function f_answerClick1(e:Event) {
								// Call check answer method
								letter = "a";
								checkAnswer(letter,answerValue,playerNumber,questionNumber0,arrPlayer1Answers[questionCt],answerValue[0],correctAnswerByQID,incorrectAnswerByQID);
							}
							
					} else if (a_index == 1) {
						mcAnswerCopyBox1 = new mc_answerCopyBox1();
						mcAnswerCopyBox1.mc_answerHighlight.visible = false;
						mcAnswerCopyBox1.txt_QuizAnswerBox.width = 550;
						addChild(mcAnswerCopyBox1);
						mcAnswerCopyBox1.txt_QuizAnswerBox.htmlText = "<b>b.</b> " + answersByQID[a_index];
						mcAnswerCopyBox1.txt_QuizAnswerBox.height = mcAnswerCopyBox1.txt_QuizAnswerBox.textHeight + 30;
						mcAnswerCopyBox1.x = 90.0;
						mcAnswerCopyBox1.y = runningHeight1 + 10;
						runningHeight1 += mcAnswerCopyBox1.txt_QuizAnswerBox.textHeight + 5;
							
							mcAnswerCopyBox1.addEventListener(MouseEvent.MOUSE_OVER, f_answerOver2);
							mcAnswerCopyBox1.addEventListener(MouseEvent.MOUSE_OUT, f_answerOut2);
							mcAnswerCopyBox1.addEventListener(MouseEvent.CLICK, f_answerClick2);
							function f_answerOver2(e:Event) {
								mcAnswerCopyBox1.mc_answerHighlight.visible = true;
								mcAnswerCopyBox1.mc_answerHighlight.width = mcAnswerCopyBox1.txt_QuizAnswerBox.textWidth + 10; 
								mcAnswerCopyBox1.mc_answerHighlight.height = mcAnswerCopyBox1.txt_QuizAnswerBox.textHeight + 5;
							}
							function f_answerOut2(e:Event) {
								mcAnswerCopyBox1.mc_answerHighlight.visible = false;
							}
							function f_answerClick2(e:Event) {
								// Call check answer method
								letter = "b";
								checkAnswer(letter,answerValue,playerNumber,questionNumber0,arrPlayer1Answers[questionCt],answerValue[1],correctAnswerByQID,incorrectAnswerByQID);							
							}
						
					} else if (a_index == 2) {
						mcAnswerCopyBox2 = new mc_answerCopyBox2();
						mcAnswerCopyBox2.mc_answerHighlight.visible = false;
						mcAnswerCopyBox2.txt_QuizAnswerBox.width = 550;
						addChild(mcAnswerCopyBox2);
						mcAnswerCopyBox2.txt_QuizAnswerBox.htmlText = "<b>c.</b> " + answersByQID[a_index];
						mcAnswerCopyBox2.txt_QuizAnswerBox.height = mcAnswerCopyBox2.txt_QuizAnswerBox.textHeight + 30;
						mcAnswerCopyBox2.x = 90.0;
						mcAnswerCopyBox2.y = runningHeight1 + 10;
						runningHeight1 += mcAnswerCopyBox2.txt_QuizAnswerBox.textHeight + 5;			
						
							mcAnswerCopyBox2.addEventListener(MouseEvent.MOUSE_OVER, f_answerOver3);
							mcAnswerCopyBox2.addEventListener(MouseEvent.MOUSE_OUT, f_answerOut3);
							mcAnswerCopyBox2.addEventListener(MouseEvent.CLICK, f_answerClick3);
							function f_answerOver3(e:Event) {
								mcAnswerCopyBox2.mc_answerHighlight.visible = true;
								mcAnswerCopyBox2.mc_answerHighlight.width = mcAnswerCopyBox2.txt_QuizAnswerBox.textWidth + 10; 
								mcAnswerCopyBox2.mc_answerHighlight.height = mcAnswerCopyBox2.txt_QuizAnswerBox.textHeight + 5;
							}
							function f_answerOut3(e:Event) {
								mcAnswerCopyBox2.mc_answerHighlight.visible = false;
							}
							function f_answerClick3(e:Event) {
								// Call check answer method
								letter = "c";
								checkAnswer(letter,answerValue,playerNumber,questionNumber0,arrPlayer1Answers[questionCt],answerValue[2],correctAnswerByQID,incorrectAnswerByQID);							
							}
						
					} else if (a_index == 3) {
						mcAnswerCopyBox3 = new mc_answerCopyBox3();
						mcAnswerCopyBox3.mc_answerHighlight.visible = false;
						mcAnswerCopyBox3.txt_QuizAnswerBox.width = 550;
						addChild(mcAnswerCopyBox3);
						mcAnswerCopyBox3.txt_QuizAnswerBox.htmlText = "<b>d.</b> " + answersByQID[a_index];
						mcAnswerCopyBox3.txt_QuizAnswerBox.height = mcAnswerCopyBox3.txt_QuizAnswerBox.textHeight + 30;
						mcAnswerCopyBox3.x = 90.0;
						mcAnswerCopyBox3.y = runningHeight1 + 10;
						runningHeight1 += mcAnswerCopyBox3.txt_QuizAnswerBox.textHeight + 5;
						
							mcAnswerCopyBox3.addEventListener(MouseEvent.MOUSE_OVER, f_answerOver4);
							mcAnswerCopyBox3.addEventListener(MouseEvent.MOUSE_OUT, f_answerOut4);
							mcAnswerCopyBox3.addEventListener(MouseEvent.CLICK, f_answerClick4);
							function f_answerOver4(e:Event) {
								mcAnswerCopyBox3.mc_answerHighlight.visible = true;
								mcAnswerCopyBox3.mc_answerHighlight.width = mcAnswerCopyBox3.txt_QuizAnswerBox.textWidth + 10;
								mcAnswerCopyBox3.mc_answerHighlight.height = mcAnswerCopyBox3.txt_QuizAnswerBox.textHeight + 5;
							}	
							function f_answerOut4(e:Event) {
								mcAnswerCopyBox3.mc_answerHighlight.visible = false;
							}
							function f_answerClick4(e:Event) {
								// Call check answer method
								letter = "d";
								checkAnswer(letter,answerValue,playerNumber,questionNumber0,arrPlayer1Answers[questionCt],answerValue[3],correctAnswerByQID,incorrectAnswerByQID);							
							}
						
					} else if (a_index == 4) {
						mcAnswerCopyBox4 = new mc_answerCopyBox4();
						mcAnswerCopyBox4.mc_answerHighlight.visible = false;
						mcAnswerCopyBox4.txt_QuizAnswerBox.width = 550;
						addChild(mcAnswerCopyBox4);
						mcAnswerCopyBox4.txt_QuizAnswerBox.htmlText = "<b>e.</b> " + answersByQID[a_index];
						mcAnswerCopyBox4.txt_QuizAnswerBox.height = mcAnswerCopyBox4.txt_QuizAnswerBox.textHeight + 30;
						mcAnswerCopyBox4.x = 90.0;
						mcAnswerCopyBox4.y = runningHeight1 + 10;
						runningHeight1 += mcAnswerCopyBox4.txt_QuizAnswerBox.textHeight + 5;
						
							mcAnswerCopyBox4.addEventListener(MouseEvent.MOUSE_OVER, f_answerOver5);
							mcAnswerCopyBox4.addEventListener(MouseEvent.MOUSE_OUT, f_answerOut5);
							mcAnswerCopyBox4.addEventListener(MouseEvent.CLICK, f_answerClick5);
							function f_answerOver5(e:Event) {
								mcAnswerCopyBox4.mc_answerHighlight.visible = true;
								mcAnswerCopyBox4.mc_answerHighlight.width = mcAnswerCopyBox4.txt_QuizAnswerBox.textWidth + 10;
								mcAnswerCopyBox4.mc_answerHighlight.height = mcAnswerCopyBox4.txt_QuizAnswerBox.textHeight + 5;
							}	
							function f_answerOut5(e:Event) {
								mcAnswerCopyBox4.mc_answerHighlight.visible = false;
							}
							function f_answerClick5(e:Event) {
								// Call check answer method
								letter = "e";
								checkAnswer(e,answerValue,playerNumber,questionNumber0,arrPlayer1Answers[questionCt],answerValue[4],correctAnswerByQID,incorrectAnswerByQID);							
							}
						
					}
				}
			
				// RESULTANT ANSWER FIX - This was for question 14's last answer getting cropped on result screen 
				mcResultantAnswerFix = new mc_ResultantAnswerFix();
				mcResultantAnswerFix.x = mcQuizCopyBox.x + 15;
				mcResultantAnswerFix.y = (mcQuizCopyBox.y + mcQuizCopyBox.height) - 30;
				addChild(mcResultantAnswerFix);
			
				questionBoxCoverUp(1.00,(mcQuizCopyBox.x + 3),(mcQuizCopyBox.y + 3),(mcQuizCopyBox.width - 3),(mcQuizCopyBox.height-10));	
				
			}			
			
			// Answer gathering for Player 2
			function getAnswers2(questionCt) {
			
				// Set Answer Copy and Correct Answer
				var answersByQID:XMLList = quizData.category.question.(@qid == arrPlayer2Answers[questionCt]).child("answer");					
				var answerValue:XMLList = quizData.category.question.(@qid == arrPlayer2Answers[questionCt]).answer.@correct;
				
				// Set Correct Answer copy for this question 
				var correctAnswerByQID:String = quizData.category.question.(@qid == arrPlayer2Answers[questionCt]).child("correctanswer");
				
				// Set Incorrect Answer copy for this question 
				var incorrectAnswerByQID:String = quizData.category.question.(@qid == arrPlayer2Answers[questionCt]).child("incorrectanswer");	
				
				// Set variable that determines the y position of the first displayed answer
				var answerPosY:int = mcQuestionCopyBox.y + mcQuestionCopyBox.txt_QuizQuestionBox.textHeight + 10;
				
				// Set height of Quiz Copy Box based on combined height of question and answers
				mcQuizCopyBox.height = mcQuestionCopyBox.txt_QuizQuestionBox.height + 50 + (answersByQID.length() * 40);
				
				// Add Answer Copy Boxes to stage from library (up to qty of 5)
				
				var runningHeight2:int = answerPosY;
					
				for (var a_index:int=0; a_index<answersByQID.length(); a_index++) {
					if (a_index == 0) {
						mcAnswerCopyBox0 = new mc_answerCopyBox0();
						mcAnswerCopyBox0.mc_answerHighlight.visible = false;
						mcAnswerCopyBox0.txt_QuizAnswerBox.width = 550;
						addChild(mcAnswerCopyBox0);
						mcAnswerCopyBox0.txt_QuizAnswerBox.htmlText = "<b>a.</b> " + answersByQID[a_index];
						mcAnswerCopyBox0.txt_QuizAnswerBox.height = mcAnswerCopyBox0.txt_QuizAnswerBox.textHeight + 30;
						mcAnswerCopyBox0.x = 90.0;
						mcAnswerCopyBox0.y = runningHeight2 + 10;
						runningHeight2 += mcAnswerCopyBox0.txt_QuizAnswerBox.textHeight + 5;			
						
							mcAnswerCopyBox0.addEventListener(MouseEvent.MOUSE_OVER, f_answerOver1);
							mcAnswerCopyBox0.addEventListener(MouseEvent.MOUSE_OUT, f_answerOut1);
							mcAnswerCopyBox0.addEventListener(MouseEvent.CLICK, f_answerClick1);
							function f_answerOver1(e:Event) {
								mcAnswerCopyBox0.mc_answerHighlight.visible = true;
								mcAnswerCopyBox0.mc_answerHighlight.width = mcAnswerCopyBox0.txt_QuizAnswerBox.textWidth + 10;
								mcAnswerCopyBox0.mc_answerHighlight.height = mcAnswerCopyBox0.txt_QuizAnswerBox.textHeight + 5;
							}
							function f_answerOut1(e:Event) {
								mcAnswerCopyBox0.mc_answerHighlight.visible = false;
							}
							function f_answerClick1(e:Event) {
								// Call check answer method
								letter = "a";
								checkAnswer(letter,answerValue,playerNumber,questionNumber0,arrPlayer2Answers[questionCt],answerValue[0],correctAnswerByQID,incorrectAnswerByQID);		
							}
						
					} else if (a_index == 1) {
						mcAnswerCopyBox1 = new mc_answerCopyBox1();
						mcAnswerCopyBox1.mc_answerHighlight.visible = false;
						mcAnswerCopyBox1.txt_QuizAnswerBox.width = 550;
						addChild(mcAnswerCopyBox1);
						mcAnswerCopyBox1.txt_QuizAnswerBox.htmlText = "<b>b.</b> " + answersByQID[a_index];
						mcAnswerCopyBox1.txt_QuizAnswerBox.height = mcAnswerCopyBox1.txt_QuizAnswerBox.textHeight + 30;
						mcAnswerCopyBox1.x = 90.0;
						mcAnswerCopyBox1.y = runningHeight2 + 10;
						runningHeight2 += mcAnswerCopyBox1.txt_QuizAnswerBox.textHeight + 5;
						
							mcAnswerCopyBox1.addEventListener(MouseEvent.MOUSE_OVER, f_answerOver2);
							mcAnswerCopyBox1.addEventListener(MouseEvent.MOUSE_OUT, f_answerOut2);
							mcAnswerCopyBox1.addEventListener(MouseEvent.CLICK, f_answerClick2);
							function f_answerOver2(e:Event) {
								mcAnswerCopyBox1.mc_answerHighlight.visible = true;
								mcAnswerCopyBox1.mc_answerHighlight.width = mcAnswerCopyBox1.txt_QuizAnswerBox.textWidth + 10;
								mcAnswerCopyBox1.mc_answerHighlight.height = mcAnswerCopyBox1.txt_QuizAnswerBox.textHeight + 5;
							}
							function f_answerOut2(e:Event) {
								mcAnswerCopyBox1.mc_answerHighlight.visible = false;
							}
							function f_answerClick2(e:Event) {
								// Call check answer method
								letter = "b";
								checkAnswer(letter,answerValue,playerNumber,questionNumber0,arrPlayer2Answers[questionCt],answerValue[1],correctAnswerByQID,incorrectAnswerByQID);									
							}
						
					} else if (a_index == 2) {
						mcAnswerCopyBox2 = new mc_answerCopyBox2();
						mcAnswerCopyBox2.mc_answerHighlight.visible = false;
						mcAnswerCopyBox2.txt_QuizAnswerBox.width = 550;
						addChild(mcAnswerCopyBox2);
						mcAnswerCopyBox2.txt_QuizAnswerBox.htmlText = "<b>c.</b> " + answersByQID[a_index];
						mcAnswerCopyBox2.txt_QuizAnswerBox.height = mcAnswerCopyBox2.txt_QuizAnswerBox.textHeight + 30;
						mcAnswerCopyBox2.x = 90.0;
						mcAnswerCopyBox2.y = runningHeight2 + 10;
						runningHeight2 += mcAnswerCopyBox2.txt_QuizAnswerBox.textHeight + 5;		
						
							mcAnswerCopyBox2.addEventListener(MouseEvent.MOUSE_OVER, f_answerOver3);
							mcAnswerCopyBox2.addEventListener(MouseEvent.MOUSE_OUT, f_answerOut3);
							mcAnswerCopyBox2.addEventListener(MouseEvent.CLICK, f_answerClick3);
							function f_answerOver3(e:Event) {
								mcAnswerCopyBox2.mc_answerHighlight.visible = true;
								mcAnswerCopyBox2.mc_answerHighlight.width = mcAnswerCopyBox2.txt_QuizAnswerBox.textWidth + 10;
								mcAnswerCopyBox2.mc_answerHighlight.height = mcAnswerCopyBox2.txt_QuizAnswerBox.textHeight + 5;
							}
							function f_answerOut3(e:Event) {
								mcAnswerCopyBox2.mc_answerHighlight.visible = false;
							}
							function f_answerClick3(e:Event) {
								// Call check answer method
								letter = "c";
								checkAnswer(letter,answerValue,playerNumber,questionNumber0,arrPlayer2Answers[questionCt],answerValue[2],correctAnswerByQID,incorrectAnswerByQID);									
							}
						
					} else if (a_index == 3) {
						mcAnswerCopyBox3 = new mc_answerCopyBox3();
						mcAnswerCopyBox3.mc_answerHighlight.visible = false;
						mcAnswerCopyBox3.txt_QuizAnswerBox.width = 550;
						addChild(mcAnswerCopyBox3);
						mcAnswerCopyBox3.txt_QuizAnswerBox.htmlText = "<b>d.</b> " + answersByQID[a_index];
						mcAnswerCopyBox3.txt_QuizAnswerBox.height = mcAnswerCopyBox3.txt_QuizAnswerBox.textHeight + 30;
						mcAnswerCopyBox3.x = 90.0;
						mcAnswerCopyBox3.y = runningHeight2 + 10;
						runningHeight2 += mcAnswerCopyBox3.txt_QuizAnswerBox.textHeight + 5;					
						
							mcAnswerCopyBox3.addEventListener(MouseEvent.MOUSE_OVER, f_answerOver4);
							mcAnswerCopyBox3.addEventListener(MouseEvent.MOUSE_OUT, f_answerOut4);
							mcAnswerCopyBox3.addEventListener(MouseEvent.CLICK, f_answerClick4);
							function f_answerOver4(e:Event) {
								mcAnswerCopyBox3.mc_answerHighlight.visible = true;
								mcAnswerCopyBox3.mc_answerHighlight.width = mcAnswerCopyBox3.txt_QuizAnswerBox.textWidth + 10;
								mcAnswerCopyBox3.mc_answerHighlight.height = mcAnswerCopyBox3.txt_QuizAnswerBox.textHeight + 5;
							}	
							function f_answerOut4(e:Event) {
								mcAnswerCopyBox3.mc_answerHighlight.visible = false;
							}
							function f_answerClick4(e:Event) {
								// Call check answer method
								letter = "d";
								checkAnswer(letter,answerValue,playerNumber,questionNumber0,arrPlayer2Answers[questionCt],answerValue[3],correctAnswerByQID,incorrectAnswerByQID);		
							}
						
					} else if (a_index == 4) {
						mcAnswerCopyBox4 = new mc_answerCopyBox4();
						mcAnswerCopyBox4.mc_answerHighlight.visible = false;
						mcAnswerCopyBox4.txt_QuizAnswerBox.width = 550;
						addChild(mcAnswerCopyBox4);
						mcAnswerCopyBox4.txt_QuizAnswerBox.htmlText = "<b>e.</b> " + answersByQID[a_index];
						mcAnswerCopyBox4.txt_QuizAnswerBox.height = mcAnswerCopyBox4.txt_QuizAnswerBox.textHeight + 30;
						mcAnswerCopyBox4.x = 90.0;
						mcAnswerCopyBox4.y = runningHeight2 + 10;
						runningHeight2 += mcAnswerCopyBox4.txt_QuizAnswerBox.textHeight + 5;
						
							mcAnswerCopyBox4.addEventListener(MouseEvent.MOUSE_OVER, f_answerOver5);
							mcAnswerCopyBox4.addEventListener(MouseEvent.MOUSE_OUT, f_answerOut5);
							mcAnswerCopyBox4.addEventListener(MouseEvent.CLICK, f_answerClick5);
							function f_answerOver5(e:Event) {
								mcAnswerCopyBox4.mc_answerHighlight.visible = true;
								mcAnswerCopyBox4.mc_answerHighlight.width = mcAnswerCopyBox4.txt_QuizAnswerBox.textWidth + 10;
								mcAnswerCopyBox4.mc_answerHighlight.height = mcAnswerCopyBox4.txt_QuizAnswerBox.textHeight + 5;
							}	
							function f_answerOut5(e:Event) {
								mcAnswerCopyBox4.mc_answerHighlight.visible = false;
							}
							function f_answerClick5(e:Event) {
								// Call check answer method
								letter = "e";
								checkAnswer(letter,answerValue,playerNumber,questionNumber0,arrPlayer2Answers[questionCt],answerValue[4],correctAnswerByQID,incorrectAnswerByQID);									
							}
						
					}
				}
				
				questionBoxCoverUp(1.00,(mcQuizCopyBox.x + 3),(mcQuizCopyBox.y + 3),(mcQuizCopyBox.width - 3),(mcQuizCopyBox.height-10));
				
			}
			
			// BEGIN CHECK ANSWER METHOD
			function checkAnswer(letter,answerValueArray,playerNumber,questionNumber,qID,answerValue,correctAnswerByQID,incorrectAnswerByQID) {
				
				// Call InvisiPanel
				addChild(setAndGetInvisiPanel());
				mcInvisiPanel.x = 75.0;
				mcInvisiPanel.y = 100.0;
				
				// BEGIN VIDEO ANIMATIONS
				if (answerValue == "1") {
			
					if (playerUp == 1) {
						characterAnime = "Muscles_Win_2.flv";
					} else {
						characterAnime = "Pancreas_Win_2.flv";
					}
					
				} else {
					
					if (playerUp == 1) {
						characterAnime = "Muscles_Lose_2.flv";
					} else {
						characterAnime = "Pancreas_Lose_2.flv";
					}
					
				}
				
					// LOAD AND PLAY APPROPRIATE VIDEO
					animeVidConnection = new NetConnection();
					animeVidConnection.connect(null); 
					animeVidStream = new NetStream(animeVidConnection); 
					animeVid = new Video(1024, 578);
					animeVid.x = 0.0;
					animeVid.y = 67.0;
					if (tieGame == true) {
						mcWhiteBG1.visible = false;
						addChildAt(animeVid, 4);
						// Add Cell Wall BG to stage from library
						addChildAt(setAndGetCellWallBG(), getChildIndex(animeVid));
					} else {
						addChildAt(animeVid, 4);
						// Add Cell Wall BG to stage from library
						addChildAt(setAndGetCellWallBG(), getChildIndex(animeVid));
					}
					animeVid.attachNetStream(animeVidStream);
					animeVidStream.play("flvs/" + characterAnime);
					animeVidStream.addEventListener(NetStatusEvent.NET_STATUS, netstat);
	
					function netstat(stats:NetStatusEvent)
					{
						//trace(stats.info.code);
						/*
						NetStream.Play.Start
						NetStream.Buffer.Empty
						NetStream.Buffer.Full
						NetStream.Buffer.Flush
						NetStream.Play.Stop
						NetStream.Buffer.Empty
						NetStream.Buffer.Flush
						*/
						
						if (stats.info.code == "NetStream.Play.Start") {
							delay = new Timer(250,1);
							delay.addEventListener(TimerEvent.TIMER, movieDelayListener);
							delay.start();
							function movieDelayListener():void {
								if (playerUp == 1) {
									removeChild(mcMusclesAnimeRightAnswer01);
								} else {
									removeChild(mcPancreasAnimeRightAnswer01);
								}
							}
						}
						
						if (stats.info.code == "NetStream.Play.Stop") {
							resultsDelayListener();
						}
					}
					animeVidClient = new Object();
					animeVidClient.onMetaData = function(meta:Object)
					{
						//trace(meta.duration);
						//animeAudioRequest = new URLRequest("sounds/anime_muscles_win_2.mp3");
						//animeAudio = new Sound(animeAudioRequest);
						//animeAudioChannel = animeAudio.play(animeAudioPosition,1);
					}
					animeVidStream.client = animeVidClient;	
					
				// END VIDEO ANIMATIONS
					
					function resultsDelayListener():void {
						
						if (safetyOpen == true) {
							closeSafetyPopUp2();
						}
						if (closeAppOpen == true) {
							closeCloseAppPopUp();
						}						
			
						// Reformat Question Copy Box
						var pStyleBlock1:Object = new Object();
						pStyleBlock1.fontSize = "14";
						var styleSheet1:StyleSheet = new StyleSheet();
						styleSheet1.setStyle("p", pStyleBlock1);
						mcQuestionCopyBox.txt_QuizQuestionBox.styleSheet = styleSheet1;														
														
						// Remove old Q & A display and set up new Q & A display
						var answersPlayer:XMLList = quizData.category.question.(@qid == qID).child("answer");
						var questionPlayer:XMLList = quizData.category.question.(@qid == qID).child("copy");
						var questionGraphic:XMLList = quizData.category.question.(@qid == qID).child("graphic");
						
						// Check for existence of an associated image reference
						if (questionGraphic.toString() != "") {
							var loader:Loader = new Loader();
							loader.contentLoaderInfo.addEventListener(Event.INIT, initListener);
							var url:URLRequest = new URLRequest("images/small/" + questionGraphic);
							loader.load(url);
							
							// Add Small Image Holder to stage from library
							mcSmallImageHolder = new mc_SmallImageHolder();
							mcSmallImageHolder.x = 555.0;
							mcSmallImageHolder.y = 195.0;
							addChild(mcSmallImageHolder);
							mcSmallImageHolder.addEventListener(MouseEvent.CLICK, enlargeImage);
							
							// If small image has loaded display it
							function initListener(e:Event):void {
								addChild(loader.content);
								loader.content.x = 555.0 - (loader.content.width/2);
								loader.content.y = 195.0 - (loader.content.height/2);
								
									// Add Small Magnifying Glass to stage from library
									mcSmallMagnifyingGlass = new mc_SmallMagnifyingGlass();
									mcSmallMagnifyingGlass.x = 645;
									mcSmallMagnifyingGlass.y = 265;
									mcSmallMagnifyingGlass.width = 48.5;
									mcSmallMagnifyingGlass.height = 48.5;	
									addChild(mcSmallMagnifyingGlass);
									
									mcSmallMagnifyingGlass.addEventListener(MouseEvent.CLICK, enlargeImage2);
									
							}
							
							// Method for displaying large image
							function enlargeImage(e:MouseEvent):void {
								
								if (largeImageOpen == false) {
									
									largeImageOpen = true;
									
									// Remove sub buttons for Menu Button from stage if they are displayed
									if (menuOpen == true) {
										removeSubMenuButtons();		
									}	
									
									var loader2:Loader = new Loader();
									loader2.contentLoaderInfo.addEventListener(Event.INIT, initListener2);
									var url2:URLRequest = new URLRequest("images/large/" + questionGraphic);
									loader2.load(url2);
									
									// Add Large Image Holder to stage from library
									mcLargeImageHolder = new mc_LargeImageHolder();
									mcLargeImageHolder.x = STAGEWIDTH/2 - (mcLargeImageHolder.width/2);
									mcLargeImageHolder.y = STAGEHEIGHT/2 - (mcLargeImageHolder.height/2);
									addChild(mcLargeImageHolder);
									
									// Add shadow to stage from library
									mcShadow = new mc_shadow_01();
									mcShadow.x = 0.0;
									mcShadow.y = 67.0;
									mcShadow.width = 1024.0;
									mcShadow.height = 578.0;
									addChildAt(mcShadow, getChildIndex(mcLargeImageHolder));
									
									// If large image has loaded display it
									function initListener2(e:Event):void {
										addChildAt(loader2.content, (getChildIndex(mcLargeImageHolder)+1));
										loader2.content.x = STAGEWIDTH/2 - (loader2.content.width/2);
										loader2.content.y = STAGEHEIGHT/2 - (loader2.content.height/2);
											
											// Add close button and method for closing large image holder
											btnLargeImageClosePopUp = new btn_closeapp_01();
											btnLargeImageClosePopUp.x = 860.0;
											btnLargeImageClosePopUp.y = 110.0;
											addChild(btnLargeImageClosePopUp);
											btnLargeImageClosePopUp.addEventListener(MouseEvent.CLICK, closeLargeImagePopUp);	
											
											// Method for closing the pop up for the large image holder
											function closeLargeImagePopUp(e:MouseEvent):void {
												removeChild(mcShadow);
												removeChild(loader2.content);
												removeChild(mcLargeImageHolder);
												removeChild(btnLargeImageClosePopUp);
												
												if (menuOpen == true) {
													removeSubMenuButtons();		
												}
												
												largeImageOpen = false;
											}
											
									}
									
									// Add Menu Button to stage from library
									if (btnMenu) {
										removeChild(btnMenu);
										addChild(setAndGetMenuButton());
										btnMenu.addEventListener(MouseEvent.MOUSE_OVER, menuMouseOver);
									}
								
								}
								
							}	
							
							// Method for displaying large image
							function enlargeImage2(e:MouseEvent):void {
								
								if (largeImageOpen == false) {
									
									largeImageOpen = true;
									
									// Remove sub buttons for Menu Button from stage if they are displayed
									if (menuOpen == true) {
										removeSubMenuButtons();		
									}	
									
									var loader2:Loader = new Loader();
									loader2.contentLoaderInfo.addEventListener(Event.INIT, initListener2);
									var url2:URLRequest = new URLRequest("images/large/" + questionGraphic);
									loader2.load(url2);
									
									// Add Large Image Holder to stage from library
									mcLargeImageHolder = new mc_LargeImageHolder();
									mcLargeImageHolder.x = STAGEWIDTH/2 - (mcLargeImageHolder.width/2);
									mcLargeImageHolder.y = STAGEHEIGHT/2 - (mcLargeImageHolder.height/2);
									addChild(mcLargeImageHolder);
									
									// Add shadow to stage from library
									mcShadow = new mc_shadow_01();
									mcShadow.x = 0.0;
									mcShadow.y = 67.0;
									mcShadow.width = 1024.0;
									mcShadow.height = 578.0;
									addChildAt(mcShadow, getChildIndex(mcLargeImageHolder));
									
									// If large image has loaded display it
									function initListener2(e:Event):void {
										
										addChildAt(loader2.content, (getChildIndex(mcLargeImageHolder)+1));
										loader2.content.x = STAGEWIDTH/2 - (loader2.content.width/2);
										loader2.content.y = STAGEHEIGHT/2 - (loader2.content.height/2);
											
											// Add close button and method for closing large image holder
											btnLargeImageClosePopUp = new btn_closeapp_01();
											btnLargeImageClosePopUp.x = 860.0;
											btnLargeImageClosePopUp.y = 110.0;
											addChild(btnLargeImageClosePopUp);
											btnLargeImageClosePopUp.addEventListener(MouseEvent.CLICK, closeLargeImagePopUp);	
											
											// Method for closing the pop up for the large image holder
											function closeLargeImagePopUp(e:MouseEvent):void {
												removeChild(mcShadow);
												removeChild(loader2.content);
												removeChild(mcLargeImageHolder);
												removeChild(btnLargeImageClosePopUp);
												
												if (menuOpen == true) {
													removeSubMenuButtons();		
												}
												
												largeImageOpen = false;
											}
											
									}
									
									// Add Menu Button to stage from library
									if (btnMenu) {
										removeChild(btnMenu);
										addChild(setAndGetMenuButton());
										btnMenu.addEventListener(MouseEvent.MOUSE_OVER, menuMouseOver);
									}
									
								}
								
							}								
							
							copyWidth = 330;
							
						} else {
							
							copyWidth = 550;
							
						}
						
						mcQuestionCopyBox.txt_QuizQuestionBox.width = copyWidth;
						mcQuestionCopyBox.txt_QuizQuestionBox.htmlText = "<p><b>" + questionPlayer + "</b></p>";
						mcQuestionCopyBox.txt_QuizQuestionBox.height = mcQuestionCopyBox.txt_QuizQuestionBox.textHeight + 10;
						var answerPosY2:int = mcQuestionCopyBox.y + mcQuestionCopyBox.txt_QuizQuestionBox.textHeight + 5;
						var runningHeight:int = answerPosY2;
						
						for (var a1:int=0; a1<answersPlayer.length(); a1++) {
							if (a1 == 0) {
								removeChild(mcAnswerCopyBox0);
								mcAnswerCopyBox = new mc_answerCopyBox();
								mcAnswerCopyBox.txt_QuizAnswerBox.width = copyWidth;
								mcAnswerCopyBox.txt_QuizAnswerBox.htmlText = "";
								addChild(mcAnswerCopyBox);								
								mcAnswerCopyBox.txt_QuizAnswerBox.htmlText = "<b>a. </b>" + answersPlayer[a1];
								if (answerValueArray[0] == "1") {
									gs.TweenLite.to(mcAnswerCopyBox.txt_QuizAnswerBox, .25, {tint:0x7C3A8F});
									mcAnswerCopyBox.txt_QuizAnswerBox.htmlText = "<b>a. " + answersPlayer[a1] + "</b>";
								}		
								mcAnswerCopyBox.txt_QuizAnswerBox.height = mcAnswerCopyBox.txt_QuizAnswerBox.textHeight + 10;
								mcAnswerCopyBox.x = 90.0;
								mcAnswerCopyBox.y = runningHeight + 5;
								runningHeight += mcAnswerCopyBox.txt_QuizAnswerBox.textHeight;
							} else if (a1 == 1) {
								removeChild(mcAnswerCopyBox1);
								mcAnswerCopyBox = new mc_answerCopyBox();
								mcAnswerCopyBox.txt_QuizAnswerBox.width = copyWidth;
								mcAnswerCopyBox.txt_QuizAnswerBox.htmlText = "";
								addChild(mcAnswerCopyBox);									
								mcAnswerCopyBox.txt_QuizAnswerBox.htmlText = "<b>b. </b>" + answersPlayer[a1];
								if (answerValueArray[1] == "1") {
									gs.TweenLite.to(mcAnswerCopyBox.txt_QuizAnswerBox, .25, {tint:0x7C3A8F});
									mcAnswerCopyBox.txt_QuizAnswerBox.htmlText = "<b>b. " + answersPlayer[a1] + "</b>";
								}						
								mcAnswerCopyBox.txt_QuizAnswerBox.height = mcAnswerCopyBox.txt_QuizAnswerBox.textHeight + 10;
								mcAnswerCopyBox.x = 90.0;
								mcAnswerCopyBox.y = runningHeight + 5;
								runningHeight += mcAnswerCopyBox.txt_QuizAnswerBox.textHeight;
							} else if (a1 == 2) {
								removeChild(mcAnswerCopyBox2);
								mcAnswerCopyBox = new mc_answerCopyBox();
								mcAnswerCopyBox.txt_QuizAnswerBox.width = copyWidth;
								mcAnswerCopyBox.txt_QuizAnswerBox.htmlText = "";
								addChild(mcAnswerCopyBox);									
								mcAnswerCopyBox.txt_QuizAnswerBox.htmlText = "<b>c. </b>" + answersPlayer[a1];
								if (answerValueArray[2] == "1") {
									gs.TweenLite.to(mcAnswerCopyBox.txt_QuizAnswerBox, .25, {tint:0x7C3A8F});
									mcAnswerCopyBox.txt_QuizAnswerBox.htmlText = "<b>c. " + answersPlayer[a1] + "</b>";
								}								
								mcAnswerCopyBox.txt_QuizAnswerBox.height = mcAnswerCopyBox.txt_QuizAnswerBox.textHeight + 1;
								mcAnswerCopyBox.x = 90.0;
								mcAnswerCopyBox.y = runningHeight + 5;
								runningHeight += mcAnswerCopyBox.txt_QuizAnswerBox.textHeight;
							} else if (a1 == 3) {
								removeChild(mcAnswerCopyBox3);
								mcAnswerCopyBox = new mc_answerCopyBox();
								mcAnswerCopyBox.txt_QuizAnswerBox.width = copyWidth;
								mcAnswerCopyBox.txt_QuizAnswerBox.htmlText = "";
								addChild(mcAnswerCopyBox);									
								mcAnswerCopyBox.txt_QuizAnswerBox.htmlText += "<b>d. </b>" + answersPlayer[a1];
								if (answerValueArray[3] == "1") {
									gs.TweenLite.to(mcAnswerCopyBox.txt_QuizAnswerBox, .25, {tint:0x7C3A8F});
									mcAnswerCopyBox.txt_QuizAnswerBox.htmlText = "<b>d. " + answersPlayer[a1] + "</b>";
								}								
								mcAnswerCopyBox.txt_QuizAnswerBox.height = mcAnswerCopyBox.txt_QuizAnswerBox.textHeight + 10;
								mcAnswerCopyBox.x = 90.0;
								mcAnswerCopyBox.y = runningHeight + 5;
								runningHeight += mcAnswerCopyBox.txt_QuizAnswerBox.textHeight;
							} else if (a1 == 4) {
								removeChild(mcAnswerCopyBox4);
								mcAnswerCopyBox = new mc_answerCopyBox();
								mcAnswerCopyBox.txt_QuizAnswerBox.width = copyWidth;
								mcAnswerCopyBox.txt_QuizAnswerBox.htmlText = "";
								addChild(mcAnswerCopyBox);									
								mcAnswerCopyBox.txt_QuizAnswerBox.htmlText += "<b>e. </b>" + answersPlayer[a1];
								if (answerValueArray[4] == "1") {
									gs.TweenLite.to(mcAnswerCopyBox.txt_QuizAnswerBox, .25, {tint:0x7C3A8F});
									mcAnswerCopyBox.txt_QuizAnswerBox.htmlText = "<b>e. " + answersPlayer[a1] + "</b>";
								}								
								mcAnswerCopyBox.txt_QuizAnswerBox.height = mcAnswerCopyBox.txt_QuizAnswerBox.textHeight + 10;
								mcAnswerCopyBox.x = 90.0;
								mcAnswerCopyBox.y = runningHeight + 5;
								runningHeight += mcAnswerCopyBox.txt_QuizAnswerBox.textHeight;
							}
						}
						
						addChild(mcAnswerCopyBox);
						
						// Gather annotations via XML
						var studyInfo:XMLList = quizData.category.question.(@qid == qID).annotations.notation;
						// Breakdown for XML Annotations
						/*
							for each (var child:XML in studyInfo.*) {
								trace(child + "\n\n");
							}
							studyInfo[0] = footnote;
							studyInfo[1] = references;
							studyinfo[2] = fairbalance;
							studyinfo[3] = indication;
						*/
						
						// Add Next button, Study Info and Refs to stage from library
						addChild(setAndGetNextButton());
						btnNext.addEventListener(MouseEvent.CLICK, f_next);
		
						// Decide upon display buttons
						var searchFootnote:RegExp = new RegExp("[a-z]");
						if (searchFootnote.test(studyInfo[0])) {
							addChild(setAndGetStudyInfoButton());
							btnStudyInfo.addEventListener(MouseEvent.CLICK, popupStudyInfo);
						}
						
						var searchRefs:RegExp = new RegExp("[a-z]");
						if (searchRefs.test(studyInfo[1])) {
							addChild(setAndGetRefsButton());
							btnRefs.addEventListener(MouseEvent.CLICK, popupRefs);
						}
						
						// Actions for correct or incorrect answer
						if (answerValue == "1") {
							// Set game score
							if (playerUp == 1) {
								player1Score += 1;
								// Adjust Scoreboard for Player 1
								gs.TweenLite.to(mcScoreboard.mc_redbar_01, 1, {width:"-25.0"});
								
								// Delay then count score down
								delay = new Timer(90,10);
								delay.addEventListener(TimerEvent.TIMER, scoreDelayListener1);
								delay.start();
								
								numCount = 0;
								
								function scoreDelayListener1(e:TimerEvent):void {
									numCount++;
									mcScoreboard.txt_Score1.htmlText = "<b>" + (110 - ((player1Score * 10) + numCount)) + "</b>";
								}						
								
							} else {
								player2Score += 1;	
								// Adjust Scoreboard for Player 2
								gs.TweenLite.to(mcScoreboard.mc_grnbar_01, 1, {width:"-25.0"});
								
								// Delay then count score down
								delay = new Timer(90,10);
								delay.addEventListener(TimerEvent.TIMER, scoreDelayListener2);
								delay.start();
								
								numCount = 0;
								
								function scoreDelayListener2(e:TimerEvent):void {
									numCount++;
									mcScoreboard.txt_Score2.htmlText = "<b>" + (110 - ((player2Score * 10) + numCount)) + "</b>";
								}												
								
							}
							
							// Display Correct Answer copy
							
							// Remove sub buttons for Menu Button from stage if they are displayed
							if (menuOpen == true) {
								removeSubMenuButtons();		
							}								
							
							// Fade down App Music
							if (muteTrueOrFalse == false) {
								delay = new Timer(25,50);
								delay.addEventListener(TimerEvent.TIMER, volumeFadeDelayListener1);
								delay.start();
								
								soundI = .50;
	
								function volumeFadeDelayListener1(e:TimerEvent):void {
									soundI = soundI - .01;
									appMusicFadeTrans = new SoundTransform(soundI, 0);	
									appMusicChannel.soundTransform = appMusicFadeTrans;
									muteTrueOrFalse = true;
									stoppedByUser = false;
								}
								
								stoppedByUser == false;
								
							}
							
							if (tieGame == true) {
								//PLAY TA-DA SOUND HERE
								tadaSound.play();
							}
							
							mcQuizCopyBox.filters = [gf1];
							mcResultantAnswerCopyBox = new mc_resultantAnswerCopyBox();
							mcResultantAnswerCopyBox.x = 90;
							if (questionGraphic.toString() != "") {
								if (runningHeight > 300) {
									mcResultantAnswerCopyBox.y = runningHeight + 25;
								} else {
									mcResultantAnswerCopyBox.y = 315.0;
								}
							} else {
								mcResultantAnswerCopyBox.y = runningHeight + 25;
							}
							mcQuizCopyBox.height = 475;				
							mcResultantAnswerCopyBox.txt_ResultantAnswerBox.htmlText = correctAnswerByQID;
							mcResultantAnswerCopyBox.txt_ResultantAnswerBox.htmlText += "<br>" + studyInfo[3];
							mcResultantAnswerCopyBox.txt_ResultantAnswerBox.htmlText += "<br>" + studyInfo[2];					
							mcResultantAnswerCopyBox.txt_ResultantAnswerBox.width = 535;
							mcResultantAnswerCopyBox.txt_ResultantAnswerBox.height = 525 - mcResultantAnswerCopyBox.y;
							mcResultantAnswerCopyBox.cmp_UIScrollBar.height = 525 - mcResultantAnswerCopyBox.y;
							if (mcResultantAnswerCopyBox.cmp_UIScrollBar.height > mcResultantAnswerCopyBox.txt_ResultantAnswerBox.textHeight) {
								mcResultantAnswerCopyBox.cmp_UIScrollBar.visible = false;
							}					
							addChild(mcResultantAnswerCopyBox);		
							
							questionBoxCoverUp(1.00,(mcQuizCopyBox.x + 3),(mcQuizCopyBox.y + 3),(mcQuizCopyBox.width - 3),(mcQuizCopyBox.height-10));								
							
						} else {
							// Display Incorrect Answer copy
							
							// Remove sub buttons for Menu Button from stage if they are displayed
							if (menuOpen == true) {
								removeSubMenuButtons();		
							}	
							
							// Fade down App Music
							if (muteTrueOrFalse == false) {
								delay = new Timer(25,50);
								delay.addEventListener(TimerEvent.TIMER, volumeFadeDelayListener2);
								delay.start();
								
								soundI = .50;
	
								function volumeFadeDelayListener2(e:TimerEvent):void {
									soundI = soundI - .01;
									appMusicFadeTrans = new SoundTransform(soundI, 0);	
									appMusicChannel.soundTransform = appMusicFadeTrans;
									muteTrueOrFalse = true;
									stoppedByUser = false;
								}
								
								stoppedByUser == false;
								
							}
							
							if (tieGame == true) {
								//PLAY AWE SOUND HERE
								aweSound.play();
							}
							
							mcQuizCopyBox.filters = [gf2];
							mcResultantAnswerCopyBox = new mc_resultantAnswerCopyBox();
							mcResultantAnswerCopyBox.x = 90;
							if (questionGraphic.toString() != "") {
								if (runningHeight > 300) {
									mcResultantAnswerCopyBox.y = runningHeight + 25;
								} else {
									mcResultantAnswerCopyBox.y = 315.0;
								}
							} else {
								mcResultantAnswerCopyBox.y = runningHeight + 25;
							}
							mcQuizCopyBox.height = 475;							
							mcResultantAnswerCopyBox.txt_ResultantAnswerBox.htmlText = incorrectAnswerByQID;
							mcResultantAnswerCopyBox.txt_ResultantAnswerBox.htmlText += "<br>" + studyInfo[3];
							mcResultantAnswerCopyBox.txt_ResultantAnswerBox.htmlText += "<br>" + studyInfo[2];					
							mcResultantAnswerCopyBox.txt_ResultantAnswerBox.width = 535;
							mcResultantAnswerCopyBox.txt_ResultantAnswerBox.height = 525 - mcResultantAnswerCopyBox.y;
							mcResultantAnswerCopyBox.cmp_UIScrollBar.height = 525 - mcResultantAnswerCopyBox.y;
							if (mcResultantAnswerCopyBox.cmp_UIScrollBar.height > mcResultantAnswerCopyBox.txt_ResultantAnswerBox.textHeight) {
								mcResultantAnswerCopyBox.cmp_UIScrollBar.visible = false;
							}
							addChild(mcResultantAnswerCopyBox);		
							
							questionBoxCoverUp(1.00,(mcQuizCopyBox.x + 3),(mcQuizCopyBox.y + 3),(mcQuizCopyBox.width - 3),(mcQuizCopyBox.height-10));
								
						}
						
						// Method for Study Info pop up display
						function popupStudyInfo(e:MouseEvent):void {
							
							if (studyInfoOpen == false) {
								// Remove sub buttons for Menu Button from stage if they are displayed
								if (menuOpen == true) {
									removeSubMenuButtons();		
								}
								
								// Repurpose Large Image Holder and add to stage from library for pop up window purposes
								mcLargeImageHolder = new mc_LargeImageHolder();
								mcLargeImageHolder.x = STAGEWIDTH/2 - (mcLargeImageHolder.width/2);
								mcLargeImageHolder.y = STAGEHEIGHT/2 - (mcLargeImageHolder.height/2);
								addChild(mcLargeImageHolder);
								
								// Add shadow to stage from library
								mcShadow = new mc_shadow_01();
								mcShadow.x = 0.0;
								mcShadow.y = 67.0;
								mcShadow.width = 1024.0;
								mcShadow.height = 578.0;
								addChildAt(mcShadow, getChildIndex(mcLargeImageHolder));
									
									btnStudyInfo.removeEventListener(MouseEvent.CLICK, popupStudyInfo);
									
									mcStudyInfoCopyBox = new mc_studyInfoCopyBox();
									mcStudyInfoCopyBox.x = 160;
									mcStudyInfoCopyBox.y = 120;
									addChild(mcStudyInfoCopyBox);
									mcStudyInfoCopyBox.txt_studyInfoBox.htmlText = "";
									mcStudyInfoCopyBox.txt_studyInfoBox.htmlText += studyInfo[0];
									mcStudyInfoCopyBox.txt_studyInfoBox.width = 650;
									mcStudyInfoCopyBox.txt_studyInfoBox.height = mcStudyInfoCopyBox.txt_studyInfoBox.textHeight + 10;
									mcLargeImageHolder.height = mcStudyInfoCopyBox.txt_studyInfoBox.textHeight + 100;
															
									// Add Close Button and method for Study Info pop up
									btnStudyInfoClosePopUp = new btn_closeapp_01();
									btnStudyInfoClosePopUp.x = 860.0;
									btnStudyInfoClosePopUp.y = 110.0;
									addChild(btnStudyInfoClosePopUp);
									btnStudyInfoClosePopUp.addEventListener(MouseEvent.CLICK, closeStudyInfoPopUp);	
									
								// Add Menu Button to stage from library
								if (btnMenu) {
									removeChild(btnMenu);
									addChild(setAndGetMenuButton());
									btnMenu.addEventListener(MouseEvent.MOUSE_OVER, menuMouseOver);
								}
								
								studyInfoOpen = true;
							
							}
								
						}
						
						// Method for closing the Study Info pop up
						function closeStudyInfoPopUp(e:MouseEvent):void {
							removeChild(mcShadow);
							removeChild(mcStudyInfoCopyBox);
							removeChild(mcLargeImageHolder);
							removeChild(btnStudyInfoClosePopUp);
							btnStudyInfo.addEventListener(MouseEvent.CLICK, popupStudyInfo);
							
							if (menuOpen == true) {
								removeSubMenuButtons();		
							}
							
							studyInfoOpen = false;
						}
						
						// Method for Refs pop up display
						function popupRefs(e:MouseEvent):void {
							
							if (refsOpen == false) {
								// Remove sub buttons for Menu Button from stage if they are displayed
								if (menuOpen == true) {
									removeSubMenuButtons();		
								}
								
								// Repurpose Large Image Holder and add to stage from library for pop up window purposes
								mcLargeImageHolder = new mc_LargeImageHolder();
								mcLargeImageHolder.x = STAGEWIDTH/2 - (mcLargeImageHolder.width/2);
								mcLargeImageHolder.y = STAGEHEIGHT/2 - (mcLargeImageHolder.height/2);
								addChild(mcLargeImageHolder);
								
								// Add shadow to stage from library
								mcShadow = new mc_shadow_01();
								mcShadow.x = 0.0;
								mcShadow.y = 67.0;
								mcShadow.width = 1024.0;
								mcShadow.height = 578.0;
								addChildAt(mcShadow, getChildIndex(mcLargeImageHolder));
								
									btnRefs.removeEventListener(MouseEvent.CLICK, popupRefs);
								
									mcRefsCopyBox = new mc_refsCopyBox();
									mcRefsCopyBox.x = 160;
									mcRefsCopyBox.y = 120;
									addChild(mcRefsCopyBox);
									mcRefsCopyBox.txt_refsBox.htmlText = "";
									mcRefsCopyBox.txt_refsBox.htmlText += studyInfo[1];	
									mcRefsCopyBox.txt_refsBox.width = 650;
									mcRefsCopyBox.txt_refsBox.height = mcRefsCopyBox.txt_refsBox.textHeight + 10;
									mcLargeImageHolder.height = mcRefsCopyBox.txt_refsBox.textHeight + 100;
									
									// Add Close Button and method for Refs pop up
									btnRefsClosePopUp = new btn_closeapp_01();
									btnRefsClosePopUp.x = 860.0;
									btnRefsClosePopUp.y = 110.0;
									addChild(btnRefsClosePopUp);
									btnRefsClosePopUp.addEventListener(MouseEvent.CLICK, closeRefsPopUp);
									
								// Add Menu Button to stage from library
								if (btnMenu) {
									removeChild(btnMenu);
									addChild(setAndGetMenuButton());
									btnMenu.addEventListener(MouseEvent.MOUSE_OVER, menuMouseOver);
								}
								
								refsOpen = true;
								
							}
							
						}
						
						// Method for closing the Refs pop up
						function closeRefsPopUp(e:MouseEvent):void {
							removeChild(mcShadow);
							removeChild(mcRefsCopyBox);
							removeChild(mcLargeImageHolder);
							removeChild(btnRefsClosePopUp);
							btnRefs.addEventListener(MouseEvent.CLICK, popupRefs);
							
							if (menuOpen == true) {
								removeSubMenuButtons();		
							}
							
							refsOpen = false;
						}
					
					}
					
			}
			// END CHECK ANSWER METHOD
			
		}		
		
	/*************************************************************/
		// Method for stage - Next
		public function f_next(e:MouseEvent):void {
			
			clickSound.play();	

			// Remove all stage assets
			removeAllAssets();
			
			menuOpen = false;
			
			// Fade up App Music
			if (muteTrueOrFalse == true && stoppedByUser == false) {
				delay = new Timer(25,50);
				delay.addEventListener(TimerEvent.TIMER, volumeFadeDelayListener3);
				delay.start();
				
				soundI = .00;
	
				function volumeFadeDelayListener3(e:TimerEvent):void {
					soundI = soundI + .01;
					appMusicFadeTrans = new SoundTransform(soundI, 0);	
					appMusicChannel.soundTransform = appMusicFadeTrans;
					muteTrueOrFalse = false;
				}	
			}
			
			// Increment questions by one then process the next question
			// 1 player game
			if (playerNumber == 1) {
				playerUp = 1;
				questionCount1++;
				PlayGame(playerUp);
			} else {
				// 2 player game
				if (tieGame == true) {
					playerUp = 2;	
					questionCount2++;
					PlayGame(playerUp);
				} else {
					if (playerUp == 1) {
						playerUp = 2;	
						questionCount2++;
						PlayGame(playerUp);
					} else {
						playerUp = 1;
						questionCount1++;
						PlayGame(playerUp);
					}
				}
				
			}
			
		}
		
	/*************************************************************/
		// Method for stage - End of Game
		public function endOfGame():void {
			
			if (playerNumber == 1) {
			// 1 PLAYER GAME	
				// Remove all stage assets
				removeAllAssets();
				
				finaleApplauseSound.play();
					
				// Add this screen's primary assets to stage from library
				addChild(setAndGetWhiteBG1());
				addChild(setAndGetBall2BG1());
				addChild(setAndGetBottomBG());			
				addChild(setAndGetHeader());
				addChild(setAndGetFooter());
				addChild(setAndGetBorder1());
				addChild(setAndGetCloseAppButton());
				addChild(setAndGetScoreboard());					
				mcScoreboard.mc_redbar_01.width = mcScoreboard.mc_redbar_01.width - (player1Score * SCOREVALUE);
				mcScoreboard.txt_Score1.htmlText = "<b>" + (100 - (player1Score * 10)) + "</b>";
				
				// Set and display Text Block 4
				mcTextBlock4 = new mc_TextBlock4();
				mcTextBlock4.x = STAGEWIDTH/2;
				mcTextBlock4.y = STAGEHEIGHT/2 - 100.0;	
				addChild(mcTextBlock4);	
				
				// Adjust Scoreboard
				mcScoreboard.mc_powerfulpancreasfilter.visible = false;
				mcScoreboard.mc_scoreboardTeam2Name.visible = false;
				mcScoreboard.mc_scoreboardTeam2Grid.visible = false;
				mcScoreboard.mc_grnbar_01.visible = false;
				mcScoreboard.txt_Score2.visible = false;
				mcScoreboard.mc_pointer2.visible = false;
				mcScoreboard.mc_scoreboardGridBG_02.visible = false;				
				
				// Add Muscles to stage from library
				mcMuscles01 = new mc_Muscles_01();
				mcMuscles01.x = 58.0;
				mcMuscles01.y = 122.1;
				mcMuscles01.scaleX = .80;
				mcMuscles01.scaleY = .80;
				mcMuscles01.rotation = -10;
				addChild(mcMuscles01);	
				
				// Add Menu Button to stage from library
				addChild(setAndGetMenuButton());
				btnMenu.addEventListener(MouseEvent.MOUSE_OVER, menuMouseOver);
				
				// After 5 second delay add mask slowly then bring in final frame image
				delay = new Timer(5000,1);
				delay.addEventListener(TimerEvent.TIMER, whiteBGDelayListener);
				delay.start();
				
				function whiteBGDelayListener(e:TimerEvent):void {
					mcWhiteBG1 = new mc_whitebg_01();
					mcWhiteBG1.x = 0;
					mcWhiteBG1.y = 0;
					mcWhiteBG1.alpha = 0;
					addChild(mcWhiteBG1);
					
					mcFinalFrameBG01 = new mc_finalFrameBG_01();
					mcFinalFrameBG01.x = 0;
					mcFinalFrameBG01.y = 0;
					mcFinalFrameBG01.alpha = 0;
					backgroundActosAnime(25);
					addChild(mcFinalFrameBG01);
					addChild(setAndGetGoldBG1());
					addChild(setAndGetBorder1());	
					
					gs.TweenLite.to(mcWhiteBG1, 2.00, {alpha:1.0});
					gs.TweenLite.to(mcFinalFrameBG01, .50, {alpha:1.0});
					removeChild(btnMenu);
					
					// Set and display Text Block 5
					mcTextBlock5 = new mc_TextBlock5();
					mcTextBlock5.x = STAGEWIDTH/2;
					mcTextBlock5.y = STAGEHEIGHT/2 - 310.0;	
					addChild(mcTextBlock5);
					
						// Delay then bring in Game Over button
						delay = new Timer(1000,1);
						delay.addEventListener(TimerEvent.TIMER, btnGameOverDelayListener);
						delay.start();
						
						function btnGameOverDelayListener(e:TimerEvent):void {
							addChild(setAndGetGameOverButton());
							addChild(setAndGetPlayAgainButton());
						}
				}				
				
			} else {
			// 2 PLAYER GAME	
				// Tie-Breaker check
				if (player1Score == player2Score && questionCount1 < TIEBREAKER && questionCount2 < TIEBREAKER) {
					//trace('tie yes' + '<br>');
					//trace("P1: " + player1Score + ", P2: " + player2Score + ", QCount1: " + questionCount1 + ", QCount2: " + questionCount2 + ", TB: " + TIEBREAKER);
					// Remove all stage assets
					removeAllAssets();
					
					// Add this screen's primary assets to stage from library
					addChild(setAndGetWhiteBG1());
					backgroundActosAnime(25);
					addChild(setAndGetHeader());
					addChild(setAndGetGoldBG1());
					addChild(setAndGetBorder1());
					addChild(setAndGetCloseAppButton());
					
					// Set and display Text Block 1
					mcTextBlock7 = new mc_TextBlock7();
					mcTextBlock7.x = STAGEWIDTH/2;
					mcTextBlock7.y = STAGEHEIGHT/2 - 100.0;	
					addChild(mcTextBlock7);
	
					// Play app music
					tickTockSoundChannel = tickTockSound.play(0,25);
					
					// After 5 second delay add mask slowly then bring in final frame image
					delay = new Timer(5000,1);
					delay.addEventListener(TimerEvent.TIMER, tiebreakerDelayListener);
					delay.start();
					
					function tiebreakerDelayListener(e:TimerEvent):void {
						mcWhiteBG1 = new mc_whitebg_01();
						mcWhiteBG1.x = 0;
						mcWhiteBG1.y = 0;
						mcWhiteBG1.alpha = 0;
						addChild(mcWhiteBG1);
						
						gs.TweenLite.to(mcWhiteBG1, 1.50, {alpha:1.0});
						
						delay = new Timer(1500,1);
						delay.addEventListener(TimerEvent.TIMER, tiebreakerStartListener);
						delay.start();
					
						function tiebreakerStartListener(e:TimerEvent):void {
							removeChild(mcTextBlock7);
							removeChild(mcWhiteBG1);
							//LOGIC FOR TIE-BREAKER ROUND
							questionTotal1 = TIEBREAKER;
							questionTotal2 = TIEBREAKER;
							playerUp = 1;
							PlayGame(playerUp);
							tieGame = true;
						}
						
					}
					
				} else {
					
					// TRULY THE END OF GAME
					
					// Remove all stage assets
					removeAllAssets();
					
					if (tieGame == true) {
						tickTockSoundChannel.stop();
					}
					
					finaleApplauseSound.play();

					// Add this screen's primary assets to stage from library
					addChild(setAndGetWhiteBG1());
					addChild(setAndGetBall2BG1());
					addChild(setAndGetBottomBG());			
					addChild(setAndGetHeader());
					addChild(setAndGetFooter());
					addChild(setAndGetBorder1());
					addChild(setAndGetCloseAppButton());
					addChild(setAndGetScoreboard());					
					mcScoreboard.mc_redbar_01.width = mcScoreboard.mc_redbar_01.width - (player1Score * SCOREVALUE);
					mcScoreboard.txt_Score1.htmlText = "<b>" + (100 - (player1Score * 10)) + "</b>";
					
					// Set and display Text Block 4
					mcTextBlock4 = new mc_TextBlock4();
					mcTextBlock4.x = STAGEWIDTH/2;
					mcTextBlock4.y = STAGEHEIGHT/2 - 100.0;	
					addChild(mcTextBlock4);
					
						// Adjust Scoreboard
						mcScoreboard.mc_grnbar_01.width = mcScoreboard.mc_grnbar_01.width - (player2Score * SCOREVALUE);
						mcScoreboard.txt_Score2.htmlText = "<b>" + (100 - (player2Score * 10)) + "</b>";
					
						if (player1Score > player2Score) {
							
							// Add Muscles to stage from library
							mcMuscles01 = new mc_Muscles_01();
							mcMuscles01.x = 58.0;
							mcMuscles01.y = 122.1;
							mcMuscles01.scaleX = .80;
							mcMuscles01.scaleY = .80;
							mcMuscles01.rotation = -10;
							addChild(mcMuscles01);
							
							// Adjust Scoreboard
							mcScoreboard.mc_powerfulpancreasfilter.visible = false;
							mcScoreboard.mc_scoreboardTeam2Name.visible = false;
							mcScoreboard.mc_scoreboardTeam2Grid.visible = false;
							mcScoreboard.mc_grnbar_01.visible = false;
							mcScoreboard.txt_Score2.visible = false;
							mcScoreboard.mc_pointer2.visible = false;
							mcScoreboard.mc_scoreboardGridBG_02.visible = false;	
							
						} else if (player1Score == player2Score) {					
							
							// Add Muscles to stage from library
							mcMuscles01 = new mc_Muscles_01();
							mcMuscles01.x = 58.0;
							mcMuscles01.y = 122.1;
							mcMuscles01.scaleX = .80;
							mcMuscles01.scaleY = .80;
							mcMuscles01.rotation = -10;
							addChild(mcMuscles01);
							
							// Add Pancreas to stage from library
							mcPancreas02 = new mc_Pancreas_02();
							mcPancreas02.x = 680.0;
							mcPancreas02.y = 185.6;
							mcPancreas02.scaleX = .80;
							mcPancreas02.scaleY = .80;
							mcPancreas02.rotation = 0;
							addChild(mcPancreas02);
							
						} else {					
							
							// Add Pancreas to stage from library
							mcPancreas02 = new mc_Pancreas_02();
							mcPancreas02.x = 680.0;
							mcPancreas02.y = 185.6;
							mcPancreas02.scaleX = .80;
							mcPancreas02.scaleY = .80;
							mcPancreas02.rotation = 0;
							addChild(mcPancreas02);
						}
					
					// Add Menu Button to stage from library
					addChild(setAndGetMenuButton());
					btnMenu.addEventListener(MouseEvent.MOUSE_OVER, menuMouseOver);
					
					// After 5 second delay add mask slowly then bring in final frame image
					delay = new Timer(5000,1);
					delay.addEventListener(TimerEvent.TIMER, whiteBGDelayListener2);
					delay.start();
					
					function whiteBGDelayListener2(e:TimerEvent):void {
						mcWhiteBG1 = new mc_whitebg_01();
						mcWhiteBG1.x = 0;
						mcWhiteBG1.y = 0;
						mcWhiteBG1.alpha = 0;
						addChild(mcWhiteBG1);
						
						mcFinalFrameBG01 = new mc_finalFrameBG_01();
						mcFinalFrameBG01.x = 0;
						mcFinalFrameBG01.y = 0;
						mcFinalFrameBG01.alpha = 0;
						backgroundActosAnime(25);
						addChild(mcFinalFrameBG01);
						addChild(setAndGetGoldBG1());
						addChild(setAndGetBorder1());	
						
						gs.TweenLite.to(mcWhiteBG1, 2.00, {alpha:1.0});
						gs.TweenLite.to(mcFinalFrameBG01, .50, {alpha:1.0});
						removeChild(btnMenu);
						
						// Set and display Text Block 5
						mcTextBlock5 = new mc_TextBlock5();
						mcTextBlock5.x = STAGEWIDTH/2;
						mcTextBlock5.y = STAGEHEIGHT/2 - 310.0;	
						addChild(mcTextBlock5);
						
							// Delay then bring in Game Over button
							delay = new Timer(1000,1);
							delay.addEventListener(TimerEvent.TIMER, btnGameOverDelayListener2);
							delay.start();
							
							function btnGameOverDelayListener2(e:TimerEvent):void {
								addChild(setAndGetGameOverButton());
								addChild(setAndGetPlayAgainButton());
							}
					}
					
				}
				
			}
			
		}
		
	/*************************************************************/
		// Method for stage - Close App
		public function closeApp(e:MouseEvent):void {
			
			closeAppOpen = true;
			clickSound.play();	
			
			addChild(setAndGetBorder1());			
						
			// Add shadow to stage from library
			mcCloseAppShadow = new mc_shadow_01();
			mcCloseAppShadow.x = 0.0;
			mcCloseAppShadow.y = 0.0;
			addChild(mcCloseAppShadow);
			
			// Add Quiz Copy Box 2 to stage from library
			mcQuizCopyBox2 = new mc_quizCopyBox2();
			mcQuizCopyBox2.x = STAGEWIDTH/2 - 300.0;
			mcQuizCopyBox2.y = STAGEHEIGHT/2 - (475 / 2);
			mcQuizCopyBox2.width = 600.0;
			addChild(mcQuizCopyBox2);	
			
			// Set and display Text Block 3
			mcTextBlock3 = new mc_TextBlock3();
			mcTextBlock3.x = STAGEWIDTH/2;
			mcTextBlock3.y = STAGEHEIGHT/2 - 100.0;	
			addChild(mcTextBlock3);	
			
			// Set and display Yes button
			btnYes = new btn_yes_01();
			btnYes.x = (STAGEWIDTH/2 - 300.0) + 70.0;
			btnYes.y = (STAGEHEIGHT/2 - (475 / 2)) + 390.0;
			addChild(btnYes);
			btnYes.addEventListener(MouseEvent.CLICK, yesCloseApp);
			
			function yesCloseApp(e:MouseEvent):void {
				clickSound.play();	
				fscommand("quit");	
			}		
			
			// Set and display No button
			btnNo = new btn_no_01();
			btnNo.x = (STAGEWIDTH/2 - 300.0) + 405.0;
			btnNo.y = (STAGEHEIGHT/2 - (475 / 2)) + 390.0;
			addChild(btnNo);
			btnNo.addEventListener(MouseEvent.CLICK, noCloseApp);
			
			function noCloseApp(e:MouseEvent):void {
				clickSound.play();	
				removeChild(mcCloseAppShadow);
				removeChild(mcQuizCopyBox2);
				removeChild(mcTextBlock3);
				removeChild(btnYes);
				removeChild(btnNo);
			}			
			
		}					
		
	/*************************************************************/
		// Method for Menu Button - Mouse Over
		public function menuMouseOver(e:MouseEvent):void {

			if (menuOpen == false) {
				btnMenu.removeEventListener(MouseEvent.MOUSE_OVER, menuMouseOver);
				btnMenu.addEventListener(MouseEvent.CLICK, menuClick);
				
				// Add sub buttons for Menu Button to stage from library
				addChild(setAndGetMenuMaskButton());
				btnSafety = new btn_safety_01();
				btnSafety.x = btnMenu.x;
				btnSafety.y = btnMenu.y;
				btnSafety.width = 164.7;
				btnSafety.height = 60.1;					
				addChildAt(btnSafety, getChildIndex(btnMenu));
				gs.TweenLite.to(btnSafety, .05, {y:"-40.0"});
				btnSafety.addEventListener(MouseEvent.CLICK, safetyClick);
				
				delay = new Timer(50,1);
				delay.addEventListener(TimerEvent.TIMER, btnMuteDelayListener);
				delay.start();
				
				function btnMuteDelayListener(e:TimerEvent):void {
					
					btnUnMute = new btn_unmute_01();
					btnUnMute.x = btnSafety.x;
					btnUnMute.y = btnSafety.y;
					btnUnMute.width = 164.7;
					btnUnMute.height = 60.1;					
					addChildAt(btnUnMute, getChildIndex(btnSafety));				
					gs.TweenLite.to(btnUnMute, .05, {y:"-40.0"});
					btnUnMute.addEventListener(MouseEvent.CLICK, unmuteClick);
					
					btnMute = new btn_mute_01();
					btnMute.x = btnSafety.x;
					btnMute.y = btnSafety.y;
					btnMute.width = 164.7;
					btnMute.height = 60.1;					
					addChildAt(btnMute, getChildIndex(btnSafety));				
					gs.TweenLite.to(btnMute, .05, {y:"-40.0"});
					btnMute.addEventListener(MouseEvent.CLICK, muteClick);					
	
					if (muteTrueOrFalse == true && stoppedByUser == true) {
						btnUnMute.visible = true;
						btnMute.visible = false;
					} else if (muteTrueOrFalse == false && stoppedByUser == true) {
						btnUnMute.visible = false;
						btnMute.visible = true;
					} else {
						btnUnMute.visible = false;
						btnMute.visible = true;
					}
					
				}
				
				menuOpen = true;
				
			}
						
		}
		
	/*************************************************************/		
		// Method for Menu Button - Click
		public function menuClick(e:MouseEvent):void {
			
			clickSound.play();	
			
			// Remove sub buttons for Menu Button from stage
			if (btnSafety) {
				btnSafety.visible = false;
			}
			if (btnMute) {
				btnMute.visible = false;
			}
			if (btnUnMute) {
				btnUnMute.visible = false;
			}			
			if (btnMenuMask) {
				btnMenuMask.visible = false;
			}			
			
			btnMenu.addEventListener(MouseEvent.MOUSE_OVER, menuMouseOver);
			btnMenu.removeEventListener(MouseEvent.CLICK, menuClick);
			
			menuOpen = false;
			
		}		
		
	/*************************************************************/		
		// Method for Safety Button - Click
		public function safetyClick(e:MouseEvent):void {
			
			if (safetyOpen == false) {
				clickSound.play();
				
				// Remove sub buttons for Menu Button from stage
				if (menuOpen == true) {
					removeSubMenuButtons();		
				};		
				
				btnSafety.removeEventListener(MouseEvent.CLICK, safetyClick);
				btnMenu.removeEventListener(MouseEvent.CLICK, menuClick);
				
				// Repurpose Large Image Holder to stage from library for pop up window purposes
				mcSafetyLargeImageHolder = new mc_LargeImageHolder();
				mcSafetyLargeImageHolder.x = STAGEWIDTH/2 - (mcSafetyLargeImageHolder.width/2);
				mcSafetyLargeImageHolder.y = STAGEHEIGHT/2 - (mcSafetyLargeImageHolder.height/2);
				addChild(mcSafetyLargeImageHolder);
				
				// Add shadow to stage from library
				mcSafetyShadow = new mc_shadow_01();
				mcSafetyShadow.x = 0.0;
				mcSafetyShadow.y = 67.0;
				mcSafetyShadow.width = 1024.0;
				mcSafetyShadow.height = 578.0;
				addChildAt(mcSafetyShadow, getChildIndex(mcSafetyLargeImageHolder));
				
				// Add Safety Scroll Box to pop up
				mcSafetyScrollBox01 = new mc_SafetyScrollBox_01();
				mcSafetyScrollBox01.x = 170;
				mcSafetyScrollBox01.y = 120;
				addChild(mcSafetyScrollBox01);
				
				// Add PPI buttons
				btnPPIACTOS = new btn_PPI_ACTOS();
				btnPPIACTOS.x = 150.0;
				btnPPIACTOS.y = 600.0;
				addChild(btnPPIACTOS);
				btnPPIACTOS.addEventListener(MouseEvent.CLICK, getPPIACTOS);	
				function getPPIACTOS(e:MouseEvent) {
					var requestPPIACTOS:URLRequest = new URLRequest("documents/ACTOS_PPI.pdf");
					navigateToURL(requestPPIACTOS);
					
					delay = new Timer(250,1);
					delay.addEventListener(TimerEvent.TIMER, fullScreen1);
					delay.start();
					
					/*************************************************************/	
					// Method for setting app to full screen
					function fullScreen1(e:TimerEvent):void {
						
						removeChild(btnPPIACTOS);
						btnPPIACTOS = new btn_PPI_ACTOS();
						btnPPIACTOS.x = 150.0;
						btnPPIACTOS.y = 600.0;
						addChild(btnPPIACTOS);
						btnPPIACTOS.addEventListener(MouseEvent.CLICK, getPPIACTOS);	
						
						// Set screen size display params
						fscommand("fullscreen","true");
						fscommand("allowscale","false");
						
						delay.removeEventListener(TimerEvent.TIMER, fullScreen1);
						delay.stop();
						
					}						
					
				}	
				
				btnPPIACTOPLUSMET = new btn_PPI_ACTOPLUSMET();
				btnPPIACTOPLUSMET.x = 390.0;
				btnPPIACTOPLUSMET.y = 600.0;
				addChild(btnPPIACTOPLUSMET);
				btnPPIACTOPLUSMET.addEventListener(MouseEvent.CLICK, getPPIACTOPLUSMET);
				function getPPIACTOPLUSMET(e:MouseEvent) {
					var requestPPIACTOPLUSMET:URLRequest = new URLRequest("documents/ACTOplusmet_PPI.pdf");
					navigateToURL(requestPPIACTOPLUSMET);
					
					delay = new Timer(250,1);
					delay.addEventListener(TimerEvent.TIMER, fullScreen2);
					delay.start();
					
					/*************************************************************/	
					// Method for setting app to full screen
					function fullScreen2(e:TimerEvent):void {
						
						removeChild(btnPPIACTOPLUSMET);
						btnPPIACTOPLUSMET = new btn_PPI_ACTOPLUSMET();
						btnPPIACTOPLUSMET.x = 390.0;
						btnPPIACTOPLUSMET.y = 600.0;
						addChild(btnPPIACTOPLUSMET);
						btnPPIACTOPLUSMET.addEventListener(MouseEvent.CLICK, getPPIACTOPLUSMET);
						
						// Set screen size display params
						fscommand("fullscreen","true");
						fscommand("allowscale","false");
						
						delay.removeEventListener(TimerEvent.TIMER, fullScreen2);
						delay.stop();
						
					}						
					
				}				
				
				btnPPIDUETACT = new btn_PPI_DUETACT();
				btnPPIDUETACT.x = 630.0;
				btnPPIDUETACT.y = 600.0;
				addChild(btnPPIDUETACT);
				btnPPIDUETACT.addEventListener(MouseEvent.CLICK, getPPIDUETACT);
				function getPPIDUETACT(e:MouseEvent) {
					var requestPPIDUETACT:URLRequest = new URLRequest("documents/Duetact_PPI.pdf");
					navigateToURL(requestPPIDUETACT);	
					
					delay = new Timer(250,1);
					delay.addEventListener(TimerEvent.TIMER, fullScreen3);
					delay.start();
					
					/*************************************************************/	
					// Method for setting app to full screen
					function fullScreen3(e:TimerEvent):void {
						
						removeChild(btnPPIDUETACT);	
						btnPPIDUETACT = new btn_PPI_DUETACT();
						btnPPIDUETACT.x = 630.0;
						btnPPIDUETACT.y = 600.0;
						addChild(btnPPIDUETACT);
						btnPPIDUETACT.addEventListener(MouseEvent.CLICK, getPPIDUETACT);
						
						// Set screen size display params
						fscommand("fullscreen","true");
						fscommand("allowscale","false");
						
						delay.removeEventListener(TimerEvent.TIMER, fullScreen3);
						delay.stop();
						
					}								
					
				}				
				
				// Add Close Button and method for Safety Info pop up
				btnSafetyClosePopUp = new btn_closeapp_01();
				btnSafetyClosePopUp.x = 860.0;
				btnSafetyClosePopUp.y = 110.0;
				addChild(btnSafetyClosePopUp);
				btnSafetyClosePopUp.addEventListener(MouseEvent.CLICK, closeSafetyPopUp);	
				
				// Add Menu Button to stage from library
				if (btnMenu) {
					removeChild(btnMenu);
					addChild(setAndGetMenuButton());
					btnMenu.addEventListener(MouseEvent.MOUSE_OVER, menuMouseOver);
				}
				
				safetyOpen = true;
			}
			
		}
	
	/*************************************************************/
		// Method for closing the Safety Info pop up
		public function closeSafetyPopUp(e:MouseEvent):void {
			removeChild(mcSafetyShadow);
			removeChild(btnPPIACTOS);
			removeChild(btnPPIACTOPLUSMET);
			removeChild(btnPPIDUETACT);
			removeChild(mcSafetyScrollBox01);
			removeChild(mcSafetyLargeImageHolder);
			removeChild(btnSafetyClosePopUp);
			btnSafety.addEventListener(MouseEvent.CLICK, safetyClick);
			btnMenu.addEventListener(MouseEvent.MOUSE_OVER, menuMouseOver);
			
			safetyOpen = false;
			
		}	
		
		
	/*************************************************************/		
		// Method for Mute Button - Click
		public function muteClick(e:MouseEvent):void {

			if (muteTrueOrFalse == false) {	
				clickSound.play();
				
				// Remove sub buttons for Menu Button from stage
				removeSubMenuButtons();
				
				btnMute.removeEventListener(MouseEvent.CLICK, muteClick);						
				btnMenu.addEventListener(MouseEvent.MOUSE_OVER, menuMouseOver);
	
				// Fade down App Music
				delay = new Timer(25,50);
				delay.addEventListener(TimerEvent.TIMER, volumeFadeDelayListener4);
				delay.start();
				
				soundI = .50;
	
				function volumeFadeDelayListener4(e:TimerEvent):void {
					soundI = soundI - .01;
					appMusicFadeTrans = new SoundTransform(soundI, 0);	
					appMusicChannel.soundTransform = appMusicFadeTrans;
					muteTrueOrFalse = true;
				}	
				
				stoppedByUser = true;
			}
		
		}		
		
	/*************************************************************/		
		// Method for UnMute Button - Click
		public function unmuteClick(e:MouseEvent):void {
			
			clickSound.play();
			
			// Remove sub buttons for Menu Button from stage
			removeSubMenuButtons();		
			
			btnUnMute.removeEventListener(MouseEvent.CLICK, unmuteClick);						
			btnMenu.addEventListener(MouseEvent.MOUSE_OVER, menuMouseOver);
			
			// Fade up App Music
			delay = new Timer(25,50);
			delay.addEventListener(TimerEvent.TIMER, volumeFadeDelayListener5);
			delay.start();
			
			soundI = .00;

			function volumeFadeDelayListener5(e:TimerEvent):void {
				soundI = soundI + .01;
				appMusicFadeTrans = new SoundTransform(soundI, 0);	
				appMusicChannel.soundTransform = appMusicFadeTrans;
				muteTrueOrFalse = false;
			}
		
		}				
		
	/*************************************************************/
		// Method for stage - Game Over
		public function gameOver(e:MouseEvent):void {
			
			fscommand("quit");
			
		}	
		
	/*************************************************************/
		// Method for stage - Play Again
		public function playAgain(e:MouseEvent):void {
			
			// Re-initialize default app variable settings
			arrAllCategories = new Array();
			arrAllQuestions = new Array();
			arrCategoryQuestions = new Array();
			arrQuestionAnswers = new Array();
			arrPlayer1Questions = new Array();
			arrPlayer2Questions = new Array();
			arrAllAnswers = new Array();
			arrPlayer1Answers = new Array();
			arrPlayer2Answers = new Array();		
			arrTempQuestionHolder = new Array();
			arrTempAnswerHolder = new Array();
			mcChecked1 = false;
			mcChecked2 = false;
			playerNumber = 1;
			questionNumber0 = 0;
			questionCount1 = 0;
			questionCount2 = -1;
			player1Score = 0;
			player2Score = 0;
			playerUp = 1;
			copyWidth = 0;
			numberOfQuestions1 = 0;
			numberOfQuestions2 = 0;
			questionTotal1 = 0;
			questionTotal2 = 0;
			numCount = 0;
			tieGame = false;
			safetyOpen = false;
			closeAppOpen = false;
			appMusicDone = false;
			menuOpen = false;
			refsOpen = false;
			studyInfoOpen = false;
			largeImageOpen = false;
			if (stoppedByUser == true) {
				stoppedByUser = true;
				muteTrueOrFalse = true;
			} else {
				stoppedByUser = false;
				muteTrueOrFalse = false;
			}
				
			setAllCategoriesAndQuestions();
			setQuizInstructions(quizCopy.quizinstructions.toString());
			
			fromEOG = true;
			
			stageBeginGame();
			
		}
		
	/*************************************************************/
		// Method for Tween - Stage Display Object Cover-Up		
		public function questionBoxCoverUp(duration,posX,posY,boxwidth,boxheight):void {
			// Tween - White BG for Question Box Cover-Up
			mcWhiteBG1 = new mc_whitebg_01();
			mcWhiteBG1.x = posX;
			mcWhiteBG1.y = posY;
			mcWhiteBG1.width = boxwidth;
			mcWhiteBG1.height = boxheight;
			mcWhiteBG1.alpha = 1.0;
			addChild(mcWhiteBG1);
			gs.TweenLite.to(mcWhiteBG1, duration, {alpha:0});
			
			delay = new Timer((duration*1000),1);
			delay.addEventListener(TimerEvent.TIMER, stageDisplayObjectCoverUpListener);
			delay.start();
		
			function stageDisplayObjectCoverUpListener(e:TimerEvent):void {
				removeChild(mcWhiteBG1);
			}	
		}
		
	/*************************************************************/	
		// Method for closing the Safety Info pop up
		public function closeSafetyPopUp2():void {
			mcSafetyShadow.visible = false;
			btnPPIACTOS.visible = false;
			btnPPIACTOPLUSMET.visible = false;
			btnPPIDUETACT.visible = false;
			mcSafetyScrollBox01.visible = false;
			mcSafetyLargeImageHolder.visible = false;
			btnSafetyClosePopUp.visible = false;
			
			btnSafety.addEventListener(MouseEvent.CLICK, safetyClick);
			btnMenu.addEventListener(MouseEvent.MOUSE_OVER, menuMouseOver);
		}
		
	/*************************************************************/	
		// Method for closing the Close App pop up
		public function closeCloseAppPopUp():void {
			mcCloseAppShadow.visible = false;
			mcQuizCopyBox2.visible = false;
			mcTextBlock3.visible = false;
			btnYes.visible = false;
			btnNo.visible = false;
		}			
		
		/*************************************************************/	
		// Method for stopping initial App Music and restarting lower volume music
		public function onPlaybackComplete(e:Event):void {
			
			appMusicDone = true;
			
			if (muteTrueOrFalse == false) {
				appMusicTrans = new SoundTransform(0.50, 0);
				appMusicChannel = appMusic.play(0,100,appMusicTrans);
			} else {
				appMusicTrans = new SoundTransform(0.00, 0);
				appMusicChannel = appMusic.play(0,100,appMusicTrans);
			}
			
		}
		
		/*************************************************************/	
		// Method for removing the sub menu buttons from the Menu Button
		public function removeSubMenuButtons():void {
			
			if (btnSafety) {
				removeChild(btnSafety);
			}
			if (btnMute) {
				removeChild(btnMute);
			}
			if (btnUnMute) {
				removeChild(btnUnMute);
			}			
			if (btnMenuMask) {
				removeChild(btnMenuMask);
			}	
			
			btnMenu.addEventListener(MouseEvent.MOUSE_OVER, menuMouseOver);
			menuOpen = false;
			
		}	
		
	}
	
}