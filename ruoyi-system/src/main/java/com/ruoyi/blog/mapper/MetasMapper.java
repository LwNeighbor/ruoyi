package com.ruoyi.blog.mapper;

import com.ruoyi.blog.domain.Metas;
import java.util.List;	

/**
 * 项目 数据层
 * 
 * @author lw
 * @date 2018-12-14
 */
public interface MetasMapper 
{
	/**
     * 查询项目信息
     * 
     * @param mid 项目ID
     * @return 项目信息
     */
	public Metas selectMetasById(Integer mid);
	
	/**
     * 查询项目列表
     * 
     * @param metas 项目信息
     * @return 项目集合
     */
	public List<Metas> selectMetasList(Metas metas);
	
	/**
     * 新增项目
     * 
     * @param metas 项目信息
     * @return 结果
     */
	public int insertMetas(Metas metas);
	
	/**
     * 修改项目
     * 
     * @param metas 项目信息
     * @return 结果
     */
	public int updateMetas(Metas metas);
	
	/**
     * 删除项目
     * 
     * @param mid 项目ID
     * @return 结果
     */
	public int deleteMetasById(Integer mid);
	
	/**
     * 批量删除项目
     * 
     * @param mids 需要删除的数据ID
     * @return 结果
     */
	public int deleteMetasByIds(String[] mids);
	
}