package com.ruoyi.blog.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.blog.mapper.RelationshipsMapper;
import com.ruoyi.blog.domain.Relationships;
import com.ruoyi.blog.service.IRelationshipsService;
import com.ruoyi.common.support.Convert;

/**
 * 内容与项目关系 服务层实现
 * 
 * @author lw
 * @date 2018-12-14
 */
@Service
public class RelationshipsServiceImpl implements IRelationshipsService 
{
	@Autowired
	private RelationshipsMapper relationshipsMapper;

	/**
     * 查询内容与项目关系信息
     * 
     * @param cid 内容与项目关系ID
     * @return 内容与项目关系信息
     */
    @Override
	public Relationships selectRelationshipsById(Integer cid)
	{
	    return relationshipsMapper.selectRelationshipsById(cid);
	}
	
	/**
     * 查询内容与项目关系列表
     * 
     * @param relationships 内容与项目关系信息
     * @return 内容与项目关系集合
     */
	@Override
	public List<Relationships> selectRelationshipsList(Relationships relationships)
	{
	    return relationshipsMapper.selectRelationshipsList(relationships);
	}
	
    /**
     * 新增内容与项目关系
     * 
     * @param relationships 内容与项目关系信息
     * @return 结果
     */
	@Override
	public int insertRelationships(Relationships relationships)
	{
	    return relationshipsMapper.insertRelationships(relationships);
	}
	
	/**
     * 修改内容与项目关系
     * 
     * @param relationships 内容与项目关系信息
     * @return 结果
     */
	@Override
	public int updateRelationships(Relationships relationships)
	{
	    return relationshipsMapper.updateRelationships(relationships);
	}

	/**
     * 删除内容与项目关系对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
	@Override
	public int deleteRelationshipsByIds(String ids)
	{
		return relationshipsMapper.deleteRelationshipsByIds(Convert.toStrArray(ids));
	}
	
}
