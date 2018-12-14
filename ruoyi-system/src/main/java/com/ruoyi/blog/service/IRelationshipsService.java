package com.ruoyi.blog.service;

import com.ruoyi.blog.domain.Relationships;
import java.util.List;

/**
 * 内容与项目关系 服务层
 * 
 * @author lw
 * @date 2018-12-14
 */
public interface IRelationshipsService 
{
	/**
     * 查询内容与项目关系信息
     * 
     * @param cid 内容与项目关系ID
     * @return 内容与项目关系信息
     */
	public Relationships selectRelationshipsById(Integer cid);
	
	/**
     * 查询内容与项目关系列表
     * 
     * @param relationships 内容与项目关系信息
     * @return 内容与项目关系集合
     */
	public List<Relationships> selectRelationshipsList(Relationships relationships);
	
	/**
     * 新增内容与项目关系
     * 
     * @param relationships 内容与项目关系信息
     * @return 结果
     */
	public int insertRelationships(Relationships relationships);
	
	/**
     * 修改内容与项目关系
     * 
     * @param relationships 内容与项目关系信息
     * @return 结果
     */
	public int updateRelationships(Relationships relationships);
		
	/**
     * 删除内容与项目关系信息
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	public int deleteRelationshipsByIds(String ids);
	
}
