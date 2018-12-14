package com.ruoyi.blog.mapper;

import com.ruoyi.blog.domain.Options;
import java.util.List;	

/**
 * 配置 数据层
 * 
 * @author lw
 * @date 2018-12-14
 */
public interface OptionsMapper 
{
	/**
     * 查询配置信息
     * 
     * @param name 配置ID
     * @return 配置信息
     */
	public Options selectOptionsById(String name);
	
	/**
     * 查询配置列表
     * 
     * @param options 配置信息
     * @return 配置集合
     */
	public List<Options> selectOptionsList(Options options);
	
	/**
     * 新增配置
     * 
     * @param options 配置信息
     * @return 结果
     */
	public int insertOptions(Options options);
	
	/**
     * 修改配置
     * 
     * @param options 配置信息
     * @return 结果
     */
	public int updateOptions(Options options);
	
	/**
     * 删除配置
     * 
     * @param name 配置ID
     * @return 结果
     */
	public int deleteOptionsById(String name);
	
	/**
     * 批量删除配置
     * 
     * @param names 需要删除的数据ID
     * @return 结果
     */
	public int deleteOptionsByIds(String[] names);
	
}