package spring.project.tcat.persistence;



import java.util.Map;

import org.springframework.stereotype.Repository;


import spring.project.tcat.config.Configuration;

@Repository
public class YMGuestDAOImpl implements YMGuestDAO{
	
	//고객 구매횟수
	@Override
	public int mRating(String strId) {
		int cnt=0;
		YMGuestDAO dao= Configuration.getMapper(YMGuestDAO.class);
		cnt=dao.mRating(strId);
		return cnt;
	}
	//등급 업데이트
	@Override
	public int mRatingUpdate(Map<String,Object> map) {
		int upCnt=0;
		YMGuestDAO dao= Configuration.getMapper(YMGuestDAO.class);
		upCnt=dao.mRatingUpdate(map);
		return upCnt;
	}
	//A등급 1년 구매
	@Override
	public int dayCnt(Map<String, Object> map) {
		int sRank=0;
		YMGuestDAO dao= Configuration.getMapper(YMGuestDAO.class);
		sRank=dao.dayCnt(map);
		return sRank;
	}
	//S등급 1년 구매
		@Override
		public int dayCnt1(Map<String, Object> map) {
			int vRank=0;
			YMGuestDAO dao= Configuration.getMapper(YMGuestDAO.class);
			vRank=dao.dayCnt1(map);
			return vRank;
		}
}
