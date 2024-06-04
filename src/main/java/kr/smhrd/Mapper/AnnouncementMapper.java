package kr.smhrd.Mapper;

import java.util.List;

import kr.smhrd.entity.Announcement;

public interface AnnouncementMapper {

	public int insertAnn(Announcement announcement);

	public List<Announcement> selectAllAnn();

	public Announcement selectAnn(int ann_num);

	public Announcement selectANNF();

}
